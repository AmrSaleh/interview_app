class ChangeDateToTextview < ActiveRecord::Migration
   def up
    change_column :interviews, :date, :string
  end

  def down
    change_column :interviews, :date, :date
  end
end
