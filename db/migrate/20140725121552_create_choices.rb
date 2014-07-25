class CreateChoices < ActiveRecord::Migration
  def change
    create_table :choices do |t|
      t.strings :type
      t.belongs_to :question

      t.timestamps
    end
  end
end
