-- State Machine

game_states = {
    default = 0,
}

state = game_states.default

function change_state(new_state)
    state = new_state
end