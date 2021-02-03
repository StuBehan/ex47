require "./lib/NAME.rb"
require "test/unit"

class TestNAME < Test::Unit::TestCase

    def test_room()
        gold = Room.new("GoldRoom", """This Room has gold in it you can grab. there's a door to the North.""")
        assert_equals("GoldRoom", gold.name)
        assert_equals({}, gold.paths)
    end
    
    def test_room_paths()
        center = Room.new("Center", "Test room in the centre.")
        north = Room.new("North", "Test room in the north.")
        sound = Room.new("South", "Test room in the south.")

        centre.add_paths({'North'=> north, 'south'=> south})
        assert_equals(north, center.go('north'))
        assert_equals(south, center.go('south'))
    end

    def test_map()
        start = Room.new("Start", "You can go west and down a hole")
        west = Room.new("Trees", "There are trees here, you can go east")
        down = Room.new("Dungeon", "It's dark down here, you can go up")

        start.add_paths({"West"=> west, "Down"=> down})
        west.add_paths({"East"=> start})
        down.add_paths({"Up"=> start})

        assert_equals(west, start.go('West'))
        assert_equals(start, start.go('West').go('East'))
        assert_equals(start, start.go('Down').go("Up"))
    end
end