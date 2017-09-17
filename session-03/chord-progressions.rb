# coding: utf-8
# Introduction to Chords and Chord Progressions
# filename: chord-progressions.rb

comment do
  puts "---------------------------------------------------"
  puts "The main building blocks of chords are thirds."
  puts "Here come some major thirds, each consisting of"
  puts "two notes with the distance of of 4 semitones."
  play :c
  play :e
  sleep 1
  play :g
  play :b
  sleep 1
  play :d5
  play :fs5
  sleep 2
  puts "Some minor thirds, each consisting of two notes "
  puts "with the distance of of 3 semitones."
  play :c
  play :eb
  sleep 1
  play :g
  play :bb
  sleep 1
  play :d5
  play :f5
end

comment do
  puts "---------------------------------------------------"
  puts "A chord usually consists at least of two thirds."
  puts "Let's play each of them separately ..."
  play :c
  play :e
  sleep 1
  play :e
  play :g

  sleep 2

  play :c
  sleep 0.25
  play :e
  sleep 0.25
  play :g

  sleep 2

  puts "... and now together. This is a C Major (C-Dur)."
  play (chord :c, :major), amp: 2
end

comment do
  puts "---------------------------------------------------"
  puts "The combination and order of minor or major thirds"
  puts "- a triad (Dreiklang) - decides what sort of chord"
  puts "we will get:"
  sleep 1
  puts "A major and a minor third will make a "
  puts "MAJOR CHORD."
  play (chord :c, :major), amp: 2
  sleep 2
  puts "A minor and a major third will make a "
  puts "minor chord. (Usually uppercase letters indicate )"
  puts "'MAJOR' and lowercase letters 'minor'."
  play (chord :c, :minor), amp: 2
  sleep 3
  puts "But - you could also combine two minor thirds ..."
  play (chord :c, :diminished), amp: 2
  puts "... and will get a diminished chord (vermindert)."
  sleep 3
  puts "Or - you could combine two major thirds ..."
  play (chord :c, :augmented), amp: 2
  puts "... and will get an augmented chord (uebermaessig)."
  puts "But MAJOR and minor chords are much more common."
  puts "---------------------------------------------------"
end

comment do
  puts "---------------------------------------------------"
  puts "Now let's take the C-Major scale ..."
  play_pattern_timed (scale :c, :major), [0.125]
  puts "... and build on each note a triad (Dreiklang) with the"
  puts "notes from this scale. This will give us 7 chords -"
  puts "so-called 'diatonic chords' because they all derive"
  puts "from the same key."
  sleep 1
  play [:c,:e,:g]
  sleep 1
  play [:d,:f,:a]
  sleep 1
  play [:e,:g,:b]
  sleep 1
  play [:f,:a,:c5]
  sleep 1
  play [:g,:b,:d5]
  sleep 1
  play [:a,:c5,:e5]
  sleep 1
  play [:b, :d5, :f5]
  sleep 1
  puts "---------------------------------------------------"
end

comment do
  puts "---------------------------------------------------"
  puts "Fore that sort of thing, we can more easily"
  puts "use the degree function. It let's us choose which"
  puts "note of a key we want to choose as a base for a chord."
  puts "Furthermore we can define of how many notes (resp. "
  puts "triads) this chord should be build of."
  puts "At the end you will hear another C Major chord -"
  puts "This time a whole octave higher."

  degrees = (line 1, 8, steps: 8, inclusive: true)

  8.times do
    play (chord_degree, degrees.tick, :c4, :major, 3)
    sleep 0.5
  end

  sleep 1
  puts "Now let's hear what it sounds like with 4 notes in the chord:"

  8.times do
    play (chord_degree, degrees.tick, :c4, :major, 4)
    sleep 0.5
  end

  puts "These 7 chords are available to be used in C Major."
  puts "Of course there are many more chords in case you choose "
  puts "to use more than one key."
  puts "---------------------------------------------------"
end

comment do
  puts "---------------------------------------------------"
  puts "Ah, one more thing: So far we've heard all chords"
  puts "in the root position: in the C major chord the"
  puts "c is in the bass folled by an e (a third from c) "
  puts "and finally by a g which is a fifth from the c."
  play (chord_degree, 1, :c4, :major, 3)
  sleep 1
  puts "Now we will use Sonic Pi's chord_invert function. We"
  puts "will play the C major chord again but this time put the bottom"
  puts "note C on top of it. The bass note of the chord will now"
  puts "be the e. Nevertheless it is still C-Major - but in its"
  puts "'first inversion'."
  play (chord_invert (chord_degree 1, :c4, :major, 3), 1)
  sleep 1
  puts "We can go on and this time put the e from the bottom on top of"
  puts "the chord. This is the 'second inversion' and the bass note"
  puts "will be the g."
  play (chord_invert (chord_degree 1, :c4, :major, 3), 2)
  sleep 3
  puts "Note that the last parameter of the chord_invert function"
  puts "controls the inversion. 0 = root position, 1 = first inversion and"
  puts "2 = second inversion. What happens if we go on counting?"
  num_inversions = (line 1, 15, steps: 15, inclusive: true)
  15.times do
    play (chord_invert (chord_degree 1, :c2, :major, 3), num_inversions.tick)
    sleep 0.25
  end
  puts "Can you explain, what is happening here?"
