class Event < ActiveRecord::Base
  belongs_to :client
  attr_accessible :event_description, :event_type
  validates :event_description, presence: true
end
