module Nimbox
  module Resources
    class Consultations < Rapidash::Base
      def finish(id)
        options[:method] = :put
        @url = "consultations/#{id}/finish"
        call!
      end

      def diagnostics(id)
        options[:method] = :get
        @url = "consultations/#{id}/consultation_diagnostics"
        call!
      end
    end
  end
end