end

comment do
  puts "---------------------------------------------------"
  puts "You can use these inversions to change the melodic"
  puts "shape a succession of chords always has. Usually the"
  puts "highest note of a chord will be heard as melody in"
  puts "case you have several chords in a row."

  sleep 1
  puts "Listen again to the line of diatonic chords in C major:"

  degrees = (line 1, 8, steps: 8, inclusive: true)

  8.times do
    play (chord_degree, degrees.tick, :c4, :major, 4)
    sleep 0.5
  end
  sleep 2

  puts "Now let's use chord inversions and - if neccessary"
  puts "change the octave - to smoothen this line melodically."
  puts "As last chord I added again the C major chord to get"
  puts "some kind of closure to this progression."

  degrees = (line 1, 8, steps: 8, inclusive: true)
  puts degrees
  octaves = (ring :c4,:c4,:c3,:c4,:c3,:c3,:c3,:c3)
  inversions = (ring 0,0,2,0,2,1,1,1)

  8.times do
    play (chord_invert (chord_degree, degrees.tick, octaves.look, :major, 3), inversions.look)
    sleep 0.5
  end

  puts "You can hear that we created a little 'melody' harmonised"
  puts "with all diatonic chords in one row. But rarely you will"
  puts "find all diatonic chords organised in such a way."
  puts "Go on and change the number of notes per chord from 3 to"
  puts "4, 5 or just 2. How does that sound?"
  puts "---------------------------------------------------"
end

comment do
  puts "---------------------------------------------------"
  puts "Let's listen to some very common (and in terms of traditional"
  puts "music) nice sounding chord progressions also called 'cacdences'."
  puts "Basically most popular songs work with 3 degrees, meaning"
  puts "3 chords of our diatonic chord collection:"
  puts "The 1st, the 2nd and the 4th degree. Degrees will usually"
  puts "be abbreviated with roman numerals. So we have the"
  puts "following succession: I - IV - V - I:"

  4.times do
  play (chord :c, :major)
  sleep 0.5
  end
  4.times do
  play (chord :f, :major)
  sleep 0.5
  end
  4.times do
  play (chord :g, :major)
  sleep 0.5
  end
  4.times do
  play (chord :c, :major)
  sleep 0.5
  end

  sleep 2

  puts "If we apply our chord_invert function,"
  puts "it will sound a little smoother."

  4.times do
    play (chord :c, :major)
    sleep 0.5
  end
  4.times do
    play (chord_invert (chord :f3, :major), 1)
    sleep 0.5
  end
  4.times do
    play (chord_invert (chord :g3, :major), 1)
    sleep 0.5
  end
  4.times do
    play (chord :c, :major)
    sleep 0.5
  end

  puts "---------------------------------------------------"
end

comment do
  puts "---------------------------------------------------"
  puts "I - IV - V - VI:"
  puts "We don't have to go back to the first degree. We could"
  puts "also use the 6th degree at the end which would lead to "
  puts "a so-called 'false cadence' because we are not"
  puts "resolving to where we came from (I) but to the "
  puts "relative minor on sixth degree (Mollparallele), which"
  puts "is a minor. As it consists of the notes a-c-e it has two"
  puts "notes in common with C major (c-e-g)."

  4.times do
    play (chord :c, :major)
    sleep 0.5
  end
  4.times do
    play (chord_invert (chord :f3, :major), 1)
    sleep 0.5
  end
  4.times do
    play (chord_invert (chord :g3, :major), 1)
    sleep 0.5
  end
  4.times do
    play (chord_invert (chord :a3, :minor), 1)
    sleep 0.5
  end

  puts "---------------------------------------------------"
end

comment do
  puts "---------------------------------------------------"
  puts "I - II - V - VI"
  puts "Also the 4th degree, the F major chord has a "
  puts "parallel chord. Just like the relative minor does,"
  puts "it starts a minor third below f and has thus two notes"
  puts "in common with it: d minor (d-f-a):"

  4.times do
    play (chord :c, :major)
    sleep 0.5
  end
  4.times do
    play (chord_invert (chord :d3, :minor), 2)
    sleep 0.5
  end
  4.times do
    play (chord_invert (chord :g3, :major), 1)
    sleep 0.5
  end
  4.times do
    play (chord_invert (chord :a3, :minor), 1)
    sleep 0.5
  end

  puts "---------------------------------------------------"
end

