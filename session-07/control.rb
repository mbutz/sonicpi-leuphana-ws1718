# Use 'control'

# Example for use of 'control' from documentation
comment do
  notes = (scale :e3, :minor_pentatonic, num_octaves: 2).shuffle
  s = synth :beep, note: :e3, sustain: 8, note_slide: 0.05
  64.times do
    control s, note: notes.tick
    sleep 0.125
  end
end #comment

# Testing: set amp within a live loop

#
# This example shows, in what way you can fade-in/out a running synth.
# Blending is achieved through the envelope attack and release times.
# In calling the reference via synth, you can shape the sounding notes by
# an overall envelope.

comment do
  mel = (ring :c3,:g3,:c4,:g4,:c5,:g4,:f4)
  
  # syn is a reference to the synth.
  # Every time a new note is played, this same synth is used.
  
  syn = synth :beep, amp: 1, attack: 5, sustain: 0, release: 5
  
  live_loop :ring do
    control syn, note: mel.tick
    sleep 0.25
  end
  
end #comment

# Do we really have to use a live_loop as above??
# No, but notice: Every loop cycle is a call to one note
# So we call the 7-note-pattern 8 times to fill the whole
# envelope duration (5 attack + 5 release = 10 seconds)
comment do
  mel = (ring :c3,:g3,:c4,:g4,:c5,:g4,:f4)
  syn = synth :beep, amp: 1, attack: 5, sustain: 0, release: 5
  
  (7 * 8).times do
    control syn, note: mel.tick
    sleep 0.25
  end
  
end #comment

# Things to do:

# bending
# crescendo
# length (i.e. 'sustain' and 'release')
# try to 'extend' 'play_pattern_timed' to control note patterns and lengths
# after their definition

use_synth :fm
use_synth_defaults amp: 1, attack: 0.1, sustain: 0, release: 0.1

# ------------------------------------------------------
# Controlling amp or other params this way does not work!
# ------------------------------------------------------

comment do
  use_synth_defaults amp: 0.5, amp_slide: 1, attack: 0.1, sustain: 0, release: 0.25
  4.times do
    play :c4, pan: -0.75
    sleep 0.5
    control play :c4, amp: 2, pan: -0.5
    sleep 0.5
    control play :c4, amp: 3, pan: 0
    sleep 0.5
    control play :c4, amp: 2, pan: 0.5
    sleep 0.5
    control play :c4, amp: 0.5, pan: 0
  end
end

comment do
  define :testing do
    p = play 60,amp: 0.01, sustain: 2    # Play a note at almost 0 volume
    control p, amp: 1                  # then immediately shift it up to audible
    sleep 2
    q = play 72,amp: 1,sustain: 2        # Play a note at normal volume
    control q,amp: 0.01                # Then immediately shift it to silent
    # (you should hear a tiny click as this happens)
    sleep 2
  end
  
  loop { testing }
end

comment do
  
  s = play 60, release: 5
  sleep 0.5
  control s, note: 65
  sleep 0.5
  control s, note: 67
  sleep 3
  control s, note: 72
  
end

comment do
  live_loop :panning do
    s = synth :fm, note: :e4, pan: -1, attack: 2, release: 4, amp: 0
    control s, pan: 1, amp: 3, pan_slide: 2, amp_slide: 6
    sleep 4
    control s, pan: -1, pan_slide: 2
    sleep 6
  end
end
