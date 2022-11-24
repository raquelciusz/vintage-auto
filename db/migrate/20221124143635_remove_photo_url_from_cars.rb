class RemovePhotoUrlFromCars < ActiveRecord::Migration[7.0]
  def change
    remove_column :cars, :photo_url, :text
  end
end
