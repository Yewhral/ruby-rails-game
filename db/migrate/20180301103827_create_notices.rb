class CreateNotices < ActiveRecord::Migration[5.1]
  def change
    create_table :notices do |t|
      t.text :content
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :notices, [:user_id, :created_at]
  end
end
