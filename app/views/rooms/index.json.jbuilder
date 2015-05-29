json.array!(@rooms) do |room|
  json.extract! room, :id, :name, :attachment_id, :shortcut, :category_id
  json.url room_url(room, format: :json)
end
