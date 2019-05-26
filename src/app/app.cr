require "json"
require "uri"
require "./module/*"

class App
  def initialize(@event)
  end

  def run
    channel = Channel.new @event
    slack = Slack.new "#{ENV["WEBHOOK_URL"]}"

    return slack.post(
      message: "新規チャンネル通知",
      title: "created new channel #{channel.name}",
      footer: "by #{channel.user}",
    )
  end
end