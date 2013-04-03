# Lastfm

Extreme minimal wrapper gem for Last.FM API.

## Installation

Add this line to your application's Gemfile:

    gem 'lastfm'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install lastfm

## Usage

To authenticate:

    api = Lastfm.connect <API_KEY>

Method names are performed magically, use the following format:

    get_<subject>_<method>

Example:

    api.get_artist_info "Oasis"
    
    api.get_user_recent_tracks "shurai"

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
