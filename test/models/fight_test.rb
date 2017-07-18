require 'test_helper'

class FightTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
     @fight = Fight.new(boss: "Vista",
                        stamina: 30,
                        stages:5,
                        category:"Colosseum")
  end
  
  test "boss should be present" do
    @fight.boss = nil
    assert_not @fight.valid?
  end
  
  test "Stamina shoudl be in range" do
    @fight.stamina = nil
    assert_not @fight.valid?
    @fight.stamina = 61
    assert_not @fight.valid?
  end
  
  test "Stages should be in range" do
    @fight.stages = 0
    assert_not @fight.valid?
    @fight.stages = 21
    assert_not @fight.valid?
  end
  
  test "category should be present" do
    @fight.category = nil
    assert_not @fight.valid?
  end
  
end
