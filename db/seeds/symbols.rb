module Seed_Symbols
    puts "\n\n=========================================================="
    puts "Started seeding Symbols"
    puts "=========================================================="

    symbology_url = 'https://api.scryfall.com/symbology'
    symbology_uri = URI(symbology_url)
    symbology_response = Net::HTTP.get(symbology_uri)
    symbology_result = JSON.parse(symbology_response)

    symbology_result['data'].each do |object|
        icon = Icon.where(symbol: object['symbol']).
            first_or_create(
                symbol: object['symbol'],
                icon_image: object['svg_uri']
            )
    end

    puts "=========================================================="
    puts "Finished seeding Symbols"
    puts "==========================================================\n\n"
end