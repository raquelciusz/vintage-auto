class AddPhotoUrlToCar < ActiveRecord::Migration[7.0]
  def change
    add_column :cars, :photo_url, :text
  end
end
