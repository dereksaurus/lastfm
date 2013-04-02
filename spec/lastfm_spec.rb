require 'spec_helper'

describe Lastfm do
  it 'should return correct current version string' do
    Lastfm.version_string == "LastFM API Wrapper Version #{Lastfm::VERSION}"
  end
end