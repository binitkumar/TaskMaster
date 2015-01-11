require 'rails_helper'

RSpec.describe "organizations/index", :type => :view do
  before(:each) do
    assign(:organizations, [
      Organization.create!(
        :name => "Name",
        :products => "Products"
      ),
      Organization.create!(
        :name => "Name",
        :products => "Products"
      )
    ])
  end

  it "renders a list of organizations" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Products".to_s, :count => 2
  end
end
