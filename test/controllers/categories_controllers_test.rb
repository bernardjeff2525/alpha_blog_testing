require "test_helper"

class CategoriesControllerTest < ActionDispatch::IntegrationTest

  def setup
    @category = Category.create(name: "test")
    @user = User.create(username:"ber", email:"ber@gmail.com",password:"password",admin: true)
    # @category.save
    sign_in_as(@user,"password")
  end


  test "Should get categories Index" do
    get categories_path
    assert_response :success
  end
  #
  test "should get new" do

    get new_category_path
    assert_response :success

  end
  #
  #
  test "Should get show" do
    get category_path(@category)
    assert_response :success
  end
end
