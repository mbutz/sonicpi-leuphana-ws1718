# Use 'control'

# Example for use of 'control' from documentation
comment do
  notes = (scale :e3, :minor_pentatonic, num_octaves: 2).shuffle
  s = synth :beep, note: :e3, sustain: 8, note_slide: 0.05
  64.times do
    control s, note: notes.tick
    sleep 0.125
  end
end #comment

####################################################################
# Changing synth sounds
####################################################################
comment do
  live_loop :control_fm do
    
    with_synth :fm do
      with_synth_defaults depth: 0.1, divisor: 1, cutoff: 125, release: 0.5 do
        play (ring :c3,:g3,:c4,:g4,:c5,:g4,:f4,:bb4).tick
        control cutoff: 70, cutoff_slide: 0.25
      end
    end
    sleep 0.25
  end
end

comment do
  live_loop :control_dsaw do
    with_synth :dsaw do
      with_synth_defaults detune: 0.1, cutoff: 40, release: 0.5 do
        play (ring :c3,:g3,:c4,:g4,:c5,:g4,:f4,:bb4).tick
        control cutoff: 60, cutoff_slide: 0.125, detune: 0.3, detune_slide: 0.5
      end
    end
    sleep 0.25
  end
end

comment do
  live_loop :control_pulse do
    with_synth :pulse do
      with_synth_defaults cutoff: 100, release: 0.5, pulse_width: 0.001 do
        #with_synth_defaults cutoff: 70, release: 0.5, pulse_width: 0.5 do
        play (ring :c3,:g3,:c4,:g4,:c5,:g4,:f4,:bb4).tick
        control cutoff: 50, cutoff_slide: 0.25, pulse_width: 0.5, pulse_width_slide: 0.025
      end
    end
    sleep 0.25
  end
end

####################################################################
# Change Panning
####################################################################
comment do
  live_loop :panning do
    s = synth :fm, note: :e4, pan: -1, attack: 2, release: 4, amp: 0
    control s, pan: 1, amp: 3, pan_slide: 2, amp_slide: 6
    sleep 4
    control s, pan: -1, pan_slide: 2
    sleep 6
  end
end

####################################################################
# Fading
####################################################################
# Fading with 'tick' only
comment do
  live_loop :ring do
    mel = (ring :c3,:g3,:c4,:g4,:c5,:g4,:f4,:c5,:bb4,:c5,:g4)
    vol = (line 0, 1, steps: 20).reflect
    syn = synth :beep, note: mel.tick, amp: vol.look, attack: 0, sustain: 0.5, release: 0
    sleep 0.5
  end
end #comment


# Fading with control and 'amp_slide'
comment do
  live_loop :ring do
    mel = (ring :c3,:g3,:c4,:g4,:c5,:g4,:f4,:c5,:bb4,:c5,:g4)
    vol = (line 0, 1, steps: 20).reflect
    syn = synth :beep, note: mel.tick, amp: vol.tick(:vol), attack: 0, sustain: 0.5
    control syn, amp: vol.tick(:vol), amp_slide: 0.5
    sleep 0.5
  end
end #comment

####################################################################
# Effects with 'control'
####################################################################

uncomment do
  live_loop :ring do
    use_synth :fm
    use_synth_defaults attack: 0.05, release: 0.5, depth: 0.5
    mel = (ring :c4,:g4,:c5,:g5,:c6,:g5,:f5,:bb5)
    with_fx :reverb, room: 0.5, mix: 0.5 do |rev|
      control rev, room: 0.85, room_slide: 0.25
      play mel.tick
    end
    sleep 2.5
  end
end #comment

####################################################################
# Ambient Loop Example
####################################################################

comment do
  live_loop :ring do
    mel = (ring :c3,:g3,:c4,:g4,:c5,:g4,:f4,:c5,:bb4,:c5,:g4,:d4,:d5,:c5,:f5,:bb4)
    vol = (line 0.25, 1, steps: 100)
    pan = (line -0.5, 0.5, steps: 100).reflect
    syn = synth :fm, note: mel.tick(:n), amp: vol.tick, attack: 2, release: 2, pan: pan.tick(:p), depth: 0.1, divisor: 1
    control syn, amp: vol.tick, amp_slide: 0.25, pan: pan.tick(:p), pan_slide: 0.25, depth: 1.0, depth_slide: 0.25, divisor: 3, divisor_slide: 0.25
    sleep 0.5
  end
end #comment


