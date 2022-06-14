class CardsJob
  include Sidekiq::Job

  def perform(user)
  CardMailer.new_card_email(user).deliver
end
end
