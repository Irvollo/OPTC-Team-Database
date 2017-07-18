require 'test_helper'

class RunTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  def setup
    @user = users(:luffy)
    @fight = fights(:vista_colo)
    
    @run = @user.runs.build( fight_id: @fight.id,
                              user_id: @user.id, 
                              captain_class: "Shooter", 
                              description: "This is a short description for the video", 
                              youtube_url: "https://www.youtube.com/watch?v=LKibi1f2Y3s", 
                              title: "2x SW Ace, Ideo, 3d2y Brook, FN Marguerite ,Raid Zephyr", 
                              server: "Global")
  end
  
  test "should be valid" do
    assert @run.valid?
  end
  
  test "user id should be present" do
    @run.user_id = nil
    assert_not @run.valid?
  end
  
  test "fight id should be present" do
    @run.fight_id = nil
    assert_not @run.valid?
  end
  
  test "captain_class should be present" do
    @run.captain_class = nil
    assert_not @run.valid?
  end
  
  test "captain_class should be at most 20 characters" do
    @run.captain_class = "a" * 21
    assert_not @run.valid?
  end
  
  test "description should be at most 500 characters" do
    @run.description = "a" * 501 
    assert_not @run.valid?
  end
  
  test "youtube_url should be a valid youtube link" do
    @run.youtube_url = "www.vimeo.com"
    assert_not @run.valid?
  end
  
  test "title should have a valid format" do
    @run.title = "Raid Kizaru, SW Ace, Legend Marco, Zephyr, Heracles-un, GPU"
    assert_not @run.valid?
  end
  
  test "server should be present" do
    @run.server = nil
    assert_not @run.valid?
  end
  
  test "order should be most recent first" do
    assert_equal runs(:most_recent), Run.first
  end
  
end
