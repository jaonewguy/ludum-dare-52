extends Node

const CONVEYOR_SPEEDUP_FACTOR = 1.75
const DIFFICULTY_THRESHOLD_MUSIC_SPEEDUP = 3
const DIFFICULTY_THRESHOLD_MIN_TIME = 5.0
const UPDATE_DIFFICULTY_MODULO = 10
const UPDATE_DIFFICULTY_START_NUM = 5
const LOSE_BY_INC = 99
const PITCH_FACTOR = 1.025
const TIMER_BEFORE_RELOAD_GAME = 4

var difficulty_increments = 0
var enable_game_over = false
var score = 0
var mob_count = 0
var time_elapsed: = 0.0
var prev_time_update_difficulty: = 0.0

func game_over():
    $Level.queue_free()
    $HUD.show_game_over()
    $BGM.stop()
    $DeathSound.play()
    yield(get_tree().create_timer(TIMER_BEFORE_RELOAD_GAME), 'timeout')
    get_tree().reload_current_scene()
    
func _process(delta: float) -> void:
    time_elapsed += delta

func _ready():
    get_tree().paused = true
    SignalBus.connect("mob_spawned", self, "_on_mob_spawned")
    SignalBus.connect("mob_freed", self, "_on_mob_freed")

func new_game():
    get_tree().paused = false
    $HUD.show_message("Get Ready")
#    $BGM.play()

func is_game_over():
    return mob_count > score + LOSE_BY_INC

func _on_mob_freed():
    # TODO: hacky state var for now
    if enable_game_over:
        return
    score += 1
    $HUD.update_score(score)
    
func _update_difficulty():
    # Min threshold time for less bullshit
#    print("difficulty increased")
    $HUD.show_message("We goin' faster...")
    difficulty_increments += 1
    if (difficulty_increments > DIFFICULTY_THRESHOLD_MUSIC_SPEEDUP):
        $HUD.show_message("FASTAH")
        $BGM.pitch_scale *= PITCH_FACTOR
        $Level.conveyor.speed *= CONVEYOR_SPEEDUP_FACTOR
    $Level.increase_difficulty()

func _on_mob_spawned():
    mob_count += 1
    $HUD.update_mob_count(mob_count)
    
    # Try old habits in if check
#    print(mob_count % UPDATE_DIFFICULTY_MODULO)
    if (UPDATE_DIFFICULTY_START_NUM == mob_count % UPDATE_DIFFICULTY_MODULO) and (time_elapsed - prev_time_update_difficulty > DIFFICULTY_THRESHOLD_MIN_TIME):
        print("Previous update time: ", prev_time_update_difficulty)
        prev_time_update_difficulty = time_elapsed
        _update_difficulty()
    if is_game_over():
        enable_game_over = true
        game_over()
