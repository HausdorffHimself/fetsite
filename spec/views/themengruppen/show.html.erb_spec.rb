require 'spec_helper'

describe "themengruppen/show" do
  before(:each) do
    @themengruppe = assign(:themengruppe, stub_model(Themengruppe,
      :title => "Title",
      :text => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    rendered.should match(/MyText/)
  end
end
