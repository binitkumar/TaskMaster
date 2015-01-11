require 'rails_helper'

RSpec.describe "task_details/show", :type => :view do
  before(:each) do
    @task_detail = assign(:task_detail, TaskDetail.create!(
      :details => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/MyText/)
  end
end
