# Noclist 🌌
_Retrieve a list of VIP user IDs and print it to STDOUT in JSON format_

## Installation

Assuming your machine is set up for the Ruby ecosystem:

    $ bin/setup
    $ bundle exec rake install

_Make sure to run the server before running the gem or test-suite_:

    $ docker run --rm -p 8888:8888 adhocteam/noclist

## Gem Usage

    $ noclist

## Running tests

To run the entire test-suite:

    $ `bundle exec rspec spec`

## Debugging 🐛

- Insert `require 'byebug'` at the top of a file (paying particular attention to `badsec.rb` and `cli.rb`), and throw in a `byebug` statement as your break-point.
- Alternatively, run `bin/console` for an interactive prompt for debugging purposes.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Noclist project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [Contributor Covenant](http://contributor-covenant.org). This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.
