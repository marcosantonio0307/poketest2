class CreateTrainers < ActiveRecord::Migration[6.0]
  def change
    create_table :trainers do |t|
      t.string :name
      t.integer :age
      t.string :login
      t.string :gender

      t.timestamps
    end
  end
end
