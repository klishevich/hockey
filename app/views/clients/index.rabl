collection @clients
attributes :id, :address, :city, :country, :fullname, :inn, :kpp
child(:events) { attributes :event_description, :event_type }