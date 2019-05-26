require "json"

class NewChannel
  def initialize(@body : JSON::Any)
  end

  def id()
    @body["channel"]["id"]
  end

  def creator()
    @body["channel"]["creator"]
  end
end