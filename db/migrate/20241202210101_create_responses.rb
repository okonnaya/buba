class CreateResponses < ActiveRecord::Migration[7.0]
  def change
    create_table :responses do |t|
      t.text :email, null: false
      t.text :message

      t.timestamps
    end
  end
end
