class AddCreatedAtToArticles < ActiveRecord::Migration[6.0]
  def change
    add_column :articles, :new_created_at, :string
  end
end
