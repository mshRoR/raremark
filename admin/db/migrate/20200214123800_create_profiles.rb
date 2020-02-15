class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles, comment: 'User profile details' do |t|
      t.references :user, null: false, foreign_key: true
      t.string :gender, null: false, default: '', comment: 'store user gender'
      t.integer :born_year, comment: 'store user born year'
      t.integer :born_month, comment: 'store user born month'
      t.references :country, null: false, foreign_key: true
      t.integer :profile_type, null: false, default: 0, comment: 'store user type (Patient or Carer)'

      t.timestamps
    end
  end
end
