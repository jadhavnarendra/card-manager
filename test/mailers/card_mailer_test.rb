require "test_helper"

class CardMailerTest < ActionMailer::TestCase
  # test "the truth" do
  #   assert true
  # end


  test "new card email" do
    # Set up an order based on the fixture
    card = cards(:one)

    # Set up an email using the order contents
    email = CardMailer.with(card: card).new_card_email

    # Check if the email is sent
    assert_emails 1 do
      email.deliver_now
    end

    # Check the contents are correct
    assert_equal "jadhav@gmail.com", email.from
    assert_equal "narendrajadhav0707@gmail.com", email.to
    assert_equal "You got a new card!", email.subject
    assert_match card.name, email.html_part.body.encoded
    assert_match card.name, email.text_part.body.encoded
    assert_match card.card_number, email.html_part.body.encoded
    assert_match card.card_number, email.text_part.body.encoded
    
  end

  test "delete card email" do
    # Set up an order based on the fixture
    card = cards(:one)

    # Set up an email using the order contents
    email = CardMailer.with(card: card).delete_card_email

    # Check if the email is sent
    assert_emails 1 do
      email.deliver_now
    end
  end
end
