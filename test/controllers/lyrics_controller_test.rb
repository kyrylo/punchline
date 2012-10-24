require "minitest_helper"

describe LyricsController do

  before do
    @lyric = Lyric.new
  end

  it "must get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:lyrics)
  end

  it "must get new" do
    get :new
    assert_response :success
  end

  it "must create lyric" do
    assert_difference('Lyric.count') do
      post :create, lyric: @lyric.attributes
    end

    assert_redirected_to lyric_path(assigns(:lyric))
  end

  it "must show lyric" do
    get :show, id: @lyric.to_param
    assert_response :success
  end

  it "must get edit" do
    get :edit, id: @lyric.to_param
    assert_response :success
  end

  it "must update lyric" do
    put :update, id: @lyric.to_param, lyric: @lyric.attributes
    assert_redirected_to lyric_path(assigns(:lyric))
  end

  it "must destroy lyric" do
    assert_difference('Lyric.count', -1) do
      delete :destroy, id: @lyric.to_param
    end

    assert_redirected_to lyrics_path
  end

end
