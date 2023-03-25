class CreateMeals < ActiveRecord::Migration[7.0]
  def change
    create_table :meals, id: :uuid do |t|
      t.text :name
      t.text :notes

      t.timestamps
    end
  end
end
