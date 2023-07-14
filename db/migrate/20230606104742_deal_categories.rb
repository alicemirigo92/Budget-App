class DealCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :deal_categories do |t|
      t.references :category, null: false, foreign_key: true
      t.references :deal, null: false, foreign_key: true

      t.timestamps
    end
  end
end
