class CreateInputs < ActiveRecord::Migration[6.0]
  def change
    create_table :inputs do |t|
      t.string :title
      t.string :zipcode

      t.timestamps
    end
  end
end
