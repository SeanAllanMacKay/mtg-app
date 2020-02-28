module Seed_Colors
    puts "\n\n=========================================================="
    puts "Started seeding Colors"
    puts "=========================================================="

    Color.where(color_name: 'White').first_or_create(color_name: 'White', initial: 'W')
    Color.where(color_name: 'Blue').first_or_create(color_name: 'Blue', initial: 'U')
    Color.where(color_name: 'Black').first_or_create(color_name: 'Black', initial: 'B')
    Color.where(color_name: 'Red').first_or_create(color_name: 'Red', initial: 'R')
    Color.where(color_name: 'Green').first_or_create(color_name: 'Green', initial: 'G')
    Color.where(color_name: 'Colorless').first_or_create(color_name: 'Colorless', initial: 'C')

    puts "=========================================================="
    puts "Finished seeding Colors"
    puts "==========================================================\n\n"
end