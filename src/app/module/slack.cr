require "json"
require "uri"
require "./../../runtime/webhook"

class Slack
  def initialize(url : String)
    @slack = WebHook.new  url
  end

  def post(message : String, title : String, footer : String, text : String)
    post = {
      fallback: message,
      pretext: title,
      title: title,
      text: text,
      color: "#4286f4",
      footer: footer,
    }
    body = {
      attachments: [post]
    }

    @slack.post body

    return  {
      result: "ok"
    }
  end
end