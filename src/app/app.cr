require "json"
require "uri"
require "./module/*"

class App
  def initialize(@event : JSON::Any)
  end

  def run
    channel = NewChannel.new @event["body"]
    slack = Slack.new "#{ENV["WEBHOOK_URL"]}"

    slack.post(
      message: "新規チャンネル通知",
      title: "created new channel #{channel.name}",
      footer: "by #{channel.user}",
      text: @event["body"].to_json
    )

    return @event["body"]["challenge"]
  end
end