require 'net/http'
require 'json'
require 'pp'

if (ENV['load'] == 'all')
    things_to_load = ENV['load']
else
    things_to_load = ENV['load'].split(',')
end

Dir[File.join(Rails.root, 'db', 'seeds', '*.rb')].sort.each do |seed|
    path = seed.split('/')
    file = path[path.length - 1][0...-3]

    if((things_to_load == 'all') || (things_to_load.include?(file)))
        load seed
    end
end