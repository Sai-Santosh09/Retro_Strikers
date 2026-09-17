# Retro Strikers

Retro Strikers is a simple retro-style football game made in the Godot. It focuses on fast arcade gameplay(2min each game), local multiplayer support(12 input keys so 2 players can play), power moves, and a global event system to manage the game state.

## Core Logic

- **Global Event Bus (`game_events.gd`)**: Uses signals to handle communication between different game parts, like score updates, timers, and scene loading, without mixing up the code.
- **Data & Flag Logic (`data_loader.gd`, `flag_helper.gd`)**: Handles asset loading and keeps track of game flags so the game state stays saved when switching scenes.
- **Time & Score Helpers (`score_helper.gd`, `time_helper.gd`)**: Dedicated scripts that manage the match timer and calculate player scores smoothly.
- **Power Moves Logic**: Shot actions change automatically based on your movement and direction when the ball is in the air:
  - **Volley Kick**: Stand still, face the goal, and press the shot key.
  - **Bicycle Kick**: Stand still with your back to the goal, and press the shot key.
  - **Header**: Move towards the ball and press the shot key.

## Controls

**Player 1**
- Pass / Switch / Unselect: `` ` ``
- Shoot / Tackle / Power Move / Interaction / Select: `1`

**Player 2**
- Pass / Switch / Unselect: `[`
- Shoot / Tackle / Power Move / Interaction / Select: `]`
