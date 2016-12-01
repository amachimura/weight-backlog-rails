require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @user = User.new(name:"sampleUser", email:"user@example.com",
     weight:85, secure_password: "hogehoge")
  end

  test "validity" do
    assert @user.valid?
  end

  test "name should be present" do
    @user.name = ""
    assert_not @user.valid?
  end


  test "email format validation" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org]
  end


end
