-- Draw Game

function _draw()
    cls(0)
    draw_game()
end

function draw_game()
    draw_debug(true)

    foreach(GameObject.pool, function (o) o:draw() end)
end