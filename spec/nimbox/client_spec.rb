require 'spec_helper'

RSpec.describe Nimbox::Client do
  let(:client) do
    Nimbox::Client.new(client_id: CLIENT_ID, client_secret: CLIENT_SECRET,
      access_token: ACCESS_TOKEN, site: SITE)
  end

  it 'assigns credentials' do
    expect(client.uid).to eq CLIENT_ID
    expect(client.secret).to eq CLIENT_SECRET
  end

  it 'provides an access token' do
    expect(client.access_token).not_to be_nil
  end
end
