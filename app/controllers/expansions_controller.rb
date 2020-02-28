class ExpansionsController < ApplicationController
    def index
        core_sets = Expansion.where(expansion_type: 'core')
        expansions = Expansion.where(expansion_type: 'expansion')
        promos = Expansion.where(expansion_type: 'promo')
        tokens = Expansion.where(expansion_type: 'token')
        masters = Expansion.where(expansion_type: 'masters')
        commanders = Expansion.where(expansion_type: 'commander')
        duel_decks = Expansion.where(expansion_type: 'duel_deck')
        memorabilia = Expansion.where(expansion_type: 'memorabilia')
        funny = Expansion.where(expansion_type: 'funny')
        boxes = Expansion.where(expansion_type: 'box')
        spellbooks = Expansion.where(expansion_type: 'spellbook')
        draft_innovations = Expansion.where(expansion_type: 'draft_innovation')
        planechases = Expansion.where(expansion_type: 'planechase')
        masterpieces = Expansion.where(expansion_type: 'masterpiece')
        starters = Expansion.where(expansion_type: 'starter')
        from_the_vaults = Expansion.where(expansion_type: 'from_the_vault')
        archenemies = Expansion.where(expansion_type: 'archenemy')
        treasure_chests = Expansion.where(expansion_type: 'treasure_chest')
        premium_decks = Expansion.where(expansion_type: 'premium_deck')
        vanguards = Expansion.where(expansion_type: 'vanguard')

        @collections = [
            { name: 'Expansion Sets', values: expansions },
            { name: 'Core Sets', values: core_sets },
            { name: 'Masters Sets', values: masters },
            { name: 'Joke Sets', values: funny },
            { name: 'Archenemy Sets', values: archenemies },
            { name: 'Planechase Sets', values: planechases },
            { name: 'Draft Innovation Sets', values: draft_innovations },
            { name: 'Commander Products', values: commanders },
            { name: 'Duel Decks', values: duel_decks },
            { name: 'Spellbooks', values: spellbooks },
            { name: 'Starter Decks', values: starters },
            { name: 'Premium Decks', values: premium_decks },
            { name: 'Promo Sets', values: promos },
            { name: 'Token Sets', values: tokens },
            { name: 'Masterpieces', values: masterpieces },
            { name: 'From the Vault Products', values: from_the_vaults },
            { name: 'Vanguards', values: vanguards },
            { name: 'Boxes', values: boxes },
            { name: 'Treasure Chests', values: treasure_chests },
            { name: 'Memorabilia', values: memorabilia },
        ]
    end

    def show
        @expansion = Expansion.find_by(expansion_name: params[:expansion_name])
    end
end
