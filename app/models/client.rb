class Client < ActiveRecord::Base
  has_many :events
  attr_accessible :address, :city, :country, :fullname, :index, 
                  :inn, :kpp, :ogrn, :shortname, :client_type

  validates :shortname, presence: true
  validates :fullname, presence: true
  validates :inn, presence: true  
end
