class Item < ActiveRecord::Base
  validates_presence_of :name, :kind
  belongs_to :house
  belongs_to :user
end
