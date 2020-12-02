-- State Machine

GAME_STATES = {
    default = 0,
}

STATE = GAME_STATES.default

function change_state(new_state)
    STATE = new_state
end