sounds = {"a", "b", "c", "d", "e", "f", "g"}

minetest.register_node("music_block:music_block", {
    description = "A note from the past",
    tiles = {"note.png"},
    groups = {oddly_breakable_by_hand = 2},
    current_sound = 1,
    on_punch = function(pos, node, puncher)
        local meta = minetest.get_meta(pos)
        local value = meta:get_int("current_sound")
		minetest.sound_play(sounds[value], {
            pos = puncher:get_pos(),
            max_hear_distance = 10000,
            gain = 5.0
        })
        value = value + 1
        if value > 7 then
            value = 1
        end
        meta:set_int("current_sound", value)
    end,
    on_rightclick = function(pos, node, clicker)
        local meta = minetest.get_meta(pos)
        local value = meta:get_int("current_sound")
        minetest.sound_play(sounds[value], {
            pos = clicker:get_pos(),
            max_hear_distance = 10000,
            gain = 5.0
        })
    end
})

minetest.register_craft({
    output = "music_block:music_block",
    recipe = {
        {"fake_diamonds:fake_diamond", "fake_diamonds:fake_diamond"}
    }
})

minetest.register_alias("music", "music_block:music_block")