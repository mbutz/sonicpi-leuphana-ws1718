# Anngret: Hausaufgabe 14.11.17

use_bpm 120

4.times do
  sample :bd_808
  sleep 1
end

live_loop :basedrum do
  sample :bd_808
  sleep 1
end


live_loop :cymbal do
  rhythm = (ring 0,1,0,1)
  if rhythm.tick == 1
    sample :drum_cymbal_closed, amp: 0.05
  end
  sleep 0.5
end

live_loop :akzent do
  sample :drum_roll, amp: 0.05, sustain: 2, release: 0.5
  sleep 8
  end
