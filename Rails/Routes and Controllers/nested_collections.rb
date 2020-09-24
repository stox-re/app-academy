# app/models/magazine.rb
class Magazine < ApplicationRecord
  has_many :articles
end

# app/models/article.rb
class Article < ApplicationRecord
  belongs_to :magazine
end

# config/routes.rb
NewspapersApp::Application.routes.draw do
  resources :magazines do
    # provides a route to get all the articles for a given magazine.
    resources :articles, only: :index
  end

  # provides all seven typical routes
  resources :articles
end

# This generates a /magazines/:magazine_id/articles route.
# Requests for this route will be sent to the ArticlesController#index action.

class ArticlesController
  def index
    if params.has_key?(:magazine_id)
      # index of nested resource
      @articles = Article.where(magazine_id: params[:magazine_id])
    else
      # index of top-level resource
      @articles = Article.all
    end

    render json: @articles
  end
end

# Restricting Member Routes
# Using :only as an option in the routes.rb, otherwise it would create all 7 typical routes