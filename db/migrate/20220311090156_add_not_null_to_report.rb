class AddNotNullToReport < ActiveRecord::Migration[6.1]
  def change
    change_column :reports, :title, :string, null: false
    change_column :reports, :content, :text, null: false
  end
end
