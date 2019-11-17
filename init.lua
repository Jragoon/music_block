sounds = {"a", "b", "c", "d", "e", "f", "g"}
current_sound = 1

minetest.register_node("music_block:music_block", {
    description = "A note from the past",
    tiles = {"note.png"},
    groups = {oddly_breakable_by_hand = 2},
    on_punch = function(pos, node, puncher)
		minetest.sound_play(sounds[current_sound], {
            pos = puncher:get_pos(),
            max_hear_distance = 10000,
            gain = 5.0
        })
        current_sound = current_sound + 1
        if current_sound > 7 then
            current_sound = 1
        end
    end,
    on_rightclick = function(pos, node, clicker)
        minetest.sound_play(sounds[current_sound], {
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