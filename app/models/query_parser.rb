module QueryParser

  def self.get_response(raw_text_message, house)

    text_message = raw_text_message.downcase.strip

    # If the user isn't in a house...
    if house.nil?
      outgoing_message = "Go to www.hausthebott.com to join a haus!"
    # If they are, and the person asks using the long form...
    elsif text_message.include? "do we have"
      item_name = text_message.split("have ").last.gsub("?", "")
      outgoing_message = try_to_find_item(item_name)
    else
      item_name = text_message[0..-2]
      outgoing_message = try_to_find_item(item_name)
    end

    outgoing_message
  end

  def self.try_to_find_item(item_name)
    item = Item.where(name: item_name, bought?: true).sort_by(&:purchase_date).last
    item ? message_if_perishable(item) "We don't have any! Pick some up."
  end

  def self.message_if_perishable(item)
    days_since_purchase  = (Date.today - purchase_date).to_i

    if item.perishable?
      get_perishable_text(item.purchase_date)
    else
      "#{item.user} bought some some #{days_since_purchase} days ago " +
      "but it won't spoil so don't worry about it."
    end
  end

  def self.get_perishable_text(purchase_date)
    days_since_purchase  = (Date.today - purchase_date).to_i
    case
    when days_since_purchase >= 10
      "It's been like, more than 10 days sooooooo you should definitely buy some."
    when days_since_purchase >= 5
      "It's coming up on a week so you should be fine."
    else
      "You're good, we've got some already."
    end
  end

  def self.help_text
    "Welcome to Hausthebott!\nTo add an item type 'add <item name>' If that item is perishable type 'add <item name> -p'\nTo check status of an item type '<item name>?'\nTo get a list of all unbought items type 'list'\nTo see this help menu at any time type 'help'"
  end

end
