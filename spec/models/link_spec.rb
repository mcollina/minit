require 'spec_helper'

describe Link do
  
  before :each do
    @instance = Link.new
  end
  
  it "should have an url" do 
    @instance.should respond_to(:url)
    @instance.should respond_to(:url=)
    @instance.url.should be_nil
  end
  
  it "should have a short form" do
    @instance.should respond_to(:short_form)
    @instance.should respond_to(:short_form=)
    @instance.url.should be_nil
  end
  
  it "should be valid with an url and a short_form" do
    @instance.url = "http://a.com/long/url"
    @instance.short_form = "alu"
    @instance.should be_valid
  end
  
  it "should be valid without a short_form" do
    @instance.url = "http://a.com/long/url"
    @instance.should be_valid
  end
  
  it "should not be valid without an url" do
    @instance.should_not be_valid
  end
  
  it "should autofill the short_form if it's missing" do
    Sequence.should_receive(:next).with(:link_sequence).and_return(1)
    Encoder.should_receive(:encode).with(1).and_return("b")
    
    @instance.url = "http://a.com/long/url"
    @instance.save.should be_true
    @instance.short_form.should == "b"
  end
  
  it "should not be valid if the url is not valid" do
    @instance.url = "some text"
    @instance.should_not be_valid
  end
end

