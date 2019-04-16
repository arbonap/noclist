require "bundler/setup"
require "noclist"

ENV['GEM_ENV']='TEST'

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end

def format(users_response)
  JSON.parse(users_response.body.split.to_json)
end
