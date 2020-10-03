
# ---------------------- Rack Demo ----------------------
gem install rack
require 'rack'
require 'json'

class RackApplication
  def self.call(env)
    # Everytime an http request comes in, it will call this "call" method.
    # env will be a hash of all the http request information
    #p env

    # return [
    #   "200",
    #   { "Content-Type" => "text/html" },
    #   "Hey there"
    # ]
  end
end

class SimpleApp
  def self.call(env)
    req = Rack::Request.new(env) # Little bit easier to parse as an object then env by itself
    res = Rack::Response.new

    name = req.params["name"]

    res.write("Hello #{name}")
    res.finish
  end
end

class CookieApp
  def self.call(env)
    req = Rack::Request.new(env)
    res = Rack::Response.new

    food = req.params["food"]
    if food
      res.set_cookie(
        "_my_cookie_app",
        {
          path: "/",
          value: {food: food}.to_json
        }
      )
    else
      cookie = req.cookies["_my_cookie_app"]
      cookie_val = JSON.parse(cookie)
      food = cookie_val["food"]
      res.write("Your favourite food is: #{food}")
    end

    res.finish
  end
end

app = Proc.new do |env| # Procs respond to call
  req = Rack::Request.new(env)
  res = Rack::Response.new
  # Doing a redirect
  if req.path.starts_with?("/cage")
    res.status = 302
    res["Location"] = "some url"
  else
    res.write("Nothing to see here")
  end
  res.finish # makes sure it is a properly formatted response
end

Rack::Server.start({
  app: app,
  Port: 3000
})

ruby rack_demo.rb
