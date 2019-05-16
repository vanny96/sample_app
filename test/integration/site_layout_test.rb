require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
  include ApplicationHelper

  def setup
    @user = users(:michael)
  end

  test "layout links" do
    get root_path
    assert_template 'static_pages/home'
    assert_select "a[href=?]", root_path, count: 2
    assert_select "a[href=?]", help_path
    assert_select "a[href=?]", about_path
    assert_select "a[href=?]", contact_path

    assert_select "title", full_title('Home')

    get signup_path
    assert_template 'users/new'
    assert_select "title", full_title('Sign Up')

    log_in_as(@user)
    assert_redirected_to @user

  end
end
