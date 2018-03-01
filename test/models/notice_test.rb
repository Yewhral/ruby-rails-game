require 'test_helper'

class NoticeTest < ActiveSupport::TestCase
  def setup
    @user = users(:pikeman)
    @notice = @user.notices.build(content: "Test message")
  end

  test "should be valid" do
    assert @notice.valid?
  end

  test "user id should be present" do
    @notice.user_id = nil
    assert_not @notice.valid?
  end

  test "content should be present" do
    @notice.content = "   "
    assert_not @notice.valid?
  end

  test "content should be at most 120 characters" do
    @notice.content = "a" * 121
    assert_not @notice.valid?
  end

  test "order should be most recent first" do
    assert_equal notices(:tax), Notice.first
  end

end
