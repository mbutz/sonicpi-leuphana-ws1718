# coding: utf-8
# Hier einmal der Nachbau von Pemberton „Novelty Track“.
# Judith und Maria

# Novelty Track Pemberton

live_loop :hihat do
  rhythm = (ring 1,1,1,1)
  if rhythm.tick == 1
    sample :drum_cymbal_closed
  end
  sleep 0.38
end

live_loop :becken do
  rhythm = (ring 1,0,1,0)
  if rhythm.tick == 1
    sample :drum_cymbal_soft
  end
  sleep 0.38
end

live_loop :bassdrum do
  rhythm = (ring 1,0,0,0,
                 1,1,0,0)
  if rhythm.tick == 1
    sample :bd_sone, amp: 1
  end
  sleep 0.38
end

live_loop :snaredrum do
  rhythm = (ring 0,0,1,0)
  if rhythm.tick == 1
    sample :drum_snare_hard
  end
  sleep 0.38
end

# melodie.rb

comment do
  16.times do
    use_synth :piano
    n1 = (ring :g2, :r, :r, :b2,
               :r, [:d3, :f3, :a3], :r, :f3,
               :r, :g3, :r, :b3,
               :g3, :r, :f3, :r)
    d1 = (ring 1,0,0,1,
               1,0,1,0,
               0,1,0,1,
               1,0,1,0)
    play n1.tick
    sleep 0.25
  end
end

