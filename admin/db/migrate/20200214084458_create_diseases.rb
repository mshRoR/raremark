class CreateDiseases < ActiveRecord::Migration[6.0]
  def change
    create_table :diseases, comment: 'Name of diseases record' do |t|
      t.string :name, null: false, index: true, comment: 'Name of disease'

      t.timestamps
    end
  end
end
