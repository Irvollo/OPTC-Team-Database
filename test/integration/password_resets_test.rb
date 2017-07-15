require 'test_helper'

class PasswordResetsTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  
  def setup
    ActionMailer::Base.deliveries.clear
    @user = users(:luffy)
  end
  
  test "password_reset" do
    get new_password_reset_path
    assert_template 'password_resets/new'
    #Invalid email
    post password_resets_path, { password_reset:{ email:"" }}
    assert_not flash.empty? 
    assert_template 'password_resets/new'
    #Valid email
    post password_resets_path, { password_reset:{ email:@user.email }}
    assert_not_equal @user.reset_digest, @user.reload.reset_digest
    assert_equal 1, ActionMailer::Base.deliveries.size
    assert_not flash.empty?
    assert_redirected_to root_url
    #Password reset form
    user = assigns(:user)
    #Wrong email
    get edit_password_reset_path(user.reset_token, email: "")
    assert_redirected_to root_url
    #Inactive user // Deactivates the user, try to access with the right email and token but should go to root_ulr, activates the user again
    user.toggle!(:activated)
    get edit_password_reset_path(user.reset_token, email: user.email)
    assert_redirected_to root_url
    user.toggle!(:activated)
    #Right email, wrong token 
    get edit_password_reset_path("wrong token", email: user.email)
    assert_redirected_to root_url
    #Right email, right token
    get edit_password_reset_path(user.reset_token, email: user.email)
    assert_template 'password_resets/edit'
    assert_select "input[name=email][type=hidden][value=?]", user.email
    #Invalid password confirmation
    patch password_reset_path(user.reset_token), {  email:  user.email,
                                                    user: { password: "foobaz",
                                                            password_confirmation: "barqux"} }
    assert_select 'div#error_explanation'
    #Empty password 
    patch password_reset_path(user.reset_token), {  email:  user.email,
                                                    user: { password: "",
                                                            password_confirmation: ""} }
    assert_select 'div#error_explanation'
    #Valid password & confirmation // Update correctly, check if it is logged in, flash should appear and be redirected to user
    patch password_reset_path(user.reset_token), {  email:  user.email,
                                                    user: { password: "foobaz",
                                                            password_confirmation: "foobaz"} }
    assert is_logged_in?
    assert_not flash.empty?
    assert_redirected_to user
  end
  
end
