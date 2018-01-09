# Hier Pfad vom Sample eingeben
hihats = "/home/marty/projects/sonicpi/playground/audio/samples/loops/hihats/"

live_loop :sample do

  sample hihats, 2, beat_stretch: 4, amp: 1.5

  at [0,2] do

    sample hihats, 2, beat_stretch: 2, rate: 1

    with_fx :slicer, phase: [0.75,1.25].choose, smooth: 0.5 do
      with_fx :slicer, phase: 0.125 do
        with_fx :rhpf, cutoff: 95, res: 0.85 do

          sample hihats, 2, beat_stretch: 2, attack: 2, release: 3, rate: -0.5, amp: 0.75

        end
      end
    end
  end
  sleep 4
end
