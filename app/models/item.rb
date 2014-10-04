class Item < ActiveRecord::Base
  validates :name, :type, :is_perishable?, :bought?, presence: true
  belongs_to :house
end
