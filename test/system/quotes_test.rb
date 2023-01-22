require "application_system_test_case"

class QuotesTest < ApplicationSystemTestCase
  setup do
    @quote = quotes(:first) # Reference to the first fixture quote
  end

  test "Creating a new quote" do
    # When we visit the Quotes#index page
    # we expect to see a title with the text "Quotes"
    visit quotes_path
    assert_selector "h1", text: "見積もり一覧"

    # When we click on the link with the text "New quote"
    # we expect to land on a page with the title "New quote"
    click_on "見積もりを作成"
    assert_selector "h1", text: "見積もり新規作成"

    # When we fill in the name input with "Capybara quote"
    # and we click on "Create Quote"
    fill_in "名前", with: "Capybara quote"
    click_on "見積もりを作成"

    # We expect to be back on the page with the title "Quotes"
    # and to see our "Capybara quote" added to the list
    assert_selector "h1", text: "見積もり一覧"
    assert_text "Capybara quote"
  end

  test "Showing a quote" do
    visit quotes_path
    click_link @quote.name

    assert_selector "h1", text: @quote.name
  end

  test "Updating a quote" do
    visit quotes_path
    assert_selector "h1", text: "見積もり一覧"

    click_on "編集", match: :first
    assert_selector "h1", text: "見積もりの編集"

    fill_in "名前", with: "Updated quote"
    click_on "見積もりを更新"

    assert_selector "h1", text: "見積もり一覧"
    assert_text "Updated quote"
  end

  test "Destroying a quote" do
    visit quotes_path
    assert_text @quote.name

    click_on "削除", match: :first
    assert_no_text @quote.name
  end
end