comment do
  puts "---------------------------------------------------"
  puts "I - II - V - VI"
  puts "If you use seventh chords, meaning 4 diatonic notes"
  puts "per chord it starts sound more jazzy. I am using of the"
  puts "chord_invert function to make a kind of melody in the"
  puts "top voice:"

  play (chord_invert (chord :c3, :major7), 0)
  sleep 0.5
  play (chord_invert (chord :c3, :major7), 1)
  sleep 0.5
  play (chord_invert (chord :c3, :major7), 2)
  sleep 0.5
  play (chord_invert (chord :c3, :major7), 3)
  sleep 0.5

  play (chord_invert (chord :d3, :minor7), 2)
  sleep 0.5
  play (chord_invert (chord :d3, :minor7), 3)
  sleep 0.5
  play (chord_invert (chord :d3, :minor7), 2)
  sleep 0.5
  play (chord_invert (chord :d3, :minor7), 1)
  sleep 0.5

  play (chord_invert (chord :g3, :M7), 3)
  sleep 0.5
  play (chord_invert (chord :g3, :M7), 2)
  sleep 0.5
  play (chord_invert (chord :g3, :M7), 1)
  sleep 0.5
  play (chord_invert (chord :g3, :M7), 2)
  sleep 0.5

  play (chord_invert (chord :a3, :minor7), 1)
  sleep 0.5
  play (chord_invert (chord :a3, :minor7), 2)
  sleep 0.5
  play (chord_invert (chord :a3, :minor7), 1)
  sleep 0.5
  play (chord_invert (chord :a3, :minor7), 0)
  sleep 0.5

  puts "---------------------------------------------------"
end

comment do
  puts "---------------------------------------------------"
  puts "Now you see, much can be done starting from a basic"
  puts "chord progression and replacing chords with related ones."
  puts "Here are some more very common progressions."
  puts "Let's start with the V - II progression which is often"
  puts "used for improvisation in Jazz or Funk tunes. In C Major"
  puts "this is d minor and G Major - usually as a seventh chord:"
  puts "d - f - a- c and g - h - d - f. Let's add a bass line and"
  puts "some rythmic variation."
  puts "---------------------------------------------------"
  use_bpm 120
  live_loop :base do
    use_synth :fm
    use_synth_defaults divisor: 2, depth: 1, release: 0.25
    play :d3
    sleep 0.25
    play :d3
    sleep 0.75 + 0.5
    play :d2
    sleep 0.25
    play :d2
    sleep 2.25

    play :g2
    sleep 0.25
    play :g2
    sleep 0.75 + 0.5
    play :g3
    sleep 0.25
    play :g2
    sleep 2.25
  end
  live_loop :chords do
    sleep 1
    play (chord_invert (chord :d4, :minor7), 0), release: 0.15
    sleep 1.5
    play (chord_invert (chord :d4, :minor7), 0), attack: 0, release: 0.15, amp: 0.5
    sleep 0.25
    play (chord_invert (chord :d4, :minor7), 0), attack: 0, release: 0.25, amp: 1
    sleep 1.25

    sleep 1
    play (chord_invert (chord :g3, '7'), 1), release: 0.15
    sleep 1.5
    play (chord_invert (chord :g3, '7'), 2), attack: 0, release: 0.15, amp: 0.5
    sleep 0.25
    play (chord_invert (chord :g3, '7'), 0), attack: 0, release: 0.25, amp: 1
    sleep 1.25

  end
end

comment do
  puts "Here is progression whith 5 chords each playing 1 beat long."
  puts "But each chord could also play for a half or a whole bar."
  puts "As above all chords come from C Major: III - VI - II - V - I."
  live_loop :progA do
    play (chord_invert (chord_degree 3, :c3, :major, 3), 2)
    sleep 1
    play (chord_invert (chord_degree 6, :c3, :major, 3), 1)
    sleep 1
    play (chord_invert (chord_degree 2, :c4, :major, 3), 0)
    sleep 1
    play (chord_invert (chord_degree 5, :c3, :major, 3), 1)
    sleep 1
    play (chord_invert (chord_degree 1, :c4, :major, 3), 0)
    sleep 2
  end
end

comment do
  puts "And here the same progression - but this time ending"
  puts "on the VI degree in minor. As above mentioned this is"
  puts "called a 'false cadence' because the 'true' one would"
  puts "lead to the first degree which is C Major instead of a minor."
  live_loop :progB do
    play (chord_invert (chord_degree 3, :c3, :major, 3), 2)
    sleep 1
    play (chord_invert (chord_degree 6, :c3, :major, 3), 1)
    sleep 1
    play (chord_invert (chord_degree 2, :c4, :major, 3), 0)
    sleep 1
    play (chord_invert (chord_degree 5, :c3, :major, 3), 1)
    sleep 1
    play (chord_invert (chord_degree 6, :c3, :major, 3), 1)
    sleep 2
  end
end

