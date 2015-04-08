class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name
      t.string :teacher
      t.string :place
      t.string :time
      t.integer :credit

      t.timestamps null: false
    end
  end
end
