require 'test_helper'

class NoticesControllerTest < ActionDispatch::IntegrationTest

  def setup
    @notice = notices(:monster)
    @admin = users(:pikeman)
    @non_admin = users(:archer)
  end

  test "should redirect destroy when not logged in" do
    assert_no_difference 'Notice.count' do
      delete notice_path(@notice)
    end
    assert_redirected_to login_url
  end

  test "should redirect destroy when wrong non-admin user" do
    log_in_as(@non_admin)
    notice = notices(:monster)
    assert_no_difference 'Notice.count' do
      delete notice_path(notice)
    end
    assert_redirected_to root_url
  end

  test "should destroy post when admin user" do
    log_in_as(@admin)
    notice = notices(:micropost_1)
    assert_difference 'Notice.count', -1 do
      delete notice_path(notice)
    end
    assert_redirected_to root_url
  end

  test "should destroy post when posts owner" do
    log_in_as(@non_admin)
    notice = notices(:micropost_1)
    assert_difference 'Notice.count', -1 do
      delete notice_path(notice)
    end
    assert_redirected_to root_url
  end
end
