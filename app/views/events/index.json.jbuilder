json.array!(@events) do |event|
  json.extract! event, :id, :title, :note, :starts_at, :ends_at, :datejump, :company_id, :participant, :extern, :service
  json.url event_url(event, format: :json)
end
