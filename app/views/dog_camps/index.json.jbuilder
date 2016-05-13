json.array!(@dog_camps) do |dog_camp|
  json.extract! dog_camp, :id, :name, :address, :capacity
  json.url dog_camp_url(dog_camp, format: :json)
end
