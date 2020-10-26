# An example of pulling out the necessary details and returning json from a jbuilder file.

# /app/views/api/users/show.json.jbuilder
json.extract! @user, :id, :username
json.comments do
    @user.comments.each do |comment|
        json.set! comment.id do
            json.extract! comment, :id, :author_id, :body, :created_at
        end
    end
end

# You also want to set the default format of resources (in the config/routes.rb file) to :json.
# Then Rails will automatically look for a .json file when you pass a template name to #render
# (render :index for example).

namespace :api, defaults: { format: :json } do
    resources :pokemon, only: [:index, :show, :create, :destroy]
end
