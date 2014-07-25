class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.belongs_to :survey
      t.belongs_to :response

      t.timestamps
    end
  end
end
