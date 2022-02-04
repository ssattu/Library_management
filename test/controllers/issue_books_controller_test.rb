require "test_helper"

class IssueBooksControllerTest < ActionDispatch::IntegrationTest
  test "should get _form" do
    get issue_books__form_url
    assert_response :success
  end

  test "should get index" do
    get issue_books_index_url
    assert_response :success
  end

  test "should get new" do
    get issue_books_new_url
    assert_response :success
  end

  test "should get create" do
    get issue_books_create_url
    assert_response :success
  end

  test "should get edit" do
    get issue_books_edit_url
    assert_response :success
  end

  test "should get update" do
    get issue_books_update_url
    assert_response :success
  end

  test "should get show" do
    get issue_books_show_url
    assert_response :success
  end

  test "should get destroy" do
    get issue_books_destroy_url
    assert_response :success
  end
end
