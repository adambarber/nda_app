class AddSignatureAssociationToNonDisclosureAgreements < ActiveRecord::Migration
  def change
    add_reference :non_disclosure_agreements, :signature, index: true
  end
end
