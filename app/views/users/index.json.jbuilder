json.invites(@users) do |json, user|
  json.id user.id
  json.email user.email 
end
