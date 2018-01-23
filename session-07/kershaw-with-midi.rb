# Kershaw with Midi
#midi_all_notes_off

use_bpm 110

# Count every beat
live_loop :beat do
  sleep 1
end

# Synch 4-bar patterns
live_loop :bars, sync: :beat do
  #sample :elec_blip, amp: 0.5, rate: 2.0
  sleep 16
end

# The Bass Line
live_loop :bass, sync: :bars do
  use_real_time
  bassline = (ring
              :b2,:b3,:e2,:e2,:r,:r,:e3,:g2,:r,:e2,:g3,:e2,:r,:g3,:e2,:g2,
              :r,:e3,:e2,:g3,:e2,:r,:g2,:r,:e2,:g3,:e2,:g2,:r,:d2,:e2,:g2,
              :a2,:r,:e2,:a2,:r,:e3,:a3,:a2,:gs2,:r,:r,:e2,:gs2,:gs3,:e2,:gs3,
              :r,:e2,:e3,:gs3,:e2,:r,:gs3,:e2,:gs2,:r,:e3,:gs2,:r,:e2,:a2,:as2)
  midi bassline.tick, sustain: 0.25, channel: 5, vel_f: 0.5
  sleep 0.25
end

# Flitter
live_loop :flitter, sync: :bars do
  stop
  use_real_time
  with_random_seed 11865 do
    2.times do
      6.times do
        midi (ring :b5,:d6,:fs6,:a6,:b6,:d7,:fs7,:a7).choose, sustain: 0.25, vel_f: 0.125, channel: 2
        sleep 0.25
      end
      26.times do
        midi (ring :g5,:a5,:d6,:g6,:a6,:d7,:g7,:a7).choose, sustain: 0.25, vel_f: 0.125, channel: 2
        sleep 0.25
      end
      6.times do
        midi (ring :a5,:b5,:e6,:g6,:a6,:b6,:e7,:g7,:a7).choose, sustain: 0.25, vel_f: 0.125, channel: 2
        sleep 0.25
      end
      26.times do
        midi (ring :e5,:gs5,:b5,:e6,:gs6,:b6,:e7,:gs7,:b7).choose, sustain: 0.25, vel_f: 0.125, channel: 2
        sleep 0.25
      end
    end
  end
end

# The Chords
live_loop :chords, sync: :bars do
  stop
  use_real_time
  midi_chord (ring :b3,:d4,:fs4,:a4,:b4,:fs5), sustain: 1.5, vel_f: 0.25, channel: 3
  sleep 1.5
  midi_chord (ring :a3,:d4,:g4,:a4,:g5), sustain: 6.5, vel_f: 0.25, channel: 3
  sleep 6.5
  midi_chord (ring :a3,:e4,:a4,:b4,:e5), sustain: 1.5, vel_f: 0.25, channel: 3
  sleep 1.5
  midi_chord (ring :gs3,:e4,:gs4,:b4,:e5), sustain: 6.5, vel_f: 0.25, channel: 3
  sleep 6.5
end

live_loop :brass, sync: :bars do
  stop
  use_real_time
  # Set up the Brass Section
  a = [:r,:r,:r,:r,:r,:r,:r,:r,:r,:r,:r,:b4,:d5,:fs5,:d5,:r,
       :fs5,:r,:fs5,:d5,:r,:r,:b4,:r,:a4,:b4,:r,:r,:a5,:r,:a5,:fs5]
  b = [:r,:r,:d5,:r,:a4,:b4,:r,:r,:r,:r,:r,:r,:r,:r,:r,:r,
       :r,:r,:r,:r,:r,:r,:r,:r,:r,:r,:b4,:r,:d5,:r,:e5,:fs5]
  c = [:r,:r,:d5,:r,:a4,:b4,:r,:r,:r,:r,:r,:r,:r,:r,:r,:r,
       :r,:r,:r,:r,:r,:r,:r,:r,:r,:r,:b5,:r,:gs5,:r,:e5,:d5]
  
  phrase = a + b + a + c
  
  midi phrase.ring.tick, sustain: 0.25, vel_f: 0.25, channel: 4
  sleep 0.25
end