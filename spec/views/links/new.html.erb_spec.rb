require 'spec_helper'

describe "links/new.html.erb" do
  before(:each) do
    assign(:link, stub_model(Link,
      :new_record? => true
    ))
  end

  it "renders new link form" do
    render

    rendered.should have_selector("form", :action => links_path, :method => "post") do |form|
    end
  end
end
