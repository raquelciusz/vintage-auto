class ChangeCarsColumnType < ActiveRecord::Migration[7.0]
  def change
    rename_column :cars, :type, :selection
  end
end
