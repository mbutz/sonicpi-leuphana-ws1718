# coding: utf-8
# Froh zu sein, bedarf es wenig ...
# filename: froh-zu-sein.rb

use_bpm 180
set_sched_ahead_time! 0

uncomment do

  # Example 1
  # Use 'play_pattern_times' within a function
  # Store durations and notes in variables

  king_durations = (ring 1.5, 0.5, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1)
  king_notes = (ring :g, :f, :e, :c, :b3, :d, :c, :e, :d, :f, :e, :g, :g3, :b3, :c, :c)

  define :king1 do
    in_thread do
      play_pattern_timed king_notes, king_durations
    end
  end

  # king1
  # sleep 16
  # king1

  # king1
  # sleep 4
  # king1
  # sleep 4
  # king1

end

comment do

  # Example 1
  # Use custom function to play the tune (loop that counts durations)
  # and takes a synth as option (parameter)
  # Store durations, notes and volumes in variables

  king_durations = (ring 1.5, 0.5, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1) # = 16 beats
  king_notes = (ring :g, :f, :e, :c, :b3, :d, :c, :e, :d, :f, :e, :g, :g3, :b3, :c, :c)
  king_volumes = (ring 1.25, 0.5, 1.25, 0.5, 1.25, 0.5, 1.25, 0.5, 1.25, 0.5, 1.25, 0.5, 1.25, 0.5, 1.75, 1.25)

  define :king2 do | synth=:beep |
    use_synth synth
    in_thread do
      king_durations.count.times do | i |
        puts king_durations[i]
        play king_notes[i], amp: king_volumes[i]
        sleep king_durations[i]
      end
    end
  end

  king2
  sleep 4
  king2 :tri
  sleep 4
  king2 :saw

end

