class AddFieldsToSignatures < ActiveRecord::Migration
  def change
    add_column :signatures, :name, :string
    add_column :signatures, :drawn_signature, :text
  end
end
