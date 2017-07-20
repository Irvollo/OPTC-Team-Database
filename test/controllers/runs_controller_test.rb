require 'test_helper'

class RunsControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  def setup 
    @run = runs(:vista)
  end
  
  test "should redirect create when not logged_in" do
    assert_no_difference 'Run.count' do
      post runs_path, run: {
             user_id: 1,
             fight_id: 1,
             captain_class:  "STR" ,
             description:  "This is a short description for the video" , 
             youtube_url:  "https://www.youtube.com/watch?v=LKibi1f2Y3s" , 
             title:  "2x SW Ace, Ideo, 3d2y Brook, FN Marguerite ,Raid Zephyr" , 
             server:  "Global" } 
    end
    assert_redirected_to login_url
  end
  
  test "should redirect destroy when not logged in" do
    assert_no_difference 'Run.count' do
      delete run_path(@run)
    end
    assert_redirected_to login_url
  end
  
  
end
