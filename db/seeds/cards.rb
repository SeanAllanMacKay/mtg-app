module Seed_Cards
    puts "\n\n=========================================================="
    puts "Started seeding Cards"
    puts "=========================================================="

    url = 'https://archive.scryfall.com/json/scryfall-default-cards.json'
    uri = URI(url)
    response = Net::HTTP.get(uri)
    result = JSON.parse(response)

    result.each do |object|
        card = Card.where(name: object['name']).
            first_or_create(
                name: object.key?('name') ? object['name'] : nil,
                mana_cost: object.key?('mana_cost') ? object['mana_cost'] : nil,
                CMC: object.key?('cmc') ? object['cmc'] : nil,
                power: object.key?('power') ? object['power'] : nil,
                toughness: object.key?('toughness') ? object['toughness'] : nil,
                loyalty: object.key?('loyalty') ? object['loyalty'] : nil,
                image: object.key?('image_uris') ? object['image_uris']['normal'] : nil,
                multiverse_id: (object['multiverse_ids'] != []) ? object['multiverse_ids'][0] : nil,
                rulings: object.key?('rulings_uri') ? object['rulings_uri'] : nil,
            )

        if card.multiverse_id != (object['multiverse_ids'] != [] ? object['multiverse_ids'][0] : [])
            card.update(
                multiverse_id: (object['multiverse_ids'] != []) ? object['multiverse_ids'][0] : nil
            )
        end

        if card.rulings != (object.key?('rulings_uri') ? object['rulings_uri'] : nil)
            card.update(
                rulings: object['rulings_uri'],
            )
        end

        if card.text != (object.key?('oracle_text') ? object['oracle_text'] : nil)
            card.update(
                text: object['oracle_text'],
            )
        end

        result_colors = object.key?('colors') ? object['colors'] : []

        if card.colors != Color.where(initial: result_colors)
            card.colors = Color.where(initial: result_colors)
        end

        object['legalities'].each do |key, value|
            current_format = Format.find_by(name: key.capitalize)

            if current_format != nil
                if CardFormat.where(format: current_format, card: card).length == 0
                    legality = value == 'legal' ? true : false

                    thing = CardFormat.create(
                        card: card,
                        format: current_format,
                        legality: legality
                    )

                    puts thing.errors[:legality]
                end
            end
        end

        all_types = object['type_line'].split(' — ')
        types = all_types[0]
        sub_types = all_types[1].nil? ? "" : all_types[1]

        card_types = []

        types.split(' ').each do |string_type|
            if(Type.find_by(name: string_type) != nil)
                type = Type.find_by(name: string_type)
            end

            if(Type.find_by(name: string_type) == nil)
                type = Type.create(
                    name: string_type,
                    subtype: false
                )
            end

            card_types.push(string_type)
        end

        sub_types.split(' ').each do |string_type|
            if(Type.find_by(name: string_type) != nil)
                type = Type.find_by(name: string_type)
            end

            if(Type.find_by(name: string_type) == nil)
                type = Type.create(
                    name: string_type,
                    subtype: true
                )
            end

            card_types.push(string_type)
        end

        if card.types != Type.where(name: card_types)
            card.types = Type.where(name: card_types)
        end

        result_expansion = object.key?('set') ? object['set'] : nil

        set = Expansion.find_by(code: result_expansion)

        if (set != nil)
            if (card.expansion.exclude?(set))
                card.expansion << set
            end
        end
    end

    puts "=========================================================="
    puts "Finished seeding Cards"
    puts "==========================================================\n\n"
end