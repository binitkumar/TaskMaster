require 'rails_helper'

RSpec.describe "task_details/new", :type => :view do
  before(:each) do
    assign(:task_detail, TaskDetail.new(
      :details => "MyText"
    ))
  end

  it "renders new task_detail form" do
    render

    assert_select "form[action=?][method=?]", task_details_path, "post" do

      assert_select "textarea#task_detail_details[name=?]", "task_detail[details]"
    end
  end
end
