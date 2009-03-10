class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :identity_url
      t.string :yahoo_login

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end