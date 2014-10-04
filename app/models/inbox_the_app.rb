module InboxTheApp

  BASE_URL = 'https://devs.inboxtheapp.com'

  def self.send_message(username, body)
    HTTParty.post("#{BASE_URL}/message",
      headers: {
        'Authorization' => 'Bearer Y8dP9VwrDgRAtYXr5rtUV1J7RphNoRUtMXvEPLzbtEXJeInJjPSC9Egxseye'
      },
      body: {
        to: username, text: body
        }
    )
  end

end
