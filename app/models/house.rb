class House < ActiveRecord::Base
  has_many :users
  has_many :items
  after_create :add_pin

  def add_pin
    update(pin: generate_pin)
  end

  def generate_pin
    pin = SecureRandom.base64(23)
    House.where("pin = ?", token).exists? ? generate_pin : pin
  end

end
