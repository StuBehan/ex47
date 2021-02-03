require "./lib/ex47.rb"
require "test/unit"
require "ex47/game.rb"

class TestGame < Test::Unit::TestCase

    def test_room()
        gold = Room.new("GoldRoom", """This Room has gold in it you can grab. there's a door to the North.""")
        assert_equal("GoldRoom", gold.name)
        assert_equal({}, gold.paths)
    end
    
    def test_room_paths()
        center = Room.new("Center", "Test room in the centre.")
        north = Room.new("North", "Test room in the north.")
        south = Room.new("South", "Test room in the south.")

        center.add_paths({'North'=> north, 'South'=> south})
        assert_equal(north, center.go('North'))
        assert_equal(south, center.go('South'))
    end

    def test_map()
        start = Room.new("Start", "You can go west and down a hole")
        west = Room.new("Trees", "There are trees here, you can go east")
        down = Room.new("Dungeon", "It's dark down here, you can go up")

        start.add_paths({"West"=> west, "Down"=> down})
        west.add_paths({"East"=> start})
        down.add_paths({"Up"=> start})

        assert_equal(west, start.go('West'))
        assert_equal(start, start.go('West').go('East'))
        assert_equal(start, start.go('Down').go("Up"))
    end
end