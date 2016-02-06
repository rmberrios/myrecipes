require 'test_helper'

class ChefTest < ActiveSupport::TestCase
  
  def setup
    @chef = Chef.new(chefname: "john", email: "john@example.com")
  end
  
  test "Cheg should be valid" do
    assert @chef.valid?
  end
  
  test "chefname should be present" do
    @chef.chefname = " "
    assert_not @chef.valid?
  end
  
  test "chefname should not be too long" do
    @chef.chefname = "a" * 41
    assert_not @chef.valid?
  end
  
  test "chefname should not be too short" do
    @chef.chefname = "aa"
    assert_not @chef.valid?
  end
  
  test "email should be present" do
    @chef.email = " "
    assert_not @chef.valid?
  end
  
  test "email length should be within bounds" do
    @chef.email = "a" * 101 + "@example.com"
    assert_not @chef.valid?
  end
  
  test "email address should be unique" do
    dup_chef = @chef.dup
    dup_chef.email = @chef.email.upcase
    @chef.save
    assert_not dup_chef.valid?
  end
  
  test "email validations should accept valid addresses" do
    valid_addresses = %w[user@eee.com R_TD-OS@eee.hello.org user@example.com first.last@com.du laura-joe@monk.com]
    
    valid_addresses.each do |va|
      @chef.email = va
      assert @chef.valid?, '#{va.inspect} should be valid'
    end
  end

  
  test "email validation should reject invalid addresses" do
  invalid_addresses = %w[user@emml,com user_aat0ee.org user.name@exmaple. eee@i_am_.com foo@eee+aar.com]
  invalid_addresses.each do |ia|
    @chef.email = ia
    assert_not @chef.valid?, '#{ia.inspect} should be invalid'
    end
  end
  
end