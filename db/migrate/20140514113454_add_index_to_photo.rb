class AddIndexToPhoto < ActiveRecord::Migration
  def change
    add_index :photos, :created_at, order: :desc
  end
end
