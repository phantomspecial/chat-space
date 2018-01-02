if @new_messages.present?
  messages = @new_messages
  json.array! messages do |message|
    json.name     message.user.name
    json.content  message.content
    json.image    message.image
    json.id       message.id
    json.time     message.created_at.in_time_zone('Tokyo').strftime("%Y/%m/%d %H:%M:%S")
  end
end
