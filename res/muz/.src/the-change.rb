# The Change
# CC-BY 4.0 License
# (c) 2023, Jost Grant

use_bpm 60

chord_prog = [chord(:F3, :minor),
              chord(:C3, :minor),
              chord(:Eb3, :major),
              chord(:Ab3, :major)].ring

melody_notes = [:F4, :C5, :Eb5, :Ab5,
                :F5, :C6, :Eb6, :Ab6]

pad_notes = (ring [ :F3, :A3, :C4, :Eb4 ],
             [ :C3, :Eb3, :G3, :Bb3 ],
             [ :Eb3, :G3, :Bb3, :C4 ],
             [ :Ab3, :C4, :Eb4, :G4 ])

kick_pattern = (ring 1, 0, 0, 0,
                1, 0, 0, 0,
                1, 0, 0, 0,
                1, 0, 0, 0)

snare_pattern = (ring 0, 0, 0, 0,
                 0, 0, 1, 0,
                 0, 0, 0, 0,
                 0, 0, 1, 0)

hihat_pattern = (ring 1, 1, 1, 1,
                 1, 1, 1, 1,
                 1, 1, 1, 1,
                 1, 1, 1, 1)

pad_amp = 0.3
pad_release = 16

noise_sweep_amp = 1
noise_sweep_release = 32

live_loop :chords do
  use_synth :dark_ambience
  play_chord chord_prog.tick, release: 16, amp: 0.8
  sleep 16
end

in_thread do
  sleep 60
  chord_prog = [chord(:F3, :minor7),
                chord(:C3, :minor),
                chord(:Eb3, :major7),
                chord(:Bb3, :major7)].ring
  sleep 30
  chord_prog = [chord(:Ab3, :major7),
                chord(:Bb3, :major7),
                chord(:C3, :minor),
                chord(:Eb3, :major)].ring
end

live_loop :melody do
  use_synth :pluck
  with_fx :reverb, room: 1 do
    play_pattern_timed melody_notes, 0.25, release: 2, amp: 0.4
  end
end

# Add variation to the melody
in_thread do
  sleep 16
  use_synth :piano
  with_fx :reverb, room: 1 do
    play_pattern_timed [:F5, :Eb5, :C5, :Ab5], 0.5, release: 4, amp: 0.6
  end
  sleep 8
  use_synth :dark_ambience
  with_fx :reverb, room: 1 do
    play_pattern_timed [:F4, :C5, :Eb5, :Ab5], 0.25, release: 2, amp: 0.5
  end
  sleep 8
  use_synth :piano
  with_fx :reverb, room: 1 do
    play_pattern_timed [:F5, :C5, :Eb5, :Ab5], 0.25, release: 2, amp: 0.6
  end
  sleep 8
  use_synth :piano
  with_fx :reverb, room: 1 do
    play_pattern_timed [:F4, :C5, :Eb5, :Ab5], [0.25, 0.25, 0.5, 0.5], release: 2, amp: 0.8
  end
  sleep 16
  use_synth :dark_ambience
  with_fx :reverb, room: 1 do
    play_pattern_timed [:F4, :Ab4, :Eb5, :C5], [0.5, 0.25, 0.25, 0.5], release: 4, amp: 0.5
  end
end

# Add additional percussion
live_loop :kick do
  sample :bd_haus if kick_pattern.tick == 1
  sleep 2
end

live_loop :snare do
  sample :sn_generic, amp: 0.4 if snare_pattern.tick == 1
  sleep 4
end

live_loop :hihat do
  sample :drum_cymbal_closed, amp: 0.3, rate: 1.2 if hihat_pattern.tick == 1
  sleep 0.5
end

# Add variation to the pads
in_thread do
  sleep 32
  pad_amp = 0.5
  pad_release = 20
  sleep 64
  pad_notes = (ring [ :F3, :A3, :C4, :Eb4 ],
               [ :C3, :Eb3, :G3, :Bb3 ],
               [ :Eb3, :G3, :Bb3, :C4, :D4, :Eb4 ],
               [ :Ab3, :C4, :Eb4, :G4, :F4, :D4 ])
  sleep 32
  pad_amp = 0.4
  pad_release = 16
end

# Add additional atmospheric sounds
live_loop :pad do
  use_synth :dark_ambience
  with_fx :reverb, room: 1 do
    play_chord pad_notes.look, amp: pad_amp, release: pad_release
  end
  sleep 16
end

live_loop :noise_sweep do
  with_fx :slicer, phase: 0.125, wave: 0 do
    with_fx :reverb, room: 1 do
      sample :ambi_dark_woosh, amp: noise_sweep_amp, release: noise_sweep_release
      sleep 32
    end
  end
end

