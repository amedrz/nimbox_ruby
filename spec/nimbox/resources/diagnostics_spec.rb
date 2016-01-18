require 'spec_helper'

describe Nimbox::Resources::People, :vcr do
  let(:client) do
    Nimbox::Client.new(client_id: CLIENT_ID, client_secret: CLIENT_SECRET,
      access_token: ACCESS_TOKEN, site: SITE)
  end

  describe 'GET /diagnostics/:id' do
    it 'retrieves a diagnostic' do
      response = client.diagnostics!(1)

      expect(response['diagnostic']['id']).to eq(1)
    end
  end
end
