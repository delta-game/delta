# Amber-Lamps
# CC-BY 4.0 License
# (c) 2023, Jost Grant

use_bpm 60

chords = [chord(:C3, :minor),
          chord(:Eb3, :major),
          chord(:F3, :major),
          chord(:G3, :major)].ring

melody_notes = [:C4, :Eb4, :F4, :G4,
                :C5, :Eb5, :F5, :G5]

bass_notes = [:C2, :Eb2, :F2, :G2].ring

kick_pattern = (ring 1, 0, 0, 0,
                1, 0, 0, 0,
                1, 0, 0, 0,
                1, 0, 0, 0)

snare_pattern = (ring 0, 0, 0, 0,
                 0, 0, 0.5, 0,
                 0, 0, 0, 0,
                 0, 0, 0.5, 0)

hihat_pattern = (ring 1, 1, 1, 1,
                 1, 1, 1, 1,
                 1, 1, 1, 1,
                 1, 1, 1, 1)

pad_amp = 0.3
pad_release = 16
atmosphere_release = 30

live_loop :background do
  use_synth :dark_ambience
  play_chord chords.tick, release: pad_release, amp: pad_amp
  
  sleep 4
  
  if one_in(4)
    chords = [chord(:C3, :minor7),
              chord(:Eb3, :major7),
              chord(:F3, :maj9),
              chord(:G3, :maj9)].ring
  end
  
  if one_in(4)
    chords = [chord(:C3, :minor),
              chord(:Ab3, :major),
              chord(:F3, :major),
              chord(:G3, :major)].ring
  end
  
  use_synth :dark_ambience
  if one_in(2)
    play_pattern_timed [:C5, :Eb5, :F5, :G5], 0.5, release: 2, amp: 0.6
  elsif one_in(4)
    play_pattern_timed [:G4, :F4, :Eb4, :C4], 0.5, release: 2, amp: 0.6
  elsif one_in(4)
    play_pattern_timed [:G4, :F4, :C4, :Eb4], 0.5, release: 2, amp: 0.6
  elsif one_in(4)
    play_pattern_timed [:C4, :Eb4, :G4, :F4], 0.5, release: 2, amp: 0.6
  elsif one_in(4)
    play_pattern_timed [:G5, :F5, :Eb5, :C5], 0.5, release: 2, amp: 0.6
  elsif one_in(4)
    play_pattern_timed [:C4, :Eb4, :F4, :G4, :C5, :Eb5, :F5, :G5], [0.25, 0.25, 0.25, 0.25, 0.5, 0.5, 0.5, 0.5], release: 2, amp: 0.6
  else
    play_pattern_timed melody_notes, 0.25, release: 2, amp: 0.6
  end
  
  use_synth :fm
  if one_in(4)
    bass_notes = [:C2, :Eb2, :F2, :G2, :Ab2].ring
  elsif one_in(4)
    bass_notes = [:C2, :Eb2, :F2, :G2, :Bb2].ring
  end
  
  sleep 4
end

live_loop :kick do
  sample :bd_haus if kick_pattern.tick == 1
  sleep 1
end

live_loop :snare do
  sample :drum_snare_soft, amp: 0.3 if snare_pattern.tick == 1
  sleep 2
end

live_loop :hihat do
  sample :drum_cymbal_closed, amp: 0.3, rate: 1.2 if hihat_pattern.tick == 1
  sleep 0.5
end

