require 'lastfm/version'
require 'lastfm/api'
require 'open-uri'
require 'json'

module Lastfm

  API_VERSION = 2.0
  API_URL = "http://ws.audioscrobbler.com/#{API_VERSION}"

  def self.version_string
    "LastFM API Wrapper Version #{Lastfm::VERSION}"
  end

  # Last.fm API access
  class << self

    # Initialize access point for Last.fm API
    def connect(key)
      Api.new key
    end

  end
end