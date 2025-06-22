module RequestSpecHelper
  def json
    JSON.parse(response.body)
  end

  def auth_headers(user)
    token = JsonWebToken.encode(user_id: user.id)
    {
      'Authorization' => "Bearer #{token}",
      'Content-Type' => 'application/json'
    }
  end
end
