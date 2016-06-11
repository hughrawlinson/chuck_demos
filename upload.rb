require('soundcloud')

client = Soundcloud.new(:client_id => ENV['SOUNDCLOUD_CLIENT_ID'],
                        :client_secret => ENV['SOUNDCLOUD_CLIENT_SECRET'],
                        :username => ENV['SOUNDCLOUD_USERNAME'],
                        :password => ENV['SOUNDCLOUD_PASSWORD'])
if client.get('/me/tracks').map{ |x| x.title }.include? ARGV[0]
  puts "Track is already on this SoundCloud profile"
else
  puts "Message recieved, attempting upload"
  # upload an audio file
  track = client.post('/tracks', :track => {
                        :title => ARGV[0],
                        :asset_data => File.new("data/#{ARGV[0]}", 'rb')
                      })

  # print track link
  puts track.permalink_url
end

