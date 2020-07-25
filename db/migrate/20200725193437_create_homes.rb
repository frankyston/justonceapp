class CreateHomes < ActiveRecord::Migration[6.0]
  def change
    create_table :homes, id: :uuid do |t|
      t.string :name

      t.timestamps
    end
  end
end
