require 'rails_helper'

RSpec.describe "task_details/index", :type => :view do
  before(:each) do
    assign(:task_details, [
      TaskDetail.create!(
        :details => "MyText"
      ),
      TaskDetail.create!(
        :details => "MyText"
      )
    ])
  end

  it "renders a list of task_details" do
    render
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
