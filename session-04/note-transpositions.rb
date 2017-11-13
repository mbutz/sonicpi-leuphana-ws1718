# coding: utf-8
# filename: note-transpositions
# Einführung in Musiktheorie und -praxis mit Hinblick auf Sonic Pi

# Note Transformations
# DeSantis 2015, 134ff.

# Original melodiy
# Transposition (diatonic, fourth downwards)
# Intervallic inversion
# Reversion, Mirroring
# Time Compression

# More possible transformations:



use_bpm 130

uncomment do
  # Melody

  # :d5                        x
  # :c5                     x
  # :b4                           x
  # :a4     x             x           x   x
  # :g4
  # :f4       x
  # :e4
  # :d4 x       x       x
  # :c4             x
  # :b3
  # :a3           x

  n1 = (ring :d4, :a4, :f4, :d4, :a3, :c4, :d4, :a4, :c5, :d5, :b4, :a4, :a4)
  d1 = (ring 1,1,1,1,1,1,2,1,1,1,1,2,2)

  play_pattern_timed n1, d1
end #comment

comment do
  # Transposition, fourth downwards

  # :a4                        x
  # :g4                     x
  # :f4                           x
  # :e4     x             x           x   x
  # :d4
  # :c4       x
  # :b3
  # :a3 x       x       x
  # :g3             x
  # :f3
  # :e3           x

  s = 69 # starting note
  n1 = (ring :a3,:e4,:c4,:a3,:e3,:g3,:a3,:e4,:g4,:a4,:f4,:e4,:e4)
  d1 = (ring 1,1,1,1,1,1,2,1,1,1,1,2,2)
  play_pattern_timed n1, d1
end #comment

comment do
  # Inversion

  # :g4            x
  # :f4
  # :e4               x
  # :d4 x       x        x
  # :c4
  # :b3       x
  # :a3
  # :g3    x                x            x  x
  # :f3                              x
  # :e3                        x
  # :d3                           x

  d2 = (ring 1,1,1,1,1,1,2,1,1,1,1,2,2)
  n2 = (ring :d4, :g3, :b3, :d4, :g4, :e4, :d4, :g3, :e3, :d3, :f3, :g3, :g3)
  play_pattern_timed n2, d2

end #comment

comment do
  # Original plus inversion, speed doubled
  in_thread do
    n1 = (ring :d4, :a4, :f4, :d4, :a3, :c4, :d4, :a4, :c5, :d5, :b4, :a4, :a4,
               :d4, :g3, :b3, :d4, :g4, :e4, :d4, :g3, :e3, :d3, :f3, :g3, :g3)
    d1 = (ring 0.5,0.5,0.5,0.5,0.5,0.5,1,0.5,0.5,0.5,0.5,1,1)
    play_pattern_timed n1, d1
  end

  play_pattern_timed n1, d1

end #comment

comment do
  # Original an inversion as bassline
  in_thread do
    n1 = (ring :d4, :a4, :f4, :d4, :a3, :c4, :d4, :a4, :c5, :d5, :b4, :a4, :a4)
    d1 = (ring 1,1,1,1,1,1,2,1,1,1,1,2,2)
    play_pattern_timed n1, d1
  end
  d2 = (ring 1,1,1,1,1,1,2,1,1,1,1,2,2)
  n2 = (ring :d4, :g3, :b3, :d4, :g4, :e4, :d4, :g3, :e3, :d3, :f3, :g3, :g3)
  play_pattern_timed n2, d2

end #comment

comment do
  # Original an inverted transposition combined
  # Transposition

  # :d4            x
  # :c4
  # :b3              x
  # :a3 x       x       x
  # :g3
  # :f3      x
  # :e3
  # :d3   x                x          x  x
  # :c3                            x
  # :b2                       x
  # :a2                          x

  in_thread do
    n1 = (ring :d4, :a4, :f4, :d4, :a3, :c4, :d4, :a4, :c5, :d5, :b4, :a4, :a4)
    d1 = (ring 1,1,1,1,1,1,2,1,1,1,1,2,2)
    play_pattern_timed n1, d1
  end
  d2 = (ring 1,1,1,1,1,1,2,1,1,1,1,2,2)
  n2 = (ring :a3, :d3, :f3, :a3, :d4, :b3, :a3, :d3, :b2, :a2, :c3, :d3, :d3)
  play_pattern_timed n2, d2

end #comment

comment do
# Reversion (Spiegelung)
  n1 = (ring :d4, :a4, :f4, :d4, :a3, :c4, :d4, :a4, :c5, :d5, :b4, :a4, :a4).reverse
  d1 = (ring 1,1,1,1,1,1,2,1,1,1,1,2,2)

  play_pattern_timed n1, d1

end #comment

comment do
  # Original and reversion, speed doubled
  n1 = (ring :d4, :a4, :f4, :d4, :a3, :c4, :d4, :a4, :c5, :d5, :b4, :a4, :a4).mirror
  d1 = (ring 0.5,0.5,0.5,0.5,0.5,0.5,1,0.5,0.5,0.5,0.5,1,1)

  play_pattern_timed n1, d1

end #comment

comment do
  # Original and reversion with doubled durations
  # Transposed inversion as bassline
  #use_synth :fm
  #use_synth_defaults release: 1.5, depth: 1, divisor: 0.5
  # Original and mirror, double speed plus tranposed inversion
  #in_thread do
    with_fx :reverb do
    n1 = (ring :d4, :a4, :f4, :d4, :a3, :c4, :d4, :a4, :c5, :d5, :b4, :a4, :a4).mirror
    d1 = (ring 0.5,0.5,0.5,0.5,0.5,0.5,1,0.5,0.5,0.5,0.5,1,1)
    play_pattern_timed n1, d1
    end
  #end
  d2 = (ring 1,1,1,1,1,1,2,1,1,1,1,2,2)
  n2 = (ring :a3, :d3, :f3, :a3, :d4, :b3, :a3, :d3, :b2, :a2, :c3, :d3, :d3)
  play_pattern_timed n2, d2

end #comment





