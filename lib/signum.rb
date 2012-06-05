require File.expand_path '../signum/signature', __FILE__

require 'digest/md5'
require 'digest/sha2'

module Signum

  # create a Signature for a params hash and a secret 
  # usage: Signum.signature_for :value => params, :secret => 'VeRySeCrEt'
  #                             :method => :sha2
  #
  # supported methods: :md5, :sha2
  #
  def self.signature_for options = {}
    options = options.dup
    parameters = options[:value]
    secret = options[:secret]
    method = options[:method] || :md5
    case method
      when :md5 then
        Signum::Signature.md5_for secret, parameters
      when :sha2 then
        Signum::Signature.sha2_for secret, parameters
    end

  end

end
