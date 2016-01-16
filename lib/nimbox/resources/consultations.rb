module Nimbox
  module Resources
    class Consultations < Rapidash::Base
      def finish(id)
        options[:method] = :put
        @url = "consultations/#{id}/finish"
        call!
      end
    end
  end
end
