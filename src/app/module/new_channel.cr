require "json"

class NewChannel
  def initialize(@event : JSON::Any)
    # TODO: 仮
    @name = "name"
    @user = "user"
  end

  def name()
    @name
  end

  def user()
    @user
  end
end