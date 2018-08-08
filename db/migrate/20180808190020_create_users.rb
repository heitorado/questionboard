class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :login
      t.integer :assistance_year

      t.timestamps
    end
  end
end
