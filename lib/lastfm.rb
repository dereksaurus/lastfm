require 'lastfm/version'
require 'lastfm/api'
require 'open-uri'
require 'json'
require 'nokogiri'

module Lastfm

  def self.version_string
    "LastFM API Wrapper Version #{Lastfm::VERSION}"
  end

  # Last.fm API access
  class << self

    API_VERSION = 2.0
    API_URL = "http://ws.audioscrobbler.com/#{API_VERSION}/"

    # Initialize access point for Last.fm API
    def connect(key)
      @api = Api.new
    end

  end
end