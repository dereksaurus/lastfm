require 'spec_helper'

describe 'Api' do

  before :all do
    @api = Lastfm.connect "9bf71d8d96122b5e1be6c3f8cffbadd1"
  end

  describe "Api#get_api_function" do
    context "with non-empty string" do
      it "returns a non-empty string" do
        @api.get_api_function('get_artist_info').should_not be_empty
      end

      it "returns the string formatted as an api function supported by last.fm" do
        @api.get_api_function('get_artist_info').should include(:subject => 'artist', :method => 'getinfo')
      end
    end
  end

end