require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: "Stella Njage", email: "stellanjage@gmail.com")
  end

  test "user should be valid" do
    assert @user.valid?
  end
  #test for presence
  test "name should be present" do 
    @user.name = "  "
    assert_not @user.valid?
  end

  test "email should be present" do
    @user.email = "  "
    assert_not @user.valid?
  end
  #length validations
  test "name length should be valid" do
    @user.name = "a" * 51
    assert_not @user.valid?
  end
  test "email length should be valid" do
    @user.email = "a" * 247 + "gmail.com"
  end

  test"email format should accept valid email addresses" do
  @user.email = %[ste@gamiil.com, StE@gmail.co.m, s-t_E@GMAIL.CO,
                ste+maris@gmmail.co]
  valid_addresses.each do |invalid_address|
    @user.invalid = invalid_address
    assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
  end 
end
  
  test "email format should reject invalid email addresses" do
  @user.email = %[ste@gamiil,com, StE.gmail.co.m, s-t_E@GMAIL,
                stemaris@gm+mail.co,ste@gmail_com]
  invalid_addresses.each do |invalid_address|
    @user.invalid = invalid_address
    assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
  end 
end

end
