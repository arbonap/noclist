require "active_support/all"
require "byebug"
require "HTTParty"
require "digest"

module Badsec
  class User
    def self.get_auth_token
      begin
        retries ||= 0

        response = HTTParty.get('http://0.0.0.0:8888/auth')

        if response.code != 200
          STDERR.puts "Response: #{response.code}, #{response.message}"
        end

        auth_token = response.headers["badsec-authentication-token"]
      rescue => e
        STDERR.puts "Exception: #{e.message}"

        if (retries += 1) < 3
          puts "Retrying..."
          retry
        else
          STDERR.puts "Exiting with status code: 1"
          exit
        end
      end
    end

    def self.calc_checksum(auth_token)
      checksum = Digest::SHA256.hexdigest "#{auth_token}/users"
    end

    def self.get_users(checksum)
      begin
        retries ||= 0

        users_response = HTTParty.get('http://0.0.0.0:8888/users',
        :headers => { 'X-Request-Checksum' => "#{checksum.upcase}" })

        if users_response.code != 200
          STDERR.puts "Response: #{users_response.code}, #{users_response.message}"
        else
          print format(users_response) unless ENV['GEM_ENV'] == 'TEST'
        end

        users_response
      rescue => e
        STDERR.puts "Exception: #{e.message}"
        if (retries += 1) < 3
          puts "Retrying..."
          retry
        else
          STDERR.puts "Exiting with status code: 1"
          exit
        end
      end
    end

    def format(users_response)
      JSON.parse(users_response.body.split.to_json)
    end
  end
end
