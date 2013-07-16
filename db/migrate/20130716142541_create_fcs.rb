class CreateFcs < ActiveRecord::Migration
  def change
    create_table :fcs do |t|
      t.string :name
      t.integer :user_id

      t.timestamps
    end
  end
end
