require 'rails_helper'

RSpec.describe "meals/edit", :type => :view do
  before(:each) do
    @meal = assign(:meal, Meal.create!(
      :name => "MyString",
      :calories => "MyString"
    ))
  end

  it "renders the edit meal form" do
    render

    assert_select "form[action=?][method=?]", meal_path(@meal), "post" do

      assert_select "input#meal_name[name=?]", "meal[name]"

      assert_select "input#meal_calories[name=?]", "meal[calories]"
    end
  end
end
