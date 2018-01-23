# Kershaw WITHOUT Midi

use_bpm 110

# Count every beat
live_loop :beat do
  sleep 1
end

# Synch 4-bar patterns
live_loop :bars, sync: :beat do
  sample :elec_blip, amp: 0.5, rate: 2.0
  sleep 16
end

# Set up our bass line
bassline = (ring
            :b2,:b3,:e2,:e2,:r,:r,:e3,:g2,:r,:e2,:g3,:e2,:r,:g3,:e2,:g2,
            :r,:e3,:e2,:g3,:e2,:r,:g2,:r,:e2,:g3,:e2,:g2,:r,:d2,:e2,:g2,
            :a2,:r,:e2,:a2,:r,:e3,:a3,:a2,:gs2,:r,:r,:e2,:gs2,:gs3,:e2,:gs3,
            :r,:e2,:e3,:gs3,:e2,:r,:gs3,:e2,:gs2,:r,:e3,:gs2,:r,:e2,:a2,:as2)


# Set up the 2nd brass section
# Helper function for various durations and crescendi/decrescendi
# notes and rests
n = [[:a4],[:d5],[:d5],[:cs5],[:a4],[:b4],[:fs4],[:a4,:e5],[:e4,:gs4,:e5],[:d3,:e4,:d4,:e5],[:e4,:e5,:d5]]
# duration for notes and rest; fade in/out
# if fade needed use subarray [ note, 1 = fade-in, 0 = fade-out ]
d = [[6,1],0.5,0.5,0.5,0.5,1,0.5,[2,1],[2.5,0],1,1]
ratio = 0.9

# The Bass Line
live_loop :bass, sync: :bars do
  with_synth :fm do
    use_synth_defaults amp: 0.5, attack: 0.0, sustain: 0.15, release: 0.01, cutoff: 65
    play bassline.tick
    sleep 0.25
  end
end

# Flitter
live_loop :flitter, sync: :bars do
  #stop
  with_synth :pretty_bell do
    use_synth_defaults amp: 0.125, attack: 0.1, sustain: 0.2, release: 0
    with_random_seed 11865 do
      with_fx :reverb, room: 1 do
        2.times do
          6.times do
            play (ring :b5,:d6,:fs6,:a6,:b6,:d7,:fs7,:a7).choose
            sleep 0.25
          end
          26.times do
            play (ring :g5,:a5,:d6,:g6,:a6,:d7,:g7,:a7).choose
            sleep 0.25
          end
          6.times do
            play (ring :a5,:b5,:e6,:g6,:a6,:b6,:e7,:g7,:a7).choose
            sleep 0.25
          end
          26.times do
            play (ring :e5,:gs5,:b5,:e6,:gs6,:b6,:e7,:gs7,:b7).choose
            sleep 0.25
          end
        end
      end
    end
  end
end

# The Chords
live_loop :chords, sync: :bars do
  #stop
  with_synth :hollow do
    use_synth_defaults amp: 0.75, attack: 0.1, sustain: 1, release: 5, noise: 4
    with_fx :reverb, room: 0.5, mix: 0.75 do
      play (ring :b3,:d4,:fs4,:a4,:b4,:fs5)
      sleep 1.5
      play (ring :a3,:d4,:g4,:a4,:g5)
      sleep 6.5
      play (ring :a3,:e4,:a4,:b4,:e5)
      sleep 1.5
      play (ring :gs3,:e4,:gs4,:b4,:e5)
      sleep 6.5
    end
  end
end

live_loop :brass1, sync: :bars do
  #stop
  a = [:r,:r,:r,:r,:r,:r,:r,:r,:r,:r,:r,:b4,:d5,:fs5,:d5,:r,
       :fs5,:r,:fs5,:d5,:r,:r,:b4,:r,:a4,:b4,:r,:r,:a5,:r,:a5,:fs5]
  b = [:r,:r,:d5,:r,:a4,:b4,:r,:r,:r,:r,:r,:r,:r,:r,:r,:r,
       :r,:r,:r,:r,:r,:r,:r,:r,:r,:r,:b4,:r,:d5,:r,:e5,:fs5]
  c = [:r,:r,:d5,:r,:a4,:b4,:r,:r,:r,:r,:r,:r,:r,:r,:r,:r,
       :r,:r,:r,:r,:r,:r,:r,:r,:r,:r,:b5,:r,:gs5,:r,:e5,:d5]
  phrase = a + b + a + c
  
  with_synth :sine do
    use_synth_defaults amp: 0.5, attack: 0.0, sustain: 0.15, release: 0.01, cutoff: 100, pan: -0.5
    with_fx :reverb, room: 0.75 do
      play phrase.ring.tick
      sleep 0.25
    end
  end
end