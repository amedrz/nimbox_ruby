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

  let(:consultation) { client.consultations.create!(attributes)['consultation'] }

  describe 'POST /consultations' do
    it 'creates a consultation' do
      response = client.consultations.create!(attributes)

      expect(response['consultation']).to have_key('id')
    end
  end

  describe 'GET /consultations/:id' do
    it 'retrieves a consultation' do
      response = client.consultations!(consultation['id'])['consultation']

      expect(response['id']).to eq(consultation['id'])
    end
  end

  describe 'PUT /consultations/:id' do
    it 'updates a consultation' do
      response = client.consultations(consultation['id'])
        .update!(cause: 'Foo')['consultation']

      expect(response['cause']).to eq('Foo')
    end
  end

  describe 'PUT /consultations/:id/finish' do
    it 'finishes a consultation' do
      response = client.consultations.finish(consultation['id'])['consultation']

      expect(response).to have_key('id')
    end
  end

  describe 'GET /consultations/:id/consultation_diagnostics' do
    before do
      client.consultation_diagnostics.create!(
        consultation_id: consultation[:id],
        diagnostic_id: 1
      )
    end

    it 'fetches diagnostics', vcr: { match_requests_on: [:method] } do
      response = client.consultations.diagnostics(consultation['id'])
      response = response['consultation_diagnostics'][0]

      expect(response).to have_key('id')
    end
  end
end
