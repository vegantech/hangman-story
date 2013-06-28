class CreateHangmen < ActiveRecord::Migration
  def change
    create_table :hangmen do |t|
      t.text :solution
      t.string :title
      t.text :puzzle

      t.timestamps
    end
  end
end
