# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'net/http'
require 'json'
require 'pp'

url = 'https://archive.scryfall.com/json/scryfall-default-cards.json'
uri = URI(url)
response = Net::HTTP.get(uri)

result = JSON.parse(response)

Format.create(name: 'Standard')
Format.create(name: 'Modern')
Format.create(name: 'Pioneer')
Format.create(name: 'Vintage')
Format.create(name: 'Legacy')
Format.create(name: 'Historic')
Format.create(name: 'Pauper')
Format.create(name: 'Brawl')
Format.create(name: 'Commander')

Color.where(name: 'White').first_or_create(name: 'White', initial: 'W')
Color.where(name: 'Blue').first_or_create(name: 'Blue', initial: 'U')
Color.where(name: 'Black').first_or_create(name: 'Black', initial: 'B')
Color.where(name: 'Red').first_or_create(name: 'Red', initial: 'R')
Color.where(name: 'Green').first_or_create(name: 'Green', initial: 'G')
Color.where(name: 'Colorless').first_or_create(name: 'Colorless', initial: 'C')

result.each do |object|
    card = Card.where(name: object['name']).
        first_or_create(
            name: object.key?('name') ? object['name'] : nil,
            mana_cost: object.key?('mana_cost') ? object['mana_cost'] : nil,
            CMC: object.key?('cmc') ? object['cmc'] : nil,
            power: object.key?('power') ? object['power'] : nil,
            toughness: object.key?('toughness') ? object['toughness'] : nil,
            loyalty: object.key?('loyalty') ? object['loyalty'] : nil,
            image: object.key?('image_uris') ? object['image_uris']['normal'] : nil
        )

    if card.text != (object.key?('oracle_text') ? object['oracle_text'] : nil)
        card.update(
            text: object.key?('oracle_text') ? object['oracle_text'] : nil,
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
end
