require 'rack'

class RailsLiteServer
  def self.call(env)
    req = Rack::Request.new(env)
    res = Rack::Response.new
    puts req.path
    res['Content-Type'] = 'text/html'
    res.write(req.path.to_s)
    res.finish
  end
end

Rack::Server.start(
  app: RailsLiteServer,
  Port: 3000
)