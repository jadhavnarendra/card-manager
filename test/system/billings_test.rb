require "application_system_test_case"

class BillingsTest < ApplicationSystemTestCase
  setup do
    @billing = billings(:one)
  end

  test "visiting the index" do
    visit billings_url
    assert_selector "h1", text: "Billings"
  end

  test "creating a Billing" do
    visit billings_url
    click_on "New Billing"

    fill_in "Amount paid", with: @billing.amount_paid
    fill_in "Card number", with: @billing.card_number
    fill_in "Cvc", with: @billing.cvc
    fill_in "Due amount", with: @billing.due_amount
    fill_in "Name", with: @billing.name
    fill_in "Postal code", with: @billing.postal_code
    fill_in "Product", with: @billing.product
    fill_in "Total amount", with: @billing.total_amount
    fill_in "Valid thru", with: @billing.valid_thru
    click_on "Create Billing"

    assert_text "Billing was successfully created"
    click_on "Back"
  end

  test "updating a Billing" do
    visit billings_url
    click_on "Edit", match: :first

    fill_in "Amount paid", with: @billing.amount_paid
    fill_in "Card number", with: @billing.card_number
    fill_in "Cvc", with: @billing.cvc
    fill_in "Due amount", with: @billing.due_amount
    fill_in "Name", with: @billing.name
    fill_in "Postal code", with: @billing.postal_code
    fill_in "Product", with: @billing.product
    fill_in "Total amount", with: @billing.total_amount
    fill_in "Valid thru", with: @billing.valid_thru
    click_on "Update Billing"

    assert_text "Billing was successfully updated"
    click_on "Back"
  end

  test "destroying a Billing" do
    visit billings_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Billing was successfully destroyed"
  end
end
