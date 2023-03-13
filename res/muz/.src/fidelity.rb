# Fidelity
# CC-BY 4.0 License
# (c) 2023, Jost Grant

use_bpm 80

chords = (ring chord(:c4, :minor7), chord(:g4, :minor7), chord(:f4, :major7), chord(:a4, :minor7))

kick = :bd_haus
snare = :elec_snare

define :melody do
  notes = (ring :c5, :d5, :f5, :g5, :a5, :c6, :d6, :f6)
  durations = (ring 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 1)
  with_fx :reverb, room: 0.2 do
    with_fx :echo, mix: 0.6, phase: 0.5, decay: 4 do
      use_synth :pluck
      play_pattern_timed notes, durations, amp: 0.3, release: 0.5
    end
  end
end

live_loop :chords do
  use_synth :piano
  play_chord chords.tick, release: 4
  sleep 4
end

live_loop :percussion do
  sample kick
  sleep 1
  sample snare, amp: 0.3
  sleep 1
end

live_loop :melody do
  melody
end
