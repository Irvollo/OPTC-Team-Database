require 'test_helper'

class UsersEditTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  def setup
    @user = users(:luffy)
    @other_user = users(:zoro)
  end
  
  test "unsuccesful edit" do
    log_in_as(@user)
    get edit_user_path(@user)
    assert_template 'users/edit'
    patch user_path(@user), { user: {
      name: "",
      email: "foo@invalid",
      password: "foo",
      password_confirmation: "bar" }}
    assert_template 'users/edit'
    assert_select "div.alert", text: "The form contains 4 errors."
  end
  
  test "succesful edit" do
    log_in_as(@user)
    get edit_user_path(@user)
    assert_template 'users/edit'
    name = "Foo Bar"
    email = "foo@bar.com"
    patch user_path(@user), { user: {
      name: name,
      email: email,
      password: "",
      password_confirmation: "" }}
    assert_not flash.empty?
    assert_redirected_to @user
    @user.reload
    assert_equal name, @user.name
    assert_equal email, @user.email
    end
    
    
    test "should redirect edit when not logged in" do
      get edit_user_path(@user)
      assert_not flash.empty?
      assert_redirected_to login_url
    end
    
    test "should redirect update when not logged in" do
      patch user_path(@user), params: { user: { name: @user.name,
                                                email: @user.email } }
      assert_not flash.empty?
      assert_redirected_to login_url
    end
    
    test "should redirect edit when log in as wrong user" do
      log_in_as(@other_user)
      get edit_user_path(@user)
      assert_not flash.empty?
      assert_redirected_to root_path
    end
    
    test "should redirect update when log in as wrong user" do
      log_in_as(@other_user)
      patch user_path(@user), user: {
        name:@user.name,
        email:@user.email
      }
      assert_not flash.empty?
      assert_redirected_to root_path
    end
    
    test "succesful edit with friendly forwarding" do
      #Try to visit the edit test
      get edit_user_path(@user)
      # Log in as user
      log_in_as(@user)
      #Check if the user is redirected to the edit test, instead of the default page
      assert_redirected_to edit_user_url(@user)
      name = "Foo Bar"
      email = "foo@bar.com"
      patch user_path(@user), user: {
        name: name,
        email: email,
        password:"",
        password_confirmation: "" }
      assert_not flash.empty?
      assert_redirected_to @user
      @user.reload
      assert_equal name, @user.name
      assert_equal email, @user.email
    end
    
end
