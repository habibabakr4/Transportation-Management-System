class AddConstraintsToDrivers < ActiveRecord::Migration[7.0]
  def change
    rename_column :drivers, :password, :password_digest
    change_column_null :drivers, :email, false
    
    unless index_exists?(:drivers, :email)
      add_index :drivers, :email, unique: true
    end
  end
end
