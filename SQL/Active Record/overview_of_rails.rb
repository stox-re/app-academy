--------------------------MVC--------------------------------------

# Rails is a MVC web application framework
# Model View Controller = MVC

# Model is in charge of retrieval of information from storage, and any logic done to it

# View is in charge of presenting information

# Controller is in charge of constructing HTTP response, and sends commands to the model to fetch or update information.
# It acts as an interface between the model and view

--------------------------Convention over Configuration----------------------------------

# Rails introduced the concept of Convention over Configuration
# If we have a cats databse table, the default model is called Cats, and the default controller is called CatsController
# Rails will automatically know how to load the application to tie everything together

--------------------------REST---------------------------------

# REST stands for: Representational State Transfer, and is an architectural style for web apps
# Access to web resources via standard operations, such as HTTP's GET, POST, PATCH, or DELETE

# RESTful web services are stateless; this means that each request/response cycle is independent
# of any other request/response cycle. The server will not retain any session information over
# multiple requests. However, data can be cached on the client side.

# Rails defaults to a RESTful API using its resources method,
# which automatically generates routes by linking HTTP verbs and URIs to controller actions.

------------------------Active Record and ActionContoller ----------------------------------------

# All models in Rails inherit from ActiveRecord. It is an ORM, object relational mapping
# ActionController handles controller logic. Allows for access to various cookies.
# It can also provide protection against cross site forgery attacks (CSRA) by checking the presence
# of authenticity tokens in requests that could modify data.

------------------------ActionView----------------------------------------

# Responsible for rendering views. Can take several forms, one of which is ERB, embedded Ruby.
# It is a mix of html and ruby.

# Another supported file type is a builder file. Instead of rendering HTML,
# a view could instead render XML or JSON. This is incredibly useful for a
# route that only returns data that will then be parsed later by more code.

------------------------Rake----------------------------------------

# Rake is a utility tool that handles task management
# It's like a scripting tool for rails, to do admin tasks like migrating a DB or displaying routes.

------------------------Rack----------------------------------------

# A piece of middleware that sits between Rails router and the web server (WEBrick or Puma),
# receiving http requests from the server and generating responses using information from the router.

------------------------Rack----------------------------------------

# An http server that ships with rails 4. It is single threaded and can only handle 1 request at a time.
# Good for development, bad for production

------------------------Puma----------------------------------------

# Multi threaded http server, good choice for production

------------------------Other frameworks----------------------------------------
# Node - Javascript MEAN Stack, or MERN Stack, MongoDB, ExpressJS, Angualar/React, NodeJS
# Sinatra - Ruby, good for small apps, bad for scalability
# Django - Python MVC Framework
# Spring MVC Java - Can be very slow
# Play! (Scala) - Scala or Java, support hot reload, lack of plugins.
# ASP.NET MVC(.NET) - Microsoft for .NET
# Laravel PHP - most popular language server side language is php. PHP is easier to learn than ruby,
# designed to be a scripting language. It's more flexible because rails is more structured.

------------------------New Rails Project----------------------------------------

rails new DoggyDayCare -d=postgresql
bundle exec rails db:create
bundle exec rails generate migration createDogs # lives in /db/migrate/
bundle exec rails db:migrate # /creates /db/schema.rb
bundle exec rails db:migrate:status

#Now made changes to /db/migrate/item...

# Once setup
bundle exec rails console
dog = dog.new
dog.name = "Clifford the Big Red Dog"
dog.save
Dog.first
Dog.find(1) # id number
Dog.find_by({name: "Clifford the Big Red Dog"})
Dog.all
# Instead of dog.new and dog.save, you can use Dog.create
Dog.create({ name: "Snoopy" })
Dog.last
Dog.last.destroy
# opens pry if you have pry-rails gem added to GemFile