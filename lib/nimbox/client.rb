module Nimbox
  class Client < Rapidash::Client
    method :oauth

    extension :json

    encode_request_with :json

    raise_errors

    resource :people, class_name: Nimbox::Resources::People
    resource :consultations, class_name: Nimbox::Resources::Consultations

    def initialize(options={})
      options[:site] = options[:site]
      options[:uid] ||= options[:client_id]
      options[:secret] ||= options[:client_secret]

      super(options)
    end
  end
end
