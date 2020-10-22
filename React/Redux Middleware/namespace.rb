# A namespace is just a subset of controllers that live under a specific URL.

# config / routes.rb
namespace: api do
  resources: cats, only: [: index]
end

# Finally, we have to store our index.json.jbuilder view in the location
# app/views/api/cats/index.json.jbuilder so our new Api:CatsController can find it.
# Now we can access our api endpoint on localhost:3000/api/cats.

