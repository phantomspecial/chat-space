json.name @message.user.name
json.content  @message.content
json.image @message.image
json.time @message.created_at.in_time_zone('Tokyo').strftime("%Y/%m/%d %H:%M:%S")
json.group_id @message.group_id
