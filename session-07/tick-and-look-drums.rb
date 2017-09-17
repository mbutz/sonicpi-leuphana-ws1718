# Drums mit Tick & Look

use_bpm 125

live_loop :bass do

  ptn = (ring 1, 0, 0, 0, 1, 0.25, 0, 0, 1, 0.25, 0.5, 0, 1, 0, 0, 0.5)
  #ptn = (ring 0, 0, 0, 0)

  if ptn.tick > 0
    sample :bd_ada, amp: ptn.look
  end

  sleep 0.25

end

live_loop :hihat do

  ptn = (ring 0, 0, 1, 0, 0, 0, 1, 0)
  ptn = (ring 0.25, 0.25, 1, 0.25, 0.25, 0.5, 1, 0.25)
  #ptn = (ring 0, 0, 0, 0)

  if ptn.tick > 0
    sample :drum_cymbal_closed, amp: ptn.look
  end

  sleep 0.25

end

live_loop :snare do

  ptn = (ring 0,0,0,0, 0.5,0,0,0, 0,0,0,0, 1,0,0,0.5)

  if ptn.tick > 0
    sample :elec_snare, amp: ptn.look
  end


  sleep 0.25

end
