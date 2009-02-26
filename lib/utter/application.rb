module Utter
  class Application
    def call(env)
      req = Rack::Request.new(env)
      return [405, {"Allow" => 'POST', "Content-Type" => 'text/plain'}, "Not Acceptable"] unless req.post?
      
      if req.path_info =~ /^\/([a-z\d]+)$/
        site = Site[$1]
        if site
          site.regenerate
          return [200, {"Content-Type" => 'text/plain'}, "OK"]
        end
      end
            
      not_found
    end
    
    def not_found
      return [404, {"Content-Type" => 'text/plain'}, "Not Found!\n"]
    end
  end
end