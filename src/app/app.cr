require "json"
require "uri"
require "./module/*"

class App
  def initialize(@event : JSON::Any)
  end

  def run
    if @event["body"]["type"] == "url_verification"
      @event["body"]["challenge"]
    else
      channel = NewChannel.new @event["body"]
      slack = Slack.new "#{ENV["WEBHOOK_URL"]}"

      slack.post "<##{channel.id}> has created by <@#{channel.creator}>"

      return {
        result: "ok"
      }
    end
  end
end