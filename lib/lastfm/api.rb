# Helper class for accessing last.fm API
require 'open-uri'
require 'json'
require 'net/http'

module Lastfm
  class Api

    # Set the api key
    def initialize(api_key)
      @api_key = api_key
    end

    # Generates a lastfm method name
    def get_api_function(method_name)
      return "" if method_name.nil?
      regex = /^get_(?<subject>[a-zA-Z]+)_(?<method>\w+)$/
      matched = method_name.to_s.match regex

      {
        :subject => matched[:subject], 
        :method => "get#{matched[:method].gsub('_', '').downcase}"
      }
    end

    # Sends a request to last.fm
    # Will return a nokogiri XML object
    def send_request(subject, method, *args)

      if args.first.is_a? Hash
        query = nil
        options = args.shift
      else
        options = {}
        options.update({:"#{subject}" => "#{args.shift}"})
      end

      options = URI.escape(options.map{|element|"&#{element.first}=#{element.last}"}.join)
      url_string = "/?method=#{subject}.#{method}&api_key=#{@api_key}#{options}&format=json"

      Net::HTTP.get(URI.parse(Lastfm::API_URL + url_string))
    end

    # Parse magic function for validity and execute it
    # There will be some manipulation with how it pieces together the method name
    # ie.
    #     get_artist_top_tracks --> artist.gettoptracks
    def method_missing(method, *args, &block)
      if method.to_s =~ /^get_(.+)$/
        method_hash = get_api_function method
        return send_request(method_hash[:subject], method_hash[:method], *args)
      else
        super
      end
    end

  end
end