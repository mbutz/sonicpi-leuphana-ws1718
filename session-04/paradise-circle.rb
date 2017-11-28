# filename: paradise-circle.rb

use_bpm 70

comment do
  define :perf do | note, rel=1, vol=1, syn=:beep, att=0 |
    use_synth syn
    use_synth_defaults amp: vol, attack: att, release: rel
    play note
  end

  live_loop :paradise do

    with_fx :reverb, room: 0.5, mix: 0.5 do

      perf :c4, 1, 2, :pretty_bell
      perf :g4, 1, 2, :pretty_bell

      sleep 1

      perf :e4, 1, 2, :pretty_bell
      perf :c5, 1, 2, :pretty_bell
      #perf :c6, 1, 0.5

      sleep 1

      perf :f4, 1.5, 2, :pretty_bell
      perf :ab5, 1.5, 2, :pretty_bell

      sleep 2

      perf :ab4, 3, 2, :pretty_bell
      perf :eb4, 3, 0.25, :pretty_bell
      perf :bb5, 3, 2, :pretty_bell

      sleep 4
    end
  end
end

comment do
  define :perf do | note, rel=1, vol=1 |
    use_synth :fm
    use_synth_defaults amp: vol, attack: 0, release: rel, divisor: 1, depth: 0.5
    play note
  end

  live_loop :paradise do

    with_fx :reverb, room: 0.5, mix: 0.5 do

      # C-Dur
      perf :c4, 1, 2
      perf :g4, 1, 2

      sleep 1

      # C-Dur
      perf :e4, 1, 2
      perf :c5, 1, 2

      sleep 1

      # F-Moll
      perf :f4, 1.5, 2
      perf :ab5, 1.5, 0.5

      sleep 2

      perf :ab4, 3, 2
      perf :eb4, 3, 0.25
      perf :bb5, 3, 0.5

      sleep 4
    end
  end

  live_loop :drums do
    sample :loop_compus, beat_stretch: 8, amp: 4
    sleep 8
  end
end

comment do
  play (chord_invert (chord_degree 1, :c4, :major, 3), 0)
  sleep 1
  play (chord_invert (chord_degree 1, :c4, :major, 3), 1)
  sleep 1
  play (chord_invert (chord_degree 1, :f4, :minor, 3), 1)
  sleep 1
  #play [:ab4, :eb4, :bb5]
  play (chord_invert (chord_degree 1, :ab4, :major, 3), 0)
  play :bb5, amp: 0.5
  sleep 1
end
