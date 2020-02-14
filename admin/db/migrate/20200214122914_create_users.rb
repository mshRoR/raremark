class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users, comment: 'Users records entry' do |t|
      t.string :email, null: false, default: '', comment: 'User email id'
      t.string :name, null: false, default: '', comment: 'Name of user'
      t.datetime :deleted_at, comment: 'User deleted date and time'
      t.datetime :suspended_at, comment: 'User suspended date and time'

      t.timestamps
    end
  end
end
