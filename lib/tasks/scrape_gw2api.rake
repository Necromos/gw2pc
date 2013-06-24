namespace :gw2api do
  desc 'Get all worlds from gw2api'
  task :worlds => :environment do
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
  task :maps => :environment do
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
  
  desc 'Get all events from gw2api'
  task :events => :environment do
    events = JSON.parse(open("https://api.guildwars2.com/v1/event_details.json").read)
    events = events['events']
    events.each do |event|
      event_check = Event.where(:key => event[0])
      if event_check.present?
        puts "#{event[1]['name']} exists in database"
      else
        group = !event[1]['flags'][0].nil? ? true : false
        mapwide = !event[1]['flags'][1].nil? ? true : false
        Event.create(:key => event[0], :name => event[1]['name'], :level => event[1]['level'], :world_map_id => event[1]['map_id'], :group => group, :mapwide => mapwide)
        puts "#{event[1]['name']} event with id #{event[0]} added to database"
      end
    end
  end
  
  desc 'Get all items from gw2api'
  task :items => :environment do
    items_ids = JSON.parse(open("https://api.guildwars2.com/v1/items.json").read)
    items_ids = items_ids['items']
    items_ids.each do |item_id|
      item_check = Item.where(:id => item_id)
      if item_check.present?
        puts "Item with id #{item_id} exits in database"
      else
        item = JSON.parse(open("https://api.guildwars2.com/v1/item_details.json?item_id=" + item_id.to_s).read)
        rarity = Rarity.where(:name => item['rarity']).first_or_create!
        type = Type.where(:name => item['type']).first_or_create!
        Item.create(:id => item_id, :name => item['name'], :rarity_id => rarity.id, :level => item['level'], :type_id => type.id)
        puts "#{item['rarity']} #{item['name']} with id #{item_id} added to database"
      end
    end
  end
  
  desc 'Do all!'
  task :all => [:worlds, :maps, :events, :items] do
    puts 'Done, hf :)'
  end
  
end