# Session 3, 14/11/2017
# Slicing a Breakbeat Sample

use_bpm 120

# 4 bars = 16 beats
# Original speed is 120 bpm

s = orig_breakbeats, "dusk"

live_loop :orig do
  stop
  sample s, beat_stretch: 16
  sleep 16
end

#################################################
# Slice into bars and loop this bar
# use 'start' and 'finish' to play only portions
#################################################

# bar 1
live_loop :bar1 do
  stop
  sample s, beat_stretch: 16, start: 0, finish: 0.25
  sleep 4
end

# bar 2
live_loop :bar2 do
  stop
  sample s, beat_stretch: 16, start: 0.25, finish: 0.5
  sleep 4
end

# bar 3
live_loop :bar3 do
  stop
  sample s, beat_stretch: 16, start: 0.5, finish: 0.75
  sleep 4
end

# bar 4
live_loop :bar4 do
  stop
  sample s, beat_stretch: 16, start: 0.75, finish: 1.0
  sleep 4
end

###########################################################
# Use 'slice' to cut sample into bars and pick one randomly
###########################################################
live_loop :slice_bar_1_4 do
  stop
  sample s, beat_stretch: 16, num_slices: 4, slice: pick
  #sample s, beat_stretch: 16, num_slices: 4, slice: rrand_i(0,3)
  #sample s, beat_stretch: 16, num_slices: 4, slice: range(0,4).choose
  sleep 4
end

####################################################################
# Make smaller slices but still fill a complete bar (use n.times do)
####################################################################
# 1/2 bar = 2 beats
live_loop :slice_bar_half do
  stop
  2.times do
    sample s, beat_stretch: 16, num_slices: 8, slice: pick
    #sample s, beat_stretch: 16, num_slices: 8, slice: rrand_i(0,7)
    #sample s, beat_stretch: 16, num_slices: 8, slice: range(0,8).choose
    sleep 2
  end
end

# 1/4 bar = 1 beat
live_loop :slice_bar_quarter do
  stop
  4.times do
    sample s, beat_stretch: 16, num_slices: 16, slice: pick
    #sample s, beat_stretch: 16, num_slices: 16, slice: rrand_i(0,15)
    #sample s, beat_stretch: 16, num_slices: 16, slice: range(0,16).choose
    sleep 1
  end
end

# 1/8 bar = 0.5 beats
live_loop :slice_bar_eighth do
  stop
  8.times do
    sample s, beat_stretch: 16, num_slices: 32, slice: rrand_i(0,31)
    sleep 0.5
  end
end

# Combine two slice sizes: play 3 complete bars and piece together the 4th one
live_loop :slice_bar_combine do
  stop
  3.times do
    sample s, beat_stretch: 16, num_slices: 4, slice: pick
    sleep 4
  end
  4.times do
    sample s, beat_stretch: 16, num_slices: 16, slice: pick
    sleep 1
  end
end

###################
# onset
###################
live_loop :onset do
  #stop
  #8.times do
  sample s, beat_stretch: 16, onset: pick #, start: 0, finish: 0.125
  sleep 0.5
  #end
end
