use_bpm 120

define :teil_a do
  use_synth :fm
  use_synth_defaults release: 0.5
  play :c
  sleep 1
  play :e
  sleep 1
  play :g
  sleep 1
  play :c5
  sleep 1
end


define :teil_b do
  use_synth :tri
  use_synth_defaults release: 0.5
  play :d
  sleep 1
  play :fs
  sleep 1
  play :a
  sleep 1
  play :d5
  sleep 1
end

in_thread do
  teil_a
end
in_thread do
  teil_b
end
sleep 4
teil_a
teil_b
