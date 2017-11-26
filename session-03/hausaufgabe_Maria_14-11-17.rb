# Maria: Hausaufgabe 14.11.17

use_bpm 120
live_loop :gmean do
  rhythm = (ring 1,1,0,0,1,0,0,0)
  if rhythm.tick == 1
    sample :bd_tek, amp: 3
  end
  sleep 0.5
end
uncomment do
  live_loop :gin do
    rhythm = (ring 0,1)
    if rhythm.tick ==1
      sample :drum_snare_soft, amp: 4
    end
    sleep 1
  end
end

live_loop :azelt do
  rhythm = (ring 1,1,1,1,
                 1,1,1,1)
  if rhythm.tick == 1
    sample :drum_cymbal_closed, amp: 1
  end
  sleep 0.5
end 
