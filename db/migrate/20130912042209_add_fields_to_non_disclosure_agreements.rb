class AddFieldsToNonDisclosureAgreements < ActiveRecord::Migration
  def change
    add_column :non_disclosure_agreements, :active, :boolean, default: false
    add_column :non_disclosure_agreements, :primary_nda, :boolean, default: false
  end
end
