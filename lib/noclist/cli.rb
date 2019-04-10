require "byebug"
require_relative "badsec"
  class Cli
    extend Badsec
    artii `Noclist`
    
    auth_token = Badsec::User.get_auth_token
    checksum = Badsec::User.calc_checksum(auth_token)
    Badsec::User.get_users(checksum)
  end
