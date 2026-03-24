class CreateSubscriptionEmails < ActiveRecord::Migration[8.1]
  def change
    create_table :subscription_emails do |t|
      t.references :post, null: false, foreign_key: true
      t.references :subscription, null: false, foreign_key: true
      t.string :status

      t.timestamps
    end
  end
end
