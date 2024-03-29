# ## Schema Information
#
# Table name: `users`
#
# ### Columns
#
# Name                          | Type               | Attributes
# ----------------------------- | ------------------ | ---------------------------
# **`id`**                      | `bigint`           | `not null, primary key`
# **`confirmation_sent_at`**    | `datetime`         |
# **`confirmation_token`**      | `string`           |
# **`confirmed_at`**            | `datetime`         |
# **`current_sign_in_at`**      | `datetime`         |
# **`current_sign_in_ip`**      | `string`           |
# **`email`**                   | `string`           | `default(""), not null`
# **`encrypted_password`**      | `string`           | `default(""), not null`
# **`failed_attempts`**         | `integer`          | `default(0), not null`
# **`last_sign_in_at`**         | `datetime`         |
# **`last_sign_in_ip`**         | `string`           |
# **`lock_version`**            | `integer`          | `default(0)`
# **`locked_at`**               | `datetime`         |
# **`provider`**                | `string`           |
# **`remember_created_at`**     | `datetime`         |
# **`reset_password_sent_at`**  | `datetime`         |
# **`reset_password_token`**    | `string`           |
# **`sign_in_count`**           | `integer`          | `default(0), not null`
# **`uid`**                     | `uuid`             | `not null`
# **`uid_provider`**            | `string`           |
# **`unconfirmed_email`**       | `string`           |
# **`unlock_token`**            | `string`           |
# **`created_at`**              | `datetime`         | `not null`
# **`updated_at`**              | `datetime`         | `not null`
#
# ### Indexes
#
# * `index_users_on_confirmation_token` (_unique_):
#     * **`confirmation_token`**
# * `index_users_on_email` (_unique_):
#     * **`email`**
# * `index_users_on_provider_and_uid_provider` (_unique_):
#     * **`provider`**
#     * **`uid_provider`**
# * `index_users_on_reset_password_token` (_unique_):
#     * **`reset_password_token`**
# * `index_users_on_uid` (_unique_):
#     * **`uid`**
# * `index_users_on_unlock_token` (_unique_):
#     * **`unlock_token`**
#
require 'rails_helper'

RSpec.describe User do
  describe 'new' do
    let(:user) { create(:user) }

    it 'uid should not be nil' do
      expect(user.uid).not_to be_nil
    end
  end

  describe 'valid?' do
    let(:user) { create(:user) }

    context 'when uuid set to nil' do
      before do
        user.uid = nil
        user.valid?
      end

      it 'errors not be nil' do
        expect(user.errors['uid']).not_to be_nil
      end

      it 'errors should contain the uid attribute' do
        expect(user.errors['uid'].length).to be > 0
      end
    end
  end
end
