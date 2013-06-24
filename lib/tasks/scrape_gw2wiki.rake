namespace :gw2wiki do
  desc 'Get all dungeons from gw2wiki'
  task :dungeons => :environment do
    agent = Mechanize.new
    page = agent.get('http://wiki.guildwars2.com/wiki/Dungeon')
    table = page.search('table')
    table = table[2].search('tr a').map{|txt| txt.text}.each_slice(3).to_a
  end
end