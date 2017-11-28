# Hausaufgabe von Martin, 28.11.2017

mb = "/home/marty/projects/sonicpi/leuphana-ws1718/online/session-04/samples/mb"

# Dirty House (125-128)
live_loop :bath_room_groove do
  #stop
  use_bpm 125

  hto = (ring 0,0,0,0, 0,0,0,1, 0,0,0,0, 0,0,0,1)
  htc = (ring 1,0,1,0, 1,0,1,0, 1,0,1,0, 1,0,1,0)
  clp = (ring 0,0,0,0, 1,0,0,0, 0,0,0,0, 1,0,0,0)
  snr = (ring  1,0,0,0, 0,0,0,0.125, 1,0,0.125,0, 0,0.125,0,0.125)
  bd_ = (ring 1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0)
  bds = (ring 0,0,0,0, 1,0,0,0, 0,0,0,0, 1,0,0,0)
  tick

  sample mb, "sandpaper", start: 0, finish: 0.45, rate: -1, amp: hto.look if hto.look > 0
  sample mb, "sandpaper", start: 0.5, finish: 0.75, amp: htc.look if htc.look > 0
  sample mb, "door-slam-soft", rate: 0.575, start: 0.025, finish: 0.25, release: 0.125, amp: clp.look * 0.75 if clp.look > 0
  sample mb, "pling", rate: 0.125, finish: 0.015, amp: snr.look if snr.look > 0
  sample mb, "klong", amp: bds.look if bds.look > 0
  sample mb, "pling", rate: -0.05, finish: 0.005, amp: bd_.look * 1.25 if bd_.look > 0

  sleep 0.25

end
