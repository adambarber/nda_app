class AddMetaDataToSignatures < ActiveRecord::Migration
  def change
    add_column :signatures, :ip_address, :string
    add_column :signatures, :device_type, :string
    add_column :signatures, :device_browser, :string
  end
end
