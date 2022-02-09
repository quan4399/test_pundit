class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.column :title , :string
      t.column :user_id, :bigint
      t.foreign_key :users , foreign_key: true
    end
  end
end
