require "json"
require "uri"
require "./../../runtime/webhook"

class Slack
  def initialize(url : String)
    @slack = WebHook.new  url
  end

  def post(message : String, title, : String, footer : String)
    post = {
      fallback: message,
      pretext: title,
      title: title,
      color: "#4286f4",
      footer: footer,
    }
    body = {
      attachments: [post]
    }

    return @slack.post body
  end
end