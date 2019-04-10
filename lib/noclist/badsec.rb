require "active_support/all"
require "byebug"
require "HTTParty"

module Badsec
  class User
    def get_request
      response = HTTParty.get('http://0.0.0.0:8888/auth')
      puts response.body, response.code, response.message
    end
  end
end
