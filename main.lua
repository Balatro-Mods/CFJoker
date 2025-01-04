--[[
    Creates a new texture atlas with card sized sprites. This resource will be
    loaded from the assets/1x and assets/2x folder.
--]]
SMODS.Atlas({ key = 'card_sprites', path = 'card_sprites.png', px = 71, py = 95 })

--- Calculates the number of mods currently in the mod list.
--- @return integer # The number of mods available in the mod list.
local function mod_count()
    -- TODO Should we filter out loaded mods?
    return #SMODS.mod_list
end

-- Creates and registers a new Joker card.
SMODS.Joker {
    key = 'cf_joker',
    discovered = true,
    loc_txt = {
        name = 'CurseForge',
        text = {
            '{C:chips}+#1#{} Chips for each mod',
            '{C:inactive}(Currently {C:chips}#2#{C:inactive})'
        }
    },
    config = {
        extra = {
            chips_per_mod = 10
        }
    },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.chips_per_mod, card.ability.extra.chips_per_mod * mod_count() } }
    end,
    rarity = 2,
    atlas = 'card_sprites',
    pos = { x = 0, y = 0 },
    cost = 6,
    blueprint_compat = true,
    calculate = function(self, card, context)
        if context.joker_main then
            return {
                chip_mod = card.ability.extra.chips_per_mod * mod_count(),
                message = localize { type = 'variable', key = 'a_chips', vars = { card.ability.extra.chips_per_mod * mod_count() } }
            }
        end
    end
}

--[[
    When debug mode is enabled a new deck is added that helps test the mod out.
    This deck starts with a all of the relevant jokers for testing.
--]]
local debug_mode = false

if debug_mode then
    SMODS.Back {
        name = 'Debug Deck',
        key = 'debug',
        pos = { x = 0, y = 0 },
        config = {},
        loc_txt = {
            name = 'Debug Deck',
            text = {
                'Debug your cards.'
            }
        },
        apply = function()
            G.E_MANAGER:add_event(Event({
                func = function()
                    add_joker('j_cfjoker_cf_joker', nil, true, false)
                    add_joker('j_cfjoker_cf_joker', 'foil', true, false)
                    add_joker('j_cfjoker_cf_joker', 'polychrome', true, false)
                    add_joker('j_cfjoker_cf_joker', 'holo', true, false)
                    add_joker('j_cfjoker_cf_joker', 'negative', true, false)
                    add_joker('j_blueprint', 'negative', true, false)
                    return true
                end
            }))
        end
    }
end
