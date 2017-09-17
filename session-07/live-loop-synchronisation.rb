# Synchronisation von Live-Loops

live_loop :timer do
  sleep 8
end

live_loop :bass do
  #stop
  sync :timer
  play :c3
  sleep 1
  play :c3
  sleep 1
  play :c3
  sleep 1
  play :c3
  sleep 1

  play :g3
  sleep 1
  play :g3
  sleep 1
  play :g3
  sleep 1
  play :g3
  sleep 1

end

live_loop :chords do
  #stop
  sync :timer
  sleep 2.5
  play (chord :c4, :major)
  sleep 1.5

  sleep 2.5
  play (chord :g4, :major)
  sleep 1.5

end
