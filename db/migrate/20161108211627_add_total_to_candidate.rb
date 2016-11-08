class AddTotalToCandidate < ActiveRecord::Migration[5.0]
  def change
    add_column :candidates, :total, :integer
  end
end
