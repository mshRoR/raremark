class CreateCountries < ActiveRecord::Migration[6.0]
  def change
    create_table :countries, comment: 'Contries name' do |t|
      t.string :name, null: false, index: true, comment: 'Name of country'
      t.string :iso3, comment: 'shortcode of country name'
      t.string :iso2, comment: 'shortcode of country name'

      t.timestamps
    end
  end
end
