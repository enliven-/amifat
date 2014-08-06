require 'rails_helper'

RSpec.describe "meals/index", :type => :view do
  before(:each) do
    assign(:meals, [
      Meal.create!(
        :name => "Name",
        :calories => "Calories"
      ),
      Meal.create!(
        :name => "Name",
        :calories => "Calories"
      )
    ])
  end

  it "renders a list of meals" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Calories".to_s, :count => 2
  end
end
