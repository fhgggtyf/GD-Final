// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function calc_add(base, modifier_value) {
    return base + modifier_value;
}

// Multiplicative calculation
function calc_multiply(base, modifier_value) {
    return base * modifier_value;
}

function calc_change(base, modifier_value) {
    return modifier_value;
}

function create_modifier(attribute, value, calculation, duration, icon, prev = -1) {
    return {
        attribute: attribute,  // Attribute to modify (e.g., "attack")
        value: value,          // Modification value (can be positive or negative)
        calculation: calculation, // The calculation method
        duration: duration,    // Duration in steps
        icon: icon,            // Optional: Modifier icon
        prev: prev             // Optional: Previous value for calc_change
    };
}

function apply_modifier(player, modifier) {
    // Apply the calculation method to the player's attribute
    var current_value = player[modifier.attribute];
    player[modifier.attribute] = modifier.calculation(current_value, modifier.value);

    // Add the modifier to the player's modifiers list
    if (!is_array(player.modifiers)) {
        player.modifiers = []; // Initialize if not already an array
    }
    array_push(player.modifiers, modifier);
}

function update_player_modifiers(player) {
    // Iterate through the modifiers array in reverse
    for (var i = array_length(player.modifiers) - 1; i >= 0; i--) {
        var _mod = player.modifiers[i];

        // Decrease duration
        _mod.duration--;

        // If expired, reverse the effect and remove the modifier
        if (_mod.duration <= 0) {
            var current_value = player[_mod.attribute];

            // Reverse the effect based on the calculation type
            var reversed_value;
            if (_mod.calculation == calc_add) {
                // Reverse addition
                reversed_value = current_value - _mod.value;
            } else if (_mod.calculation == calc_multiply) {
                // Reverse multiplication
                reversed_value = current_value / _mod.value;
            } else if (_mod.calculation == calc_change) {
                reversed_value = _mod.prev;
            } else {
                // Default: No change
                reversed_value = current_value;
            }

            player[_mod.attribute] = reversed_value;

            // Remove the modifier
            array_delete(player.modifiers, i, 1);
        }
    }
}