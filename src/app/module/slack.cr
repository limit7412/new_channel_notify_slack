require "json"
require "uri"
require "./../../runtime/webhook"

class Slack
  def initialize(url : String)
    @slack = WebHook.new  url
  end

  def post(text : String)
    post = {
      text: text,
      color: "#4286f4",
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