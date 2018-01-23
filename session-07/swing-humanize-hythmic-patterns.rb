use_bpm 120

live_loop :beat do
  sleep 1
end

live_loop :metro, sync: :beat do
  sleep 16
end

live_loop :bass, sync: :metro do
  #stop
  with_fx :hpf, cutoff: 30 do
    with_fx :echo, phase: 0.25, decay: 1, mix: (ring 0, 0.5, 1).choose do
      s = synth :fm, note: (knit :a1, 8, :e2, 4, :d2, 4).tick,
        attack: 0, sustain: 0, release: 0.25, divisor: 1, depth: 1, amp: 1.5
      control s, depth_slide: 0.125, depth: 4, divisor_slide: 0.125, divisor: 1
    end
  end
  sleep 2
end

live_loop :bass2, sync: :metro do
  #stop
  with_swing -0.0125, pulse: (ring 2,4).choose do
    if spread((ring 7,9).choose,16).reverse.tick
      s = synth :fm, note: (invert_chord (chord_degree [1,2,3].choose, :a1, :minor_pentatonic, 3), 2).look,
        attack: 0, sustain: 0, release: 0.25, divisor: 1, depth: 1,
        amp: (ring 0.25,0.35,0.075,0.35).choose
      control s, depth_slide: 0.125, depth: 4
    end
  end
  sleep 0.25
end
