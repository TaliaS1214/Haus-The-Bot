module QueryParser

  def self.get_response(raw_text_message, house, user)

    text_message = raw_text_message.downcase.strip

    house.nil? ? "Go to www.hausthebott.com to join a haus!" : outgoing_message(text_message, house, user)

  end

  def self.outgoing_message(text_message, house, user)
    first_word = text_message.split.first
    case first_word
    when 'help'
      help_text

    when 'do'
      item_name = text_message.split("have ").last.gsub("?", "")
      try_to_find_item(item_name)

    when 'add'
      item_names = text_message.split("add ").last
      item_names = item_names.split(", ")
      if item_names.length > 1
        item_names.each do |item_name|
          new_item = Item.create({name: item_name,
            perishable: false,
            bought: false
          })
          house.items << new_item
          user.items << new_item
        end
        stringified_list = item_names[0..-2].join(', ') + " and " + item_names.last
      else
        if text_message.include? '-p'
          item_name = item_names[0].gsub(' -p', '')
          new_item = Item.create({name: item_name,
            perishable: true,
            bought: false
          })
        else
          item_name = item_names.first
          new_item = Item.create({name: item_name,
            perishable: false,
            bought: false
          })
        end
        house.items << new_item
        user.items << new_item
        stringified_list = item_names[0].gsub(' -p', '')
      end

      "Added #{stringified_list} to the list!"

    when 'list'
      items_to_buy = house.items.select { |item| !item.bought }

      message_to_display = "Items We Need\n" +
      "=============\n"

      items_to_buy.each do |item|
        message_to_display += (item.name.split.map(&:capitalize).join(' ') + "\n")
      end
      message_to_display.strip

    when 'bought'
      item_names = text_message.split("bought ").last.split(', ')

      item_names.each do |item_name|
        unbought_items = Item.where(name: item_name, bought: false)
        unbought_items.each do |item|
          item.bought = true
          item.purchase_date = Date.today
          item.save
        end
      end

      if item_names.length > 1
        stringified_list = item_names[0..-2].join(', ') + " and " + item_names.last
      else
        stringified_list = item_names[0]
      end
      "Crossed #{stringified_list} off the list!"

    when text_message
      item_name = text_message[0..-2]
      house.items.each do |item|
        if item.name == item_name
          try_to_find_item(item_name)
        end
      end
      "Sorry, I think you made a typo."
    else
      "Sorry, I think you made a typo."
    end
  end

  def self.try_to_find_item(item_name)
    item = Item.where(name: item_name, bought: true).sort_by(&:purchase_date).last
    item.nil? ? "We don't have any! Pick some up." : message_if_perishable(item)
  end

  def self.message_if_perishable(item)
    days_since_purchase  = (Date.today - item.purchase_date).to_i

    if item.perishable?
      get_perishable_text(item.purchase_date)
    else
      "#{item.user.handle} bought some some #{days_since_purchase} days ago, " +
      "but it won't spoil, so don't worry about it."
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
    "Welcome to Hausthebott!\n\n" +
    "'add <item name>'\n" +
    "--> add an item\n\n" +
    "'add <item name> -p'\n" +
    "--> add a perishable item\n\n" +
    "'do we need <item name>?'\n" +
    "--> check item status\n\n" +
    "'<item name>?'\n" +
    "--> check item status\n\n" +
    "'bought <item name(s)>'\n" +
    "--> mark item as bought\n\n" +
    "'list'\n" +
    "--> see all unbought items\n\n" +
    "To see this help menu at any time type 'help'"
  end

end
