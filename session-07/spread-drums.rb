# Use 'spread' to create 'humanized' drum rythm

use_bpm 120

uncomment do
  live_loop :drums do
    #stop
    tick
    # x--- x--- x--- x---
    # bass drums
    #sample :drum_heavy_kick, amp: (ring 1,0,0,0).look
    sample :drum_heavy_kick, amp: 1 if spread(4,16).look
    sample :drum_heavy_kick, amp: (ring 1,0,0,0, 1,0,0,0, 1,0,0,0.25, 1,0,0.5,0).look
    #sample :bd_808, amp: 4 if spread([3,7,9].choose,16).look
    # (x-- -x-- -x-- -x---)

    # Offbeat Hihat
    sample :drum_cymbal_closed, amp: (ring 0,0,1,0).look
    sample :drum_cymbal_open, amp: 0.5, start: 0, finish: 0.05, release: 0.1 if (ring 0,0,1,0).look != 0

    # More Hihat
    sample :drum_cymbal_closed, rate: 1.25 if spread(3,8).look
    sample :drum_cymbal_closed, rate: 1.5, amp: 0.25 if spread(7,8).mirror.look
    sample :drum_cymbal_closed, amp: (ring 0.25,0.25,0,0.5).look
    sample :drum_cymbal_pedal, amp: 0.5 if spread(2,5).look
    #sample :drum_cymbal_closed, amp: 0.25 if spread(11,16).reverse.mirror.look

    # Cowbell
    #sample :drum_cowbell, rate: 1, amp: 0.15 if spread([17,21].choose,32).look
    #sample :drum_cowbell, rate: 0.75, amp: 0.1 if spread([11,15].choose,64).reverse.look

    # Snare
    sample :elec_snare, start: 0, finish: 0.25, amp: (ring 0,0,0,0,0.5,0,0,0).look
    #sample :drum_snare_hard, amp: (ring 0,0,0,0,0.5,0,0,0).look

    # Ghost Snares
    sample :drum_snare_soft, amp: [0.25,0.5].choose if spread(11,69).reverse.look if one_in 1
    sample :drum_snare_soft, amp: 0.5 if spread(15,128).reverse.look if one_in 1
    sample :drum_snare_soft, amp: [0.25,0.5].choose if spread(11,37).reverse.look if one_in 1
    sample :drum_snare_soft, amp: [0.15,0.25].choose if spread(17,45).reverse.look if one_in 1
    sample :drum_snare_soft, amp: [0.25,0.5].choose if spread(11,69).reverse.look if one_in 1
    sample :drum_snare_soft, amp: 0.5 if spread(15,128).reverse.look if one_in 1
    sample :drum_snare_soft, amp: [0.25,0.5].choose if spread(11,37).reverse.look if one_in 1

    # Glitch Snares
    sample :drum_snare_soft, rate: -0.5, start: 0.02, finish: 0.1 if spread(2,8).reverse.look
    sample :drum_snare_soft, rate: 0.25, start: 0.025, finish: 0.075, amp: (ring 0,1,0,1,1.5,0,0,0.5).look

    sleep 0.25
  end

end #comment


# # = spread(2,8) = spread(4,16)
# puts "-- spread(1,4) ---------------"
# puts spread(1,4) # x---

# puts "-- spread(1,8) ---------------"
# puts spread(1,8) # x--- ----

# puts "-- spread(1,8).reverse ---------------"
# puts spread(1,8) # ---- ---x

# puts "----------------"
# puts spread(4,8).slice(0..3)
# puts "----------------"
# puts spread(4,8).each_slice(3).to_a
# puts "----------------"
# puts spread(4,8)

comment do
  tick_set :t, 1

  16.times do
    if tick(:t) % 2 == 0
      puts "#{look(:t)}: true"
    else
      puts "#{look(:t)}: false"
    end
  end
end #comment
