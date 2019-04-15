class AddContentToAhoyMessage < ActiveRecord::Migration[5.2]
  def change
    add_column :ahoy_messages, :content, :text
  end
end
