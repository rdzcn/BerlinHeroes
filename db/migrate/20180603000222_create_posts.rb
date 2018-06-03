class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.references :user
      t.string :category
      t.string :location

      t.timestamps
    end
  end
end
