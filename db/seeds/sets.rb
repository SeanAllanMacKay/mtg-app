module Seed_Sets
    puts "\n\n=========================================================="
    puts "Started seeding Sets"
    puts "=========================================================="

    sets_url = 'https://api.scryfall.com/sets'
    sets_url = URI(sets_url)
    sets_response = Net::HTTP.get(sets_url)
    sets_result = JSON.parse(sets_response)

    sets_result['data'].each do |object, index|
        expansion = Expansion.where(code: object['code']).
            first_or_create(
                code: object['code'],
                set_name: object['name'],
                released_at: object['released_at'],
                expansion_type: object['set_type'],
                card_count: object['card_count'],
                icon: object['icon_svg_uri'],
                parent_expansion: object['parent_set_code']
            )
    end

    puts "=========================================================="
    puts "Finished seeding Sets"
    puts "==========================================================\n\n"
end