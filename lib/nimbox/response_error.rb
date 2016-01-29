module Nimbox
  class ResponseError < Rapidash::ResponseError
    def errors
      return body if body.kind_of?(String)

      body['errors'].to_a.map { |key, val| "#{key} #{val[0]}" }.join(', ')
    end
  end
end
