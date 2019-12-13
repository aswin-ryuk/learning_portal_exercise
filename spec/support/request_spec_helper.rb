module RequestSpecHelper
  def json
    JSON.parse(response.body)
  end

  def authenticated_header(request, user)
    token = Knock::AuthToken.new(payload: { sub: user.id }).token
    request.headers.merge!('Authorization': "Bearer #{token}")
  end

end
