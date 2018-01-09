use_bpm 130

live_loop :hihat do
  sleep 0.5
  sample :drums_cymbal_closed

end

live_loop :kick do
  ptn = (ring 1,0,0,0, 1,0,0,0, 1,0,0,0, 1,1,1,1)
  sample :bd_tek, amp: ptn.tick
  sleep 0.25
end
