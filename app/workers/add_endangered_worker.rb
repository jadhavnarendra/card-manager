# class AddEndangeredWorker < ApplicationJob
#     # require 'csv'
#     include Sidekiq::Worker
#     queue_as :default
#     sidekiq_options retry: false

#     def perform(user)
#         CardMailer.new_card_email(user).deliver
#         # CSV.foreach(csv_file, headers: true) do |shark|
#         # Endangered.create(name: shark[0], iucn: shark[1])
#       # end
#      end
  
#   end

#   Sidekiq::Cron::Job.create(name: 'Card job - every 1min', cron: '*/1 * * * *', class: 'AddEndangeredWorker')