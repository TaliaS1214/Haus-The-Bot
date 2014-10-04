module QueryParser

  def self.get_response(raw_text_message, house)

    text_message = raw_text_message.downcase.strip
    # If the user isn't in a house...
    if house.nil?
      outgoing_message = "Go to www.hausthebott.com to join a haus!"

    # If they are, and the person asks using the long form...
    elsif text_message.include? "do we have"

      # Get the item name
      item_name = text_message.split("have ").last.gsub("?", "")

      # If we can find the item, grab the one bought most recently
      if item = Item.where(name: item_name, bought?: true).sort_by(&:purchase_date).last

        # Does it spoil?
        if item.perishable?
          outgoing_message = get_perishable_text(item.purchase_date)
        else
          outgoing_message = "We have some but it won't spoil so don't worry about it."
        end

      else
        outgoing_message = "Nope! Pick some up."
      end
    # Otherwise, if they ask just using e.g. "milk?"
    else

    end

    outgoing_message
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
