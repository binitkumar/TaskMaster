require 'rails_helper'

RSpec.describe "task_details/edit", :type => :view do
  before(:each) do
    @task_detail = assign(:task_detail, TaskDetail.create!(
      :details => "MyText"
    ))
  end

  it "renders the edit task_detail form" do
    render

    assert_select "form[action=?][method=?]", task_detail_path(@task_detail), "post" do

      assert_select "textarea#task_detail_details[name=?]", "task_detail[details]"
    end
  end
end
