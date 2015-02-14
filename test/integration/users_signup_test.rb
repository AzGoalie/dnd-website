require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  
  test "invalid signup" do
  	get signup_path
  	assert_no_difference 'User.count' do
  		post users_path, user: { username: "",
  								 email: "user@invalid",
  								 password: 'foo',
  								 password_confirmation: 'bar' }
  	end
  	assert_template 'users/new'
  end

  test "valid signup" do
  	assert_difference 'User.count' do
  		post_via_redirect users_path, user: { username: 'Example User',
  											  email: 'user@example.com',
  											  password: 'foobar',
  											  password_confirmation: 'foobar' }
  	end
  	assert_template 'users/show'
  end
end
