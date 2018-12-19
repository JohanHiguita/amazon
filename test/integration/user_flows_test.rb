require 'test_helper'

class UserFlowsTest < ActionDispatch::IntegrationTest

	test "Login and browse" do
		get '/users/sign_in'
		post '/users/sign_in', params: {user: {email: users(:juan).email, password:'hola1234' }}
		assert_redirected_to root_path
		# follow_redirect!
		# assert_equal '/', root_path
		assert_equal 'Signed in successfully.', flash[:notice]
	end
end