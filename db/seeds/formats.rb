module Seed_Formats
    puts "\n\n=========================================================="
    puts "Started seeding Formats"
    puts "=========================================================="

    Format.where(format_name: 'Standard').first_or_create(format_name: 'Standard')
    Format.where(format_name: 'Modern').first_or_create(format_name: 'Modern')
    Format.where(format_name: 'Pioneer').first_or_create(format_name: 'Pioneer')
    Format.where(format_name: 'Vintage').first_or_create(format_name: 'Vintage')
    Format.where(format_name: 'Legacy').first_or_create(format_name: 'Legacy')
    Format.where(format_name: 'Historic').first_or_create(format_name: 'Historic')
    Format.where(format_name: 'Pauper').first_or_create(format_name: 'Pauper')
    Format.where(format_name: 'Brawl').first_or_create(format_name: 'Brawl')
    Format.where(format_name: 'Commander').first_or_create(format_name: 'Commander')

    puts "=========================================================="
    puts "Finished seeding Formats"
    puts "==========================================================\n\n"
end