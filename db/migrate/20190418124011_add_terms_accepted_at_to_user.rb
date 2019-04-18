class AddTermsAcceptedAtToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :terms_accepted_at, :datetime, default: nil, null: true
  end
end
