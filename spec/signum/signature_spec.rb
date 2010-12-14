require 'spec_helper'

describe Signum::Signature do
  
  describe "==" do
    it "should return the right value" do
      Signum::Signature.new('bla').==(Signum::Signature.new('bla')).should == true
    end
    it "should return the right value" do
      Signum::Signature.new('bla').==(Signum::Signature.new('hulubulu')).should == false
    end
  end
  
  describe "clean" do
    it "should clean some keys" do
      Signum::Signature.clean( :a => :b, :controller => :some_controller, :action => :some_action ).should == { :a => :b }
    end
  end
  
  describe "Signum::Signature.for" do
    it "should generate the right signature" do
      expected = Signum::Signature.generate_signature 'amount:a,api_key:b,merchant_id:c', 'secret'
      actual = Signum::Signature.for 'secret', :merchant_id => 'c', :api_key => 'b', :amount => 'a'
      
      actual.signature.should == expected
    end
    it "should generate the right signature even if there is action & controller" do
      expected = Signum::Signature.generate_signature 'amount:a,api_key:b,merchant_id:c', 'secret'
      actual = Signum::Signature.for 'secret', :merchant_id => 'c', :api_key => 'b', :amount => 'a', :controller => 'some/controller', :action => 'some_action'
      
      actual.signature.should == expected
    end
  end
  
  describe "Signum::Signature.normalize" do
    it "needs a correct amount to function" do
      Signum::Signature.normalize( 'amount' => nil ).should == { 'amount' => nil }
    end
    it "should normalize the amount" do
      Signum::Signature.normalize( 'no_amount' => 'sorry' ).should == { 'no_amount' => 'sorry' }
    end
    it "should normalize the amount" do
      Signum::Signature.normalize( 'amount' => 1.23456789 ).should == { 'amount' => '1.23' }
    end
    it "should normalize the amount" do
      Signum::Signature.normalize( 'amount' => 14 ).should == { 'amount' => '14.00' }
    end
    it "should normalize the amount" do
      Signum::Signature.normalize( 'amount' => 22.50 ).should == { 'amount' => '22.50' }
    end
    it "should normalize the amount" do
      Signum::Signature.normalize( 'amount' => 0.55 ).should == { 'amount' => '0.55' }
    end
    it "should normalize the amount" do
      Signum::Signature.normalize( 'amount' => 1000.00 ).should == { 'amount' => '1000.00' }
    end
  end
  
  describe "Signum::Signature.generate_signature" do
    it "should generate a correct signature" do
      Signum::Signature.generate_signature('firstsecond', 'third').should == '272bfa314ea293c357dd9f45ba979a16'
    end
  end
  
  describe "Signum::Signature.stringified" do
    it "stringify the params correctly" do
      Signum::Signature.stringified(:z => :third, :c => :second, :a => :first).should == 'a:first,c:second,z:third'
    end
  end
  
end

