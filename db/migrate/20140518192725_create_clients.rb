class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :client_type
      t.string :inn
      t.string :kpp
      t.string :ogrn
      t.text :fullname
      t.string :shortname
      t.integer :index
      t.string :country
      t.text :city
      t.text :address

      t.timestamps
    end
  end
end
