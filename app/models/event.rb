class Event < ActiveRecord::Base

  belongs_to :user
  belongs_to :investor

  has_many :participants
  has_many :attendees, :through => :participants, :source => :user
  # has_many :users, :through => :participants

  accepts_nested_attributes_for :participants

end
