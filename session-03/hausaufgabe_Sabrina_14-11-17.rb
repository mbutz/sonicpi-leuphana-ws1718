# Sabrina: Hausaufgabe 14.11.17

use_bpm 108

live_loop :drum do
  sample :drum_bass_hard, attack: 0.6, amp: 8
  sleep 1
end

live_loop :drum2 do
  sample :drum_bass_soft, release: 4
  sleep 4
end

live_loop :drum3 do
  rhythm = (ring 0,1,0,1,0,0,0,1)
  if rhythm.tick == 1
    sample :drum_cymbal_closed
  end
  sleep 0.5
end

live_loop :drum4 do
  sample :drum_cymbal_hard, attack: 1.5, sustain: 9
  sleep 12
end

live_loop :drum5 do
  rhythm = (ring 1,0,1,0,1,1,1,0,0,0,0,0,0,0,0,0)
  if rhythm.tick == 1
    sample :drum_cymbal_pedal, attack: 0.05
  end
  sleep 1
end 
