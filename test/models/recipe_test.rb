require 'test_helper'

class RecipeTest < ActiveSupport::TestCase
  
  def setup
    @recipe = Recipe.new(name:"Chicken parm", 
              summary: "This is the best chicken parm recipe ever",
              description: "heat oil, add onions, add tomato sauce, add chicken, cook for 20 minutes")
  end

  test "recipe should be valid" do
    assert @recipe.valid?, "Is recipe valid"
  end
  
  test "name should be present" do
    @recipe.name = " "
    assert_not @recipe.valid?, "Name set to be empty string"
  end
  
  test "name length should not be too long" do 
    @recipe.name = "a" * 101
    assert_not @recipe.valid?, "Set a name length to 101"
  end
  
  test "name length shoul not be too short" do
    @recipe.name = "aaaa"
    assert_not @recipe.valid?, "Set a name short"
  end
  
  test "Summary should be present" do
    @recipe.summary = " "
    assert_not @recipe.valid?, "Set and empty summary"
  end
  
  test "Summary length should not be too long" do
    @recipe.summary = "a" * 151
    assert_not @recipe.valid?
  end
  
  test "Summary length shoud not be too short" do
    @recipe.summary = "a" * 9
    assert_not @recipe.valid?
  end
  
  test "Description must be present" do 
    @recipe.description = " "
    assert_not @recipe.valid?
  end
  
  test "Description should not be too long" do
    @recipe.description = "a" * 501
    assert_not @recipe.valid?
  end
  
  test "Description should not be too short" do
    @recipe.description = "a" * 19
    assert_not @recipe.valid?
  end
end
