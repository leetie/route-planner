class RemoveNameFromInputs < ActiveRecord::Migration[6.0]
  def change
    remove_column :inputs, :name
    remove_column :inputs, :zipcode
  end
end
