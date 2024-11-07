class CreateAffirmations < ActiveRecord::Migration[7.2]
  def change
    create_table :affirmations do |t|
      t.text :text

      t.timestamps
    end
  end
end
