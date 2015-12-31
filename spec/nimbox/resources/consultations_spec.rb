require 'spec_helper'

describe Nimbox::Resources::Consultations, :vcr do
  let(:client) do
    Nimbox::Client.new(client_id: CLIENT_ID, client_secret: CLIENT_SECRET,
      access_token: ACCESS_TOKEN, site: SITE)
  end

  let(:attributes) do
    {
      cause: 'nemo',
      person_id: 3591
    }
  end

  describe 'POST /consultations' do
    it 'creates a consultation' do
      response = client.consultations.create!(attributes)

      expect(response['consultation']).to have_key('id')
    end
  end

  describe 'GET /consultations/:id' do
    it 'retrieves a consultation' do
      id = client.consultations.create!(attributes)['consultation']['id']

      response = client.consultations!(id)

      expect(response['consultation']['id']).to eq(id)
    end
  end

  describe 'PUT /consultations/:id' do
    it 'updates a consultation' do
      id = client.consultations.create!(attributes)['consultation']['id']

      response = client.consultations(id).update!(cause: 'Foo')

      expect(response['consultation']['cause']).to eq('Foo')
    end
  end
end
