class CreateFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :favorites do |t|
      t.references :user, null:false
      t.references :article, null:false
      t.timestamps null: false
    end

    add_index :articles, :user_id
    add_index :articles, :article_id
  end
end
