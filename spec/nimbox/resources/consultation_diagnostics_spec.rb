require 'spec_helper'

describe Nimbox::Resources::ConsultationDiagnostics, :vcr do
  let(:client) do
    Nimbox::Client.new(client_id: CLIENT_ID, client_secret: CLIENT_SECRET,
      access_token: ACCESS_TOKEN, site: SITE)
  end

  let(:attributes) do
    {
      consultation_id: 1,
      diagnostic_id: 1
    }
  end

  describe 'POST /consultation_diagnostics' do
    it 'creates a diagnostic' do
      response = client.consultation_diagnostics.create!(attributes)

      expect(response['consultation_diagnostic']).to have_key('id')
    end
  end
end
