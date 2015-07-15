class CreateInterviewees < ActiveRecord::Migration
  def change
    create_table :interviewees do |t|
      t.string :name
      t.string :cv

      t.timestamps
    end
  end
end
