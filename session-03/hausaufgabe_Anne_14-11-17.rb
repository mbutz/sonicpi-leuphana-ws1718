# Anne: Hausaufgabe 14.11.17

live_loop :drums do
  sample :drum_bass_soft
  sleep 0.5
  sample :sn_zome
  sleep 0.25
  sample :drum_heavy_kick
  sleep 0.5
  sample :drum_snare_hard, amp: 0.5
  sleep 0.75
end

live_loop :hihat do
  3.times do
    with_fx :flanger do
      sample :drum_cymbal_pedal, amp: 0.2
      sleep 0.25
    end
  end
end
