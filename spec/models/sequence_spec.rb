require 'spec_helper'

describe Sequence do
  
  before :each do
    @instance = Sequence.new
  end
  
  it "should have a name accessor" do
    @instance.should respond_to(:name)
    @instance.should respond_to(:name=)
  end
  
  it "should have a counter accessor" do
    @instance.should respond_to(:counter)
    @instance.should respond_to(:counter=)
  end
  
  it "should have a counter with value 0" do
    @instance.counter.should == 0
  end
  
  it "shouldn't validate without a name" do
    @instance.should_not be_valid
  end
  
  it "should be valid with a name" do
    @instance.name = "valid_name"
    @instance.should be_valid
  end
  
  it "shouldn't be valid if there is another sequence with the same name" do
    other = Sequence.new(:name => "prova")
    other.save!
    @instance.name = other.name
    @instance.should_not be_valid
  end
  
  it "should have a next method" do
    @instance.should respond_to(:next)
  end
  
  it "should have a next method that works if the object hasn't been saved" do
    @instance.next.should == 0
    @instance.counter.should == 1
  end
  
  it "should have a next method that works if the object has been saved" do
    @instance.name = "a_name"
    @instance.save
    @instance.next.should == 0
    @instance.counter.should == 1
  end
end
