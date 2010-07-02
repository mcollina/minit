require 'spec_helper'

describe Encoder do
  
  it "should have an encode method" do
    Encoder.should respond_to(:encode)
  end
  
  it "should have a decode method" do
    Encoder.should respond_to(:decode)
  end
  
  it "should encode an integer (1)" do
    Encoder.encode(1).should == "b"
  end
  
  it "should decode a string (b)" do
    Encoder.decode("b").should == 1
  end
  
  it "should encode a more complex number (19158)" do
    Encoder.encode(19158).should == "e9a"
  end
  
  it "should decode a more complex string (e9a)" do
    Encoder.decode("e9a").should == 19158
  end
  
  it "should not encode a negative integer" do
    lambda { 
      Encoder.encode(-1)
    }.should raise_error
  end
  
  it "should not decode a string containing disallowed chars" do
    lambda {
      Econder.decode("a:b")
    }.should raise_error
  end
end


