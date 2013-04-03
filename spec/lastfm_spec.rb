require 'spec_helper'

describe Lastfm do

  describe "self#version" do
    it 'should return correct current version string' do
      Lastfm.version_string == "LastFM API Wrapper Version #{Lastfm::VERSION}"
    end
  end

  describe "self#connect" do
    it 'returns an API object when an api key is passed in' do
      api = Lastfm.connect "api_key"
      api.should be_kind_of Lastfm::Api
    end
  end

end