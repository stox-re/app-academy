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