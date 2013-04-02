require 'spec_helper'

describe 'Api' do

  before :all do
    @utils = Lastfm::Api.new
  end

  context "with non-empty string" do
    it "returns a non-empty string" do
      @utils.get_api_function('get_artist_info').should_not be_empty
    end

    it "returns the string formatted as an api function supported by last.fm" do
      @utils.get_api_function('get_artist_info').should include(:subject => 'artist', :method => 'getinfo')
    end
  end

end