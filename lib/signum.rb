require File.expand_path '../signum/signature', __FILE__

require 'digest/md5'

module Signum

  # create a Signature for a params hash and a secret 
  # usage: Signum.signature_for :value => params, :secret => 'VeRySeCrEt'
  #
  def self.signature_for options = {}
    options = options.dup
    parameters = options[:value]
    secret = options[:secret]
    Signum::Signature.for secret, parameters

  end

end
