class ChatbotsController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  #csrf tokenの問題で追記コード
  protect_from_forgery

  def create
    input = params[:input]
    client = OpenAI::Client.new(access_token: ENV["OPENAI_ACCESS_TOKEN"])
    response = client.chat(
      parameters: {
        model: "gpt-3.5-turbo",
        messages: [
          { role: "system", content: "You are a helpful assistant. response to japanese" },
          { role: "user", content: input }
        ],
        temperature: 1.0,
        max_tokens: 3000,
      }
    )


    respond_to do |format|
      format.json { render json: { response: response.dig("choices", 0, "message", "content") } }
    end
  end
end