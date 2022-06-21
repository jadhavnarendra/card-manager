class CardJob < ApplicationJob
  # include Sidekiq::Worker
  queue_as :default
  
  def perform(user)
    # CardMailer.new_card_email(user).deliver_later(5.hours.from_now)
    CardMailer.new_card_email(user).deliver_later(wait: 1.week)
  end

end
# Sidekiq::Cron::Job.create(name: 'Card job - every 1min', cron: '*/1 * * * *', class: 'CardJob')
