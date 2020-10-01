# Submitting with checkboxes
# <% Tag.all.each do |tag| %>
#   <label>
#     <input type="checkbox" name="cat[tag_ids][]" value="<%= tag.id %>">
#   </label>
# <% end %>

# cats with taggings
has_many :taggings, dependent: destroy, inverse_of: :cat

# this sets the cat_id on taggings to the cat_id when you do tag.cat

def cat_params
    params[:cat].permit(
      :name,
      :skill,
      :coat_color,
      :description,
      tag_ids: []
    )
end