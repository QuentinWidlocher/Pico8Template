-- Update Game

function _update()
    update_camera()
    foreach(GameObject.pool, function (o) o:update() end)
end