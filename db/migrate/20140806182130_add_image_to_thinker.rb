class AddImageToThinker < ActiveRecord::Migration
  def change
    add_column :thinkers, :image_url, :string
  end
end
