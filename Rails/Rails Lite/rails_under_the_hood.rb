# Rails: Web application framework

# HTTP Comes goes through
# -> Rails has a default web server to receive the request
# -> Processed by the Router (part of rails)
# -> Write routes

# Check if any of the routes match the routes file
# If it finds a match, it instantiates a Controller for what was specified by that route
# It's the routers job to actually do that
# It sends whatever action is specified in the route
# It also gives all the params as well from the request

# Controllers inherit from ActionControllerBase(part of rails)
# Alot of functionality in the controller comes from ActionControllerBase
# When hitting the user Controller, it hits the User Model.

# Models inherit from ActiveRecordBase(part of rails)
# calls User.all and hits database
# Rails generates the SQL to make it happen and the model
# returns User Objects that contain the data from the DB

# Then the controller renders the index.html.erb file passing the user objects to the view

# then the Users Controller takes the rendered html and returns the HTTP request with the html


# ---------------------- Rack ----------------------
# Middleware, sits between web servers and web applications