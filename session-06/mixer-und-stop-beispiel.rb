live_loop :metro do
  sleep 4
end

run_loop_a = 0
run_loop_d = 0

live_loop :loop_a, sync: :metro do
  stop if run_loop_a == 0
  play :a
  sleep 1
end

live_loop :loop_d, sync: :metro do
  stop if run_loop_d == 0
  play :d
  sleep 1
end
