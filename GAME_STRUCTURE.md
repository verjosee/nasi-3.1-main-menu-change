### SISTEM UTAMA GAME - NASI 3.1

#### 1. INITIALIZATION & CORE SYSTEMS

**scr_game_init.gml**
- `init_game_settings()` - Enable fullscreen, set window title
- `init_global_variables()` - Initialize all global variables (score, lives, level, waves, etc)

**scr_highscore.gml**
- `save_highscore()` / `load_highscore()` - Persist high score to JSON file
- `save_level_progress()` / `load_level_progress()` - Persist level unlock status to JSON

---

#### 2. LEVEL DIFFICULTY SYSTEM

**scr_apply_level_difficulty.gml**
Applies per-level difficulty multiplier (levels 1-10):
- Level 1-2: spawn_rate_multiplier = 1.0-0.95 (normal/slightly fast)
- Level 3-5: spawn_rate_multiplier = 0.9-0.8 (faster)
- Level 6-8: spawn_rate_multiplier = 0.75-0.65 (very fast)
- Level 9-10: spawn_rate_multiplier = 0.6-0.55 (extremely fast)

Sets `global.spawn_rate_base` which controls meteor/enemy spawn rate

---

#### 3. MENU & UI LAYER STRUCTURE

**obj_main_menu (room_menu only)**
- Create: Initialize game, load progress, create star background, create Play/Settings/Quit buttons
- Step: Update cursor, handle button interactions
- Draw: Render stars and menu UI

**obj_level_select (room_level_select only)**
- Create: Load level progress, initialize level grid display
- Step: Handle mouse input for level selection
- Draw: Render level buttons with locked/unlocked status

**obj_ui_controller** (REVIEW NEEDED)
- Used to control UI across rooms

---

#### 4. GAMEPLAY SYSTEMS

**obj_level_timer (active in all level rooms: room_level1-10)**
- Create: Initialize 90-second timer, 3 waves (30 sec each), spawn rate
- Step: Count down timer, check WIN condition (survived 90s), check LOSE condition (lives depleted)
- WIN: global.level_time_left set to 1, next level unlocked, save progress
- LOSE: global.level_time_left set to -1, no unlock

**obj_level_manager** - Tracks spawned enemies, wave count

**obj_spawner (active in all level rooms)**
- Create: Initialize spawn timer based on current difficulty
- Step: Spawn meteors at rate determined by level and wave

**obj_player_rocket (active in all level rooms)**
- Collision: Detect enemy hits, decrease lives
- Movement: Handle arrow key input
- Create Lives ≤ 0: Set global.level_time_left = -1 (trigger LOSE)

---

#### 5. GAME OVER & PROGRESSION

**obj_gameover (room_gameover)**
- Create: Determine WIN/LOSE status, save high score and level progress
- Step: Wait for ENTER, save all data, then:
  - WIN: Go to room_level_select
  - LOSE: Go to room_level_select
- Draw: Display "YOU WIN!" (green) or "GAME OVER" (red) with score and level info

---

#### 6. UI ELEMENTS (MENU-ONLY)

**obj_btn_play** - Only created in obj_main_menu, goes to room_level_select
**obj_btn_setting** - Only created in obj_main_menu
**obj_btn_quit** - Only created in obj_main_menu, calls game_end()

**NOTE**: These buttons should ONLY exist in room_menu (created by obj_main_menu).
If they appear in level rooms, check that they are NOT placed on room layers.

---

#### 7. HUD & DISPLAY

**obj_score** - Displays global.score during gameplay
**obj_lives** - Displays remaining lives (global.lives)
**obj_level** - Displays current level number
**obj_levelup_text** - Shows "LEVEL UP!" message between waves

---

#### 8. GAME FLOW

```
room_menu (obj_main_menu)
  ↓ [Play button]
room_level_select (obj_level_select)
  ↓ [Select Level 1-10]
room_level1-10 (obj_player_rocket + obj_spawner + obj_level_timer + HUD)
  ├─ WIN (survived 90s) → room_gameover → room_level_select (next level unlocked)
  └─ LOSE (lives=0) → room_gameover → room_level_select (retry)
```

---

#### 9. GLOBAL VARIABLES

**Game State**
- `global.current_level` (1-10)
- `global.level_unlocked[]` array (10 items)
- `global.level_completed[]` array (10 items)

**Gameplay**
- `global.score, global.highscore`
- `global.lives`
- `global.level_time_left` (frames remaining)
- `global.current_wave` (1-3)

**Difficulty**
- `global.level_difficulty` (multiplier)
- `global.spawn_rate_base` (frames between spawns)

---

#### 10. PERSISTENCE

Saved to JSON files in game folder:
- `highscore.json` - Current high score
- `level_progress.json` - Which levels are unlocked (array of 10 bools)

Loaded automatically on:
- obj_main_menu Create
- obj_level_select Create

---

#### FIXES APPLIED:
1. ✅ Fullscreen enabled via `init_game_settings()`
2. ✅ Difficulty scaling: 10% reduction per level (1.0 → 0.55)
3. ✅ Menu buttons only in room_menu (created by obj_main_menu, not layer instances)
4. ✅ Code organized with comment sections
5. ✅ Level progress persists to JSON
6. ✅ WIN shows "YOU WIN!", LOSE shows "GAME OVER"
