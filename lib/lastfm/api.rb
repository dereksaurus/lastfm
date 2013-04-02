# Helper class for accessing last.fm API
require 'open-uri'
require 'json'
require 'nokogiri'

module Lastfm
  class Api

    # Set the api key
    def intialize(api_key)
      @api_key = api_key
    end

    # Generates a lastfm method name
    def get_api_function(method_name)
      return "" if method_name.nil?
      regex = /^get_(?<subject>\w+)_(?<method>\w+)$/
      matched = method_name.to_s.match regex

      [
        :subject => matched[:subject], 
        :method => "get#{matched[:method].gsub('_', '').downcase}"
      ]

      # {matched[:subject]}.get#{matched[:method].gsub('_', '').downcase}
    end

    # Sends a request to last.fm
    def request(subject, method, *args)

      if args.first.is_a? Hash
        query = nil
        options = args.shift
      else
        options = {}
        options.update({:"#{subject}" => "#{args.shift}"})
      end

      options = URI.escape(options.map{|element|"&#{element.first}=#{element.last}"}.join)
      url_string = "?method=#{method}&api_key=#{@api_key}&format=json#{options}"
      p url_string

      document = Nokogiri.HTML(open(Lastfm::API_URL + url_string))
      p document
    end

    # Parse magic function for validity and execute it
    # There will be some manipulation with how it pieces together the method name
    # ie.
    #     get_artist_top_tracks --> artist.gettoptracks
    def method_missing(method, *args, &block)
      self.class.instance_eval do
        define_method method do |*args|
          self.send request(generate_api_function(method), *args)
        end
      end
    end

  end
end