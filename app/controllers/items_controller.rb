class ItemsController < ApplicationController
  include InboxTheApp

  def index

  end

  def create

  end

  def update

  end

  def hausthebott
    sender_username = params['sender']['username']
    # stuff here to process return text
    send_text = 'Sean bought milk 4 days ago. It is likely not expired'
    InboxTheApp.send_message(sender_username, send_text)
  end

end
