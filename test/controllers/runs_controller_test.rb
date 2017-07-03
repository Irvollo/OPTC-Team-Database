require 'test_helper'

class RunsControllerTest < ActionController::TestCase
  setup do
    @run = runs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:runs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create run" do
    assert_difference('Run.count') do
      post :create, run: { captain_type: @run.captain_type, db_team_url: @run.db_team_url, duration: @run.duration, fight_id: @run.fight_id, run_desc: @run.run_desc, title: @run.title, user_id: @run.user_id, youtube_url: @run.youtube_url }
    end

    assert_redirected_to run_path(assigns(:run))
  end

  test "should show run" do
    get :show, id: @run
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @run
    assert_response :success
  end

  test "should update run" do
    patch :update, id: @run, run: { captain_type: @run.captain_type, db_team_url: @run.db_team_url, duration: @run.duration, fight_id: @run.fight_id, run_desc: @run.run_desc, title: @run.title, user_id: @run.user_id, youtube_url: @run.youtube_url }
    assert_redirected_to run_path(assigns(:run))
  end

  test "should destroy run" do
    assert_difference('Run.count', -1) do
      delete :destroy, id: @run
    end

    assert_redirected_to runs_path
  end
end
