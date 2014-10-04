class House < ActiveRecord::Base
  has_many :users
  has_many :items
  after_create :add_pin
  validates :name, presence: true

  def add_pin
    update(pin: generate_pin)
  end

  def generate_pin
    pin = SecureRandom.hex(10)
    House.where("pin = ?", pin).exists? ? generate_pin : pin
  end

end
