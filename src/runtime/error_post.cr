require "json"
require "./../runtime/webhook"

class LambdaException < Exception
  def initialize(@message : String, @status_code : Int32)
  end

  def status_code
    @status_code
  end
end

module LambdaError
  extend self

  def send_slack(error, status_code = 500)
    message : String = "エラーみたい…確認してみよっか"
    post = {
      fallback: message,
      pretext: "<@#{ENV["SLACK_ID"]}> #{message}",
      title: error.message,
      text: error.backtrace.join("\n"),
      color: "#EB4646",
      footer: "limit7412/new_channel_notify_slack",
    }
    body = {
      attachments: [post]
    }

    slack : WebHook = WebHook.new  "#{ENV["WEBHOOK_URL_ERR"]}"
    slack.post body

    return error.message
  end
end