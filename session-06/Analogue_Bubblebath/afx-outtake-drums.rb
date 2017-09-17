# Structuring Sonic Pi Code to create complete tunes
# filename: afx-outtake-drums.rb

use_bpm 128
set_sched_ahead_time! 1

###########################################################
# Helper Functions ########################################
###########################################################

# Return note duration based on the defined rythmic pattern
# Count number of elements in ptn, return single note value
define :get_dur do |ptn|
  if ptn.count == 1
    d = 4
  elsif ptn.count == 2
    d = 2
  elsif ptn.count == 4
    d = 1
  elsif ptn.count == 8
    d = 0.5
  elsif ptn.count == 16
    d = 0.25
  elsif ptn.count == 32
    d = 0.125
  else
    puts "NOTE: No idea what rythmic pattern you mean!"
  end
  return d
end

define :play_sample do |spec, ptn|
  # take orders, what and how to play
  d = get_dur ptn # get duration of sample call
  ptn.each do |i|
    if i != 0
      sample spec[0], amp: spec[1], rate: spec[2], pan: spec[3], start: spec[4], finish: spec[5]
    end
    sleep d
  end
end

# Pattern 1: Snare and Bass
define :get_bass_on_ptn_1 do
  bass_on_ptn_1    = [1,0,0,0,1,0,0,0,1,0,0,0,0,0,0,0]
end
define :get_bass_of_ptn_1 do
  bass_of_ptn_1    = [0,0,1,0,0,1,0,0,0,0,0,1,0,0,0,0]
end
define :get_snre_on_ptn_1 do
  snre_on_ptn_1    = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0]
end
define :get_snre_of_ptn_1 do
  snre_of_ptn_1    = [0,0,0,1,0,0,1,0,0,0,0,0,0,0,0,0]
end

define :mod_drums_1 do
  in_thread do
    4.times do
      play_sample [:drum_bass_hard, 1.0, 0.7, -0.2, 0, 1], get_bass_on_ptn_1
    end
  end
  in_thread do
    4.times do
      play_sample [:drum_bass_hard, 0.75, 0.7, -0.2, 0, 1], get_bass_of_ptn_1
    end
  end
  in_thread do
    4.times do
      play_sample [:drum_snare_hard, 0.75, 1.275, -0.1, 0, 1], get_snre_on_ptn_1
    end
  end
  in_thread do
    4.times do
      play_sample [:drum_snare_hard, 1, 1.3, -0.1, 0, 1], get_snre_of_ptn_1
    end
  end
end

# Pattern 2: Snare and Bass
define :get_bass_ptn_2a do
  bass_ptn_2a      = [1,0,1,0,1,0,0,0,0,0,1,0,0,0,0,0]
end
define :get_bass_ptn_2b do
  bass_ptn_2b      = [1,0,1,0,0,0,0,0,0,0,1,0,0,0,0,0]
end
define :get_snre_ptn_2 do
  snre_ptn_2       = [0,0,0,0,1,0,0,0,0,0,0,0,1,0,0,0]
end

define :mod_drums_2 do
  in_thread do
    play_sample [:drum_bass_hard, 1, 0.7, -0.2, 0, 1], get_bass_ptn_2a
    play_sample [:drum_bass_hard, 1, 0.7, -0.2, 0, 1], get_bass_ptn_2b
    play_sample [:drum_bass_hard, 1, 0.7, -0.2, 0, 1], get_bass_ptn_2a
    play_sample [:drum_bass_hard, 1, 0.7, -0.2, 0, 1], get_bass_ptn_2b
  end
  in_thread do
    play_sample [:drum_snare_hard, 0.75, 1.275, -0.1, 0, 1], get_snre_ptn_2
    play_sample [:drum_snare_hard, 0.75, 1.275, -0.1, 0, 1], get_snre_ptn_2
    play_sample [:drum_snare_hard, 0.75, 1.275, -0.1, 0, 1], get_snre_ptn_2
  end
end

# Hihat
define :get_hiht_on_ptn do
  hiht_on_ptn      = [1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0]
end
define :get_hiht_of_ptn do
  hiht_of_ptn      = [0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1]
end
define :get_hiht_lo_ptn do
  hiht_lo_ptn      = [0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0]
end
define :get_hiht_hi_ptn do
  hiht_hi_ptn      = [0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0]
end


define :mod_hiht do
  in_thread do
    4.times do
      play_sample [:drum_cymbal_closed, 0.75, 1, -0.5, 0, 0.4, 1], get_hiht_on_ptn
    end
  end
  in_thread do
    4.times do
      play_sample [:drum_cymbal_closed, 0.75, 1.3, -0.5, 0, 0.3], get_hiht_of_ptn
    end
  end
  in_thread do
    4.times do
      play_sample [:drum_cymbal_closed, 1, 1, -0.4, 0.0, 0.6], get_hiht_lo_ptn
    end
  end
  in_thread do
    4.times do
      play_sample [:drum_cymbal_closed, 1, 1, -0.4, 0.0, 0.6], get_hiht_hi_ptn
    end
  end
end

# Accentuating Tom combined with Drum Pattern 2
define :get_tom_ptn_a do
  # A One-Bar Pattern
  tom_ptn_a    = [0,0,0,0,0,1,0,0,0,0,0,0,0,0,1,0]
end
define :get_tom_ptn_b do
  tom_ptn_b    = [0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0]
end

define :mod_tom do
  in_thread do
    4.times do # 4 Bars
      play_sample [:elec_snare, 0.5, 0.5, -0.1, 0, 0.4], get_tom_ptn_a
    end
  end
  in_thread do
    4.times do # 4 Bars
      play_sample [:elec_snare, 0.5, 0.5, -0.1, 0, 0.4], get_tom_ptn_b
    end
  end
end

uncomment do
  puts "Play the Drums - Pattern 1 ---------------------"
  mod_drums_1
  mod_hiht
  sleep 16

  puts "Play the Drums - Pattern 2 ---------------------"
  mod_drums_2
  mod_hiht
  mod_tom
  sleep 16
end

comment do
  puts "Play only the Tom"
  mod_hiht
end
