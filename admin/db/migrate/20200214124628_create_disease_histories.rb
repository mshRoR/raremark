class CreateDiseaseHistories < ActiveRecord::Migration[6.0]
  def change
    create_table :disease_histories, comment: 'Store user diseases entry' do |t|
      t.references :user, null: false, foreign_key: true
      t.references :disease, null: false, foreign_key: true

      t.timestamps
    end
  end
end
