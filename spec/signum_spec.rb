require 'spec_helper'

describe Signum do

  context ".signature_for" do
  
    it 'should have a signature_for method' do
      Signum.should respond_to(:signature_for)
    end

    it 'should call Signum::Signature#for' do
      Signum::Signature.should_receive(:for).with('secret_word', 'key' => 'value')
      Signum.signature_for :value => { "key" => "value"}, :secret => 'secret_word'
    end

  end
end
