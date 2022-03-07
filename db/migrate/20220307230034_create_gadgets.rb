class CreateGadgets < ActiveRecord::Migration[6.1]
  def change
    create_table :gadgets do |t|
      t.string :name
      t.string :description
      # t.references :owner, null: false, foreign_key: true # owners
      t.references :owner, null: false, foreign_key: { to_table: :users } # users

      t.timestamps
    end
  end
end
