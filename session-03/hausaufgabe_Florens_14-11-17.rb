# Florens: Hausaufgabe 14.11.17

use_bpm 120
4.times do
  sample :bd_fat, amp: 4
  sleep 1
end
live_loop :base do
  sample :bd_haus
  sleep 1
end
live_loop :snare do
  sleep 1
  sample :sn_dolf
  sleep 1
end
live_loop :hihat do
  rhythm = (ring 0,1,0,1,0,1,0,0,1,1,0,0,1,1,0,0,1)
  if rhythm.tick == 1
    sample :drum_heavy_kick, amp: 0.5, rate: 1
  end
  sleep 0.25
end
live_loop :cowbell do
  rhythm = (ring 0,0,0,1,0,0,0,0)
  if rhythm.tick == 1
    sample :drum_cowbell, amp: 0.25, rate: 1
  end
  sleep 0.25
end
