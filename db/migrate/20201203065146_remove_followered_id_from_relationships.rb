class RemoveFolloweredIdFromRelationships < ActiveRecord::Migration[5.2]
  def change
    remove_column :relationships, :followered_id, :integer
  end
end
