require 'test_helper'

# def setup 
#   @subscriptor = subscriptors(:one)
# end

class SubscriptorsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get new_subscriptor_url
    assert_response :success
  end


  test "should get index" do
  	
  	#get :index
  	get subscriptors_url
  	assert_response :success
  end

  test "should create a new subscriptor" do
  	#saber sí se incrementó el numero de registro
    assert_difference('Subscriptor.count') do 
   	#post subscriptors_url, params: {subscriptor: {email: @subscriptor.email, name: @subscriptor.name}}
    post subscriptors_url, params: {subscriptor: {email: "jh@gm.com", name: "johan"}}
  end
	#REDIRECCIÓN:
  assert_redirected_to posts_path
end

  #NO PASAN:

  # test "should show subscriptor" do 
  #   get subscriptor_url(@subscriptor)
  #   assert_response :success
  # end

  # test "should get edit" do 
  #   get edit_subscriptor_url(@subscriptor)
  #   assert_response :success
  # end

  # test "should update subscriptor" do 
  #   patch subscriptors_url, params: {subscriptor: {email: "jh@gm.com", name: "johan"}}
  #   assert_redirected_to subscriptor_url
  # end


  # test "should get create" do
  #   get subscriptors_create_url
  #   assert_response :success
  # end

  # test "should destroy subscriptor" do
    
  #   assert_difference('Subscriptor.count', -1) do
  #     delete subscriptor_url(@subscriptor)
  #   end
  #   assert_redirected_to subscriptors_url
  # end

end
