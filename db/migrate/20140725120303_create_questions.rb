class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :context
      t.string :style
      t.belongs_to :survey

      t.timestamps
    end
  end
end
