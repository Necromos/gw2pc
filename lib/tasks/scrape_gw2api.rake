namespace :gw2api do
  desc 'Get all worlds from gw2api'
  task :get_worlds => :environment do
    worlds = JSON.parse(open("https://api.guildwars2.com/v1/world_names.json").read)
    worlds.each do |world|
      world_check = World.where(:id => world['id'])
      if world_check.present?
        puts "#{world['name']} exists in database"
      else
        if world['id'].to_i/1000 == 1
          l = "us"
        else
          l = "en"
        end
        World.create(:id => world['id'], :name => world['name'], :region => l)
        puts "#{world['name']} server in #{l} region and id #{world['id']} added to database"
      end
    end
  end

  desc 'Get all maps from gw2api'
  task :get_maps => :environment do
    maps = JSON.parse(open("https://api.guildwars2.com/v1/map_names.json").read)
    maps.each do |map|
      map_check = WorldMap.where(:id => map['id'])
      if map_check.present?
        puts "#{map['name']} exists in database"
      else
        WorldMap.create(:id => map['id'], :name => map['name'])
        puts "#{map['name']} map with id #{map['id']} added to database"
      end
    end
  end
  
  #przerobić to na https://api.guildwars2.com/v1/event_details.json
  desc 'Get all events from gw2api'
  task :get_events => :environment do
    events = JSON.parse(open("https://api.guildwars2.com/v1/event_names.json").read)
    events.each do |event|
      event_check = Event.where(:key => event['id'])
      if event_check.present?
        puts "#{event['name']} exists in database"
      else
        Event.create(:key => event['id'], :name => event['name'])
        puts "#{event['name']} event with id #{event['id']} added to database"
      end
    end
  end
  
end