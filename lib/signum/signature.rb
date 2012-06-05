module Signum

  class Signature

    attr_reader :signature

    def initialize signature
      @signature = signature
    end

    # Use this method to create a signature from params using method
    # this is the backwards compatible version

    def self.for secret, params
      cleaned = clean params
      signature = generate_signature prepared(cleaned), secret, :md5

      new signature
    end

    # explicitly use md5
    def self.md5_for secret, params
      cleaned = clean params
      signature = generate_signature prepared(cleaned), secret, :md5

      new signature
    end

    # excplicitly use sha2
    def self.sha2_for secret, params
      cleaned = clean params
      signature = generate_signature prepared(cleaned), secret, :sha2

      new signature
    end

    # Blacklists controller & action.
    #
    # Returns a copy.
    #
    def self.clean params
      params = params.dup
      params.delete 'controller'
      params.delete :controller
      params.delete 'action'
      params.delete :action
      params
    end

    #
    #
    def == other
      self.signature == other.signature
    end

    #
    #
    def <=> other
      self.signature <=> other.signature
    end

    #
    #
    def self.prepared params
      stringified normalize(params)
    end

    # Normalize the params. This means currently:
    # * Stringify the amount.
    #
    def self.normalize params
      params['amount'] &&= sprintf "%.2f", params['amount']
      params
    end

    # Sort and stringify the incoming params
    #
    def self.stringified params
      sorted_params = params.to_a.sort
      sorted_params.map { |key, value| "#{key.to_s}:#{value.to_s}" }.join(",")
    end

    # Generate a signature for the given params.
    #
    def self.generate_signature from_string, secret, method = :md5
      case method
        when :md5 then
          Digest::MD5.hexdigest(from_string + secret)
        when :sha2 then
          Digest::SHA2.hexdigest(from_string + secret)
        else
          Digest::MD5.hexdigest(from_string + secret)
      end


    end

    def to_s
      signature
    end

  end

end
