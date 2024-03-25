# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

if Rails.env.development?
  # HACK: Required to foce load env vars
  require 'dotenv/load'
end

Rails.logger.debug 'Deleting data ...'

ActiveRecord::Base.connection.execute('DELETE FROM users')

ActiveRecord::Base.connection.execute('DELETE FROM active_storage_variant_records')
ActiveRecord::Base.connection.execute('DELETE FROM active_storage_attachments')
ActiveRecord::Base.connection.execute('DELETE FROM active_storage_blobs')

Rails.logger.debug 'Creating users ...'

admin_user = User.new(
  email: 'admin@local',
  password: 'hrQbE9wDRsdPThZpcUEP',
  password_confirmation: 'hrQbE9wDRsdPThZpcUEP',
  confirmed_at: DateTime.now
)

admin_user.skip_confirmation_notification!
admin_user.save!
