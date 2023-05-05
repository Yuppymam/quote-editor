require "application_system_test_case"

class QuotesTest < ApplicationSystemTestCase
  setup do
    login_as users(:accountant)
    @quote = Quote.ordered.first
  end

  test "見積もりを表示" do
    visit quotes_path
    click_link @quote.name

    assert_selector "h1", text: @quote.name
  end

  test "見積もりを作成" do
    visit quotes_path
    assert_selector "h1", text: "見積もり一覧"

    click_on "見積もりを新規作成"
    fill_in "名前", with: "Capybara quote"

    assert_selector "h1", text: "見積もり一覧"
    click_on "作成する"

    assert_selector "h1", text: "見積もり一覧"
    assert_text "Capybara quote"
  end

  test "見積もりを更新" do
    visit quotes_path
    assert_selector "h1", text: "見積もり一覧"

    click_on "編集", match: :first
    fill_in "名前", with: "Updated quote"

    assert_selector "h1", text: "見積もり一覧"
    click_on "見積もりを更新"

    assert_selector "h1", text: "見積もり一覧"
    assert_text "Updated quote"
  end

  test "見積もりを削除" do
    visit quotes_path
    assert_text @quote.name

    click_on "削除", match: :first
    assert_no_text @quote.name
  end
end
