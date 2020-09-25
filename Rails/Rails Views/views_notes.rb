# Books Controller
class BooksController < ApplicationController
  def index
    @books = Books.all
    render :index
  end

  def show
    @book = Book.find_by_id(params[:id])
    if @book
      render :show
    else
      #redirect_to '/books'
      redirect_to books_url
    end
  end

  def new
    render :new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      # show the book page
      redirect_to book_url(@book) # Rails automatically pulls the id from the @book
    else
      # show the user the book form again
      render :new
    end
  end

  private
  def book_params
    params.require(:book).permit(:title, :author, :year, :description, :category)
  end

end

# index.html.erb file in views
<h1>All the books!</h1>

<!--
  <%# ruby code that will not be printed %>
  <%#= ruby code that is rendered %>
-->

<ul>
  <% @books.each do |book| %>
    <li><%= book.title %></li>
  <% end %>
</ul>

#------------------New------------------
<h1>Add New Book to library</h1>

# Action is the url to where we send data
# Method is the http method to use

#<form action="/books" method="post">
<form action="<%= books_url %>" method="post">

    <label for="title">Title</label>
    <input id="title" type="text" name="book[title]">

    <label for="author">Author</label>
    <input id="author" type="text" name="book[author]">

    <label for="year">Year</label>
    <input id="year" type="date" name="book[year]">

    <label for="category">Category</label>
    <select id="category" name="book[category]">
      <option disabled selected>--- Please select ---</option>
      <option value="Fiction">Fiction</option>
      <option value="Non-Fiction">Non-Fiction</option>
      <option value="Memoir">Memoir</option>
    </select>

    <label for="description">
    <textarea id="description" name="book[description]"></textarea>

    <input type="submit" value="Add book to library">
</form

#------------------Updating------------------
# In controller
def edit
  @book = Book.find_by({id: params[:id]})
  render :edit
end

def update
  @book = Book.find_by({id: params[:id]})
  if @book.update_attributes(book_params)
    redirect_to books_url(@book)
  else
    render :edit
  end
end

#------------ Debugging ---------------------
gem 'better_errors'
gem 'binding_of_caller'

# Use keyword:
fail

#------------ Partials ----------------------
<!-- app/views/user/new.html.erb -->
<%= render "form", user: @user, action: :new %>

<!-- app/views/user/edit.html.erb -->
<%= render "form", user: @user, action: :edit %>

<!-- app/views/user/_form.html.erb -->
<!-- Is this a new user to create, or an existing one to edit? -->
<% action_url = (action == :new) ? users_url : user_url(user) #%>

#<form action="<%= action_url %>" method="post">
#  <% if action == :edit %>
#    <input type="hidden" name="_method" value="patch">
#  <% end %>
#  <!-- inputs go here... -->
#</form>

#------------ Instance variables -------------

# app/controllers/products_controller.rb
class ProductsController < ApplicationController
  def index
    # get an array of all products, make it available to view
    @products = Product.all
    render :index
  end
end

<!-- app/views/products/index.html.erb -->
<h1>All the products!</h1>
<ul>
  <% @products.each do |product| %>
    <li>
      <%= product.name %>
    </li>
  <% end %>
</ul>

# link_to and button_to in ERB
<%= link_to 'Cat Pictures', "http://cashcats.biz" %>
<a href="http://cashcats.biz">Cat Pictures</a> <!-- output -->
<%= link_to 'New Comment', new_comment_url %>
<a href="<%= new_comment_url %>">New Comment</a> <!-- equivalent to the above code -->
<a href="www.example.com/comments/new">New Comment</a> <!-- output -->

<%= button_to 'Delete comment', comment_url(@comment), method: :delete %>
<form action="<%= comment_url(@comment) %>"  method="POST"> <!-- equivalent to the above -->
  <input type="hidden" value="delete" name="_method" />
  <input type="submit" value="Delete comment" />
</form>

# In console
Rack::Utils.parse_nested_query('name=fred&phone=0123456789')
# => {"name"=>"fred", "phone"=>"0123456789"}

# Arrays in forms
#When you want Rails to build an array, you append an empty set of square brackets to the name:
<input name="person[phone_numbers][]" type="text" value="555-123-4567">
<input name="person[phone_numbers][]" type="text" value="555-765-4321">
<input name="person[phone_numbers][]" type="text" value="555-135-2468">

{ 'person' => {
    'phone_numbers' => [
      '555-123-4567',
      '555-765-4321',
      '555-135-2468'
    ]
  }
}

# You can't create arrays of hashes
<input name="persons[][phone_number]" type="text" value="555-123-4567">
<input name="persons[][phone_number]" type="text" value="555-765-4321">
<input name="persons[][phone_number]" type="text" value="555-135-2468">
# This won't work
<input name="persons[0][phone_number]" type="text" value="555-123-4567">
<input name="persons[1][phone_number]" type="text" value="555-765-4321">
<input name="persons[2][phone_number]" type="text" value="555-135-2468">
{ 'persons' => {
    '0' => { 'phone_number' => '555-123-4567' },
    '1' => { 'phone_number' => '555-765-4321' },
    '2' => { 'phone_number' => '555-135-2468' }
  }
}