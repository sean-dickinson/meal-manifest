class CreateMeals < ActiveRecord::Migration[7.0]
  def change
    create_table :meals, id: :uuid do |t|
      t.string :name
      t.text :notes
      t.string :source

      t.timestamps
    end
  end
end
