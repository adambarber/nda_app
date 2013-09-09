class AddSignatureAssociationToNonDisclosureAgreements < ActiveRecord::Migration
  def change
    add_reference :signatures, :non_disclosure_agreement , index: true
  end
end
