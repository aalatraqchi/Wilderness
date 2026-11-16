# Architecture

Wilderness is a single LÖVE project. Each gameplay system lives in its own Lua module, and `main.lua` wires them into LÖVE's callbacks.

## Code Layout

| File | Responsibility |
| --- | --- |
| `conf.lua` | Window title and size (1280x720) |
| `main.lua` | LÖVE callbacks (`load`, `update`, `draw`, `keypressed`) and the physics contact callbacks |
| `player.lua` | Player state, input, movement, jumping, crouching, attacking, guarding, and animation |
| `skeleton.lua`, `goblin.lua`, `centurion.lua` | One module per enemy type: spawning, AI, combat timing, damage, and death |
| `map.lua` | Loads Tiled maps, builds collision, spawns enemies, and advances stages |
| `camera.lua` | Follows the player horizontally and clamps to the map edges |
| `gui.lua` | Health display, objective text, kill counter, and victory message |
| `sounds.lua` | Loads music and sound effects |
| `map/` | Stage files exported from Tiled (`1.lua` to `4.lua`) and their `.tmx` sources |
| `assets/` | Sprite sheets, tileset, backgrounds, and audio |
| `sti/`, `libraries/` | Third-party libraries (STI, anim8, cron.lua) |
| `tests/smoke.lua` | Headless smoke test that plays through every stage |

## Game Loop

Each frame, `love.update` advances the Box2D world, then the player, every enemy type, the camera, and the GUI. `love.draw` renders the background and the current stage, applies the camera transform to draw the player and enemies, and then draws the GUI in screen space.

`Map:update` runs after drawing and checks whether the player has reached the right edge of the stage. If every enemy on the stage is defeated, the next stage loads. Otherwise, the GUI shows how many enemies remain. After the last stage, a victory message is shown.

## Physics and Collisions

The world is created in `Map:load` with no global gravity. The player applies its own gravity while airborne, which keeps jump height and fall speed easy to tune. Each character has a dynamic body with fixed rotation and a rectangular fixture.

Box2D contact callbacks are routed through `BeginContact` and `EndContact` in `main.lua` to every module:

- **Player:** uses the collision normal to detect landing on the ground (which resets the double jump) and hitting a ceiling.
- **Enemies:** a contact with the player starts an attack exchange, and ending the contact stops it.

## Maps

Stages are built in [Tiled](https://www.mapeditor.org/) and exported to Lua. STI renders the tile layers and its Box2D plugin turns the `collidable` layer into static collision shapes. An `enemies` object layer marks spawn points, and each object's class (`skeleton`, `goblin`, or `centurion`) decides which enemy is created there.

Stages are loaded by number (`map/<n>.lua`), so adding a level means exporting a new map and raising `Map.maxStages`.

## Enemies and Combat

All three enemy modules share the same structure, using a metatable for instances and a module-level list of active enemies:

- **Spawning:** `new(x, y)` creates an instance with its own physics body and animations. `clearAll()` destroys every body when a stage changes.
- **AI:** an enemy moves toward the player when the player is on roughly the same level and inside the enemy's range, and stops within attack range.
- **Attack windows:** while in contact with the player, an enemy alternates between attacking and pausing on a timer, giving the player openings to strike.
- **Damage over time:** `cron.every` timers apply damage at fixed intervals while both sides are attacking, so damage is tied to time instead of frame rate. Guarding prevents the player from taking damage.

The enemy types differ only in their tuning:

| Enemy | Health | Damage | Speed | Hits player every |
| --- | --- | --- | --- | --- |
| Skeleton | 50 | 5 | 40 | 0.9 s |
| Goblin | 50 | 10 | 30 | 0.5 s |
| Centurion | 250 | 20 | 60 | 1.25 s |

## Testing

`tests/smoke.lua` is loaded only when the game starts with `love . --smoke`. It runs the game at a fixed time step, lets each stage simulate for a short time, then marks the stage as cleared and moves the player to the exit. The test passes when the victory state is reached and fails with a non-zero exit code on any runtime error, an unexpected stage order, or a timeout. GitHub Actions runs it under a virtual display on every push and pull request.
