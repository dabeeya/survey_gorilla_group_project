class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.string :input
      t.belongs_to :choice

      t.timestamps
    end
  end
end
