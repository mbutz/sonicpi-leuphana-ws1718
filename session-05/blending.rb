# Sonic Pi resources collected by Martin Butz, mb@mkblog.org
# filename: blending.rb

# use 'uncomment' resp. 'comment' to play selected examples or
# 'stop' resp. '#stop' to play the loops

use_bpm 120

# Blending with `tick`, `range` and `line`

# Why you have to `ramp` the `range` or `line`:
# `range`/`line`:
# Create a new ring buffer from the range/line arguments.
# Indexes wrap around; that is where `ramp` comes into play:
# ramp:
# Create a new immutable ramp vector. Indexes always return first or
# last value if out of bounds.

#-----------------------------------------------------
# Blending using `line`
#-----------------------------------------------------

# Note:
# How short or how long your blend depends on
# 1. The amount of values resp. the stepsize of your `range`/`line`
# 2. The duration of your `live_loop`

# The use of 'range' is probably more intuitive because you define the amount of steps rather than the step size: if you have a `live_loop` running 0.25 beats long 16 steps = 1 bar will bring the volume from 0 to 1 (so if your blend should take 4 bars to go from 0 to 1 you'll have to set 64 steps).

#vol = (ring 0.125, 0.25, 0.5, 0.75, 1).mirror
# live_loop :amen do
#   #stop
#   sample :loop_amen, beat_stretch: 4, amp: vol.tick
#   sleep 4
# end

#-----------------------------------------------------
# Blending using `line`
#-----------------------------------------------------

#vol = (line 0, 1, inclusive: true, steps: 100).ramp
#puts vol

# blend in
live_loop :blend_in_with_line_ramp do
  #stop
  vol = (line 1, 0, inclusive: true, steps: 500).ramp
  ptn = (ring 1,0,0.5,0,1,0,0.25,0.25,1,0.25,1,0,1,0,1,0.25)
  sample :bd_tek, amp: vol.tick * ptn.look
  sleep 0.25
end

# blend out
live_loop :blend_out_with_line_ramp do
  stop
  vol = (line 1, 0, inclusive: true, steps: 100).ramp
  ptn = (ring 1,0,0,0,1,0,0,0.25,1,0,0,0,1,0,0,0.25)
  sample :bd_tek, amp: vol.tick * ptn.look
  sleep 0.25
end

# blend in and out
live_loop :blend_in_and_out_with_line_ramp do
  stop
  vol = (line 0, 1, inclusive: true, steps: 100).mirror
  ptn = (ring 1,0,0,0,1,0,0,0.25,1,0,0,0,1,0,0,0.25)
  sample :bd_tek, amp: vol.tick * ptn.look
  sleep 0.25
end

#-----------------------------------------------------
# Blending using `range`
#-----------------------------------------------------

# "range": from, to, step size
# (range 1, 5) => (ring 1, 2, 3, 4)

# blend in
live_loop :blend_in_with_range_ramp do
  stop
  vol = (range 0, 1, step: 0.005).ramp
  ptn = (ring 1,0,0,0,1,0,0,0.25,1,0,0,0,1,0,0,0.25)
  sample :bd_tek, amp: vol.tick * ptn.look
  sleep 0.25
end

# blend out
live_loop :blend_out_with_range_ramp do
  stop
  vol = (range 1, 0, step: 0.005).ramp # swap 1st two `range` params
  ptn = (ring 1,0,0,0,1,0,0,0.25,1,0,0,0,1,0,0,0.25)
  sample :bd_tek, amp: vol.tick * ptn.look
  sleep 0.25
end

# blend in/out
live_loop :blend_in_out_with_range_ramp do
  stop
  vol = (range 0, 1, step: 0.005).mirror # swap 1st two `range` params
  ptn = (ring 1,0,0,0,1,0,0,0.25,1,0,0,0,1,0,0,0.25)
  sample :bd_tek, amp: vol.tick * ptn.look
  sleep 0.25
end

#-----------------------------------------------------
# Blending using `line` and `at`
#-----------------------------------------------------

# `at` is very useful to create rhythmical patterns because
# it is somehow more intuitive to musicians then working e. g.
# with `sleep`; `sleep` defines the time distance from a previous
# event whereas `at` defines an event on the base of larger unit
# as e. g. a bar; see the following `live_loop` which has 4 beats
# = 1 bar; to blend while using at we will have to to devide our
# line into groups with a length matching the number of values
# passed to `at`. In the following case I use `vol` to define the
# base values for the blending operation; then I multiply each base
# value with the number of kicks per beat so that each run of the
# loop the volume is raised. (Sorry, I feel that this explanation
# could be much clearer, I will have to fix that)

live_loop :blend_in_with_line_and_at do
  stop
  # define the kick pattern
  ptn = (ring 0,1,2,3,3.25)
  # define the blend
  vol = (line 0, 1, steps: 10).ramp
  # make groups of values with a length that matches the one of ptn
  vols = (knit vol.tick, ptn.size)

  at ptn, vols do |v|
    sample :bd_tek, amp: v
    puts "Current Volume: #{v}"
  end
  sleep 4
end
