require "./../app/app"
require "./../runtime/handler"
require "./../runtime/error_post"

def notify_slack(event)
  begin
    app : App = App.new event
    response = app.run

    return response
  rescue ex : LambdaException
    LambdaError.send_slack ex, ex.status_code
  rescue ex
    LambdaError.send_slack ex
  end
end

lambda_handler(notify_slack)