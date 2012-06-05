require 'spec_helper'

describe Signum do

  context ".signature_for" do
  
    it 'should have a signature_for method' do
      Signum.should respond_to(:signature_for)
    end

    it 'should call Signum::Signature#md5_for' do
      Signum::Signature.should_receive(:md5_for).with('secret_word', 'key' => 'value')
      Signum.signature_for :value => { "key" => "value"}, :secret => 'secret_word', :method => :md5
    end

    it 'should call Signum::Signature#sha2_for' do
      Signum::Signature.should_receive(:sha2_for).with('secret_word', 'key' => 'value')
      Signum.signature_for :value => { "key" => "value"}, :secret => 'secret_word', :method => :sha2
    end
  end
end
