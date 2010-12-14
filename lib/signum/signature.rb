module Signum

class Signature
  
  attr_reader :signature
  
  def initialize signature
    @signature = signature
  end
  
  # Use this method to create a signature from params.
  #
  def self.for secret, params
    cleaned = clean params
    signature = generate_signature prepared(cleaned), secret
    
    new signature
  end
  
  # Blacklists controller & action.
  #
  # Returns a copy.
  #
  def self.clean params
    params = params.dup
    params.delete :controller
    params.delete 'controller'
    params.delete :action
    params.delete 'action'
    params
  end
  
  #
  #
  def == other
    puts "self : #{self.signature.inspect}"
    puts "other: #{other.signature.inspect}"
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
    s = sorted_params.map { |key, value| "#{key.to_s}:#{value.to_s}" }.join(",")
    puts s
    s
  end
  
  # Generate a signature for the given params.
  #
  def self.generate_signature from_string, secret
    Digest::MD5.hexdigest(from_string + secret)
  end
  
  def to_s
    signature
  end
  
end
  
end
