require 'test_helper'

class PasswordResetsTest < ActionDispatch::IntegrationTest
	def setup
		ActionMailer::Base.deliveries.clear
		@user = users(:Example)
	end

	test "password resets" do
		get new_password_reset_path
		assert_template 'password_resets/new'
		# Invalid username
		post password_resets_path, password_reset: { username: "" }
		assert_not flash.empty?
		assert_template 'password_resets/new'
		# Valid username
		post password_resets_path, password_reset: { username: @user.username }
		assert_not_equal @user.reset_digest, @user.reload.reset_digest
		assert_equal 1, ActionMailer::Base.deliveries.size
		assert_not flash.empty?
		assert_redirected_to root_url
		# Password reset form
		user = assigns(:user)
		# Wrong username
		get edit_password_reset_path(user.reset_token, username: "")
		assert_redirected_to root_url
		# Inactive user
		user.toggle!(:activated)
		get edit_password_reset_path(user.reset_token, username: user.username)
		assert_redirected_to root_url
		user.toggle!(:activated)
		# Right email, wrong token
		get edit_password_reset_path('wrong token', username: user.username)
		assert_redirected_to root_url
		# Right username, right token
		get edit_password_reset_path(user.reset_token, username: user.username)
		assert_template 'password_resets/edit'
		assert_select "input[name=username][type=hidden][value=?]", user.username
		# Invalid password & confirmation
		patch password_reset_path(user.reset_token),
			username: user.username,
			user: { password:              "foobaz",
					password_confirmation: "barquux" }
		assert_template 'password_resets/edit'
		# Blank password
		patch password_reset_path(user.reset_token),
			username: user.username,
			user: { password:              "  ",
					password_confirmation: "foobar" }
		assert_not flash.empty?
		assert_template 'password_resets/edit'
		# Valid password & confirmation
		patch password_reset_path(user.reset_token),
			username: user.username,
			user: { password:              "foobaz",
					password_confirmation: "foobaz" }
		assert is_logged_in?
		assert_not flash.empty?
		assert_redirected_to user
	end
end
