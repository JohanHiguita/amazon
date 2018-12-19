require 'test_helper'

class ProductsControllerTest < ActionDispatch::IntegrationTest
	setup do
		@product = products(:one)
	end


	test "should get new" do
		get new_product_url
		assert_response :success
	end

	test "should create a new product" do
  		#saber sí se incrementó el numero de registro
  		assert_difference('Product.count') do 
   			#post subscriptors_url, params: {subscriptor: {email: @subscriptor.email, name: @subscriptor.name}}
   			post products_url, params: {product: {name: "ball", price: 100}}
   		end
		#REDIRECCIÓN:
		assert_redirected_to products_path
	end

	test "should show product" do 
		get product_url(@product)
		assert_response :success
	end

end
