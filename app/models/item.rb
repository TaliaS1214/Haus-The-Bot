class Item < ActiveRecord::Base
  validates_presence_of :name, :is_perishable
  belongs_to :house
  belongs_to :user
end
