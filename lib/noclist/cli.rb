require "byebug"
require_relative "badsec"
  class Cli
    extend Badsec

    Badsec::User.new.get_request
  end
