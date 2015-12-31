require 'spec_helper'

describe Nimbox::Resources::People, :vcr do
  let(:client) do
    Nimbox::Client.new(client_id: CLIENT_ID, client_secret: CLIENT_SECRET,
      access_token: ACCESS_TOKEN, site: SITE)
  end

  let(:attributes) do
    {
      first_name: 'Gabriel',
      last_name: 'Rodríguez',
      telephone: '917-919-375',
      email: 'person193@example.com',
      born_at: '1984-10-29',
      gender: 'm',
      account_id: 146
    }
  end

  describe 'POST /people' do
    it 'creates a person' do
      response = client.people.create!(attributes)

      expect(response['person']).to have_key('id')
    end
  end

  describe 'GET /people/:id' do
    it 'retrieves a person' do
      id = client.people.create!(attributes)['person']['id']

      response = client.people!(id)

      expect(response['person']['id']).to eq(id)
    end
  end

  describe 'PUT /people/:id' do
    it 'updates a person' do
      id = client.people.create!(attributes)['person']['id']

      response = client.people(id).update!(first_name: 'Foo')

      expect(response['person']['first_name']).to eq('Foo')
    end
  end
end
