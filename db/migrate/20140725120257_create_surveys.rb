class CreateSurveys < ActiveRecord::Migration
  def change
    create_table :surveys do |t|
      t.string :title
      t.boolean :open
      t.belongs_to :user

      t.timestamps
    end
  end
end
