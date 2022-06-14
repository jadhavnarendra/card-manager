class CardJob < ApplicationJob
  # include Sidekiq::Job
  queue_as :default
  
  def perform(user)
    CardMailer.new_card_email(user).deliver
  end
  
end
