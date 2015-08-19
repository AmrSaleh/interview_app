class CreateDateRequests < ActiveRecord::Migration
  def change
    create_table :date_requests do |t|
      t.string :interview_id
      t.string :requested_date

      t.timestamps
    end
  end
end
