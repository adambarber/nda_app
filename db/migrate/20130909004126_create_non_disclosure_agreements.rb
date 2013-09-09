class CreateNonDisclosureAgreements < ActiveRecord::Migration
  def change
    create_table :non_disclosure_agreements do |t|
      t.text :body
      t.string :name

      t.timestamps
    end
  end
end
