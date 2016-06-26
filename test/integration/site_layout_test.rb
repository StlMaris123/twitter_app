require 'test_helper'

class SiteLinksTest < ActionDispatch::IntegrationTest
  test "layout links" do 
    get root_path
    assert_template 'static_pages/home'
    assert_select "a[href=?]", root_url
    assert_select "a[href=?]", about_url
    assert_select "a[href=?]", help_url
    assert_select "a[href=?]", faq_url
    assert_select "a[href=?]", contact_url
  end
end
