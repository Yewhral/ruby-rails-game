require 'test_helper'

class NoticesIndexTest < ActionDispatch::IntegrationTest
  def setup
    @admin     = users(:pikeman)
    @non_admin = users(:archer)
  end

  test "index including pagination" do
    log_in_as(@admin)
    get notices_path
    assert_template 'notices/index'
    assert_select 'h1', text: 'Messages board'
    Notice.paginate(page: 1).each do |notice|
    assert_select 'a[href=?]', user_path(notice.user), text: notice.user.name
    end
  end
end
