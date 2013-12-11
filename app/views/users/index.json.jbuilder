json.array!(@users) do |user|
  json.value user.email
  json.id user.id
end
