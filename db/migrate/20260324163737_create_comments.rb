class CreateComments < ActiveRecord::Migration[8.1]
  def change
    create_table :comments do |t|
      t.references :post, null: false, foreign_key: true
      t.references :commenter, null: false, foreign_key: { to_table: :users }
      t.text :content
      t.integer :parent_comment_id

      t.timestamps
    end
  end
end
