module Seed_Rarity
    puts "\n\n=========================================================="
    puts "Started seeding Rarities"
    puts "=========================================================="

    Rarity.where(rarity_name: 'common').first_or_create(rarity_name: 'common')
    Rarity.where(rarity_name: 'uncommon').first_or_create(rarity_name: 'uncommon')
    Rarity.where(rarity_name: 'rare').first_or_create(rarity_name: 'rare')
    Rarity.where(rarity_name: 'mythic').first_or_create(rarity_name: 'mythic')

    puts "=========================================================="
    puts "Finished seeding Rarities"
    puts "==========================================================\n\n"
end