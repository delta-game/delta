# For Whom
# CC-BY 4.0 License
# (c) 2023, Jost Grant

use_bpm 60

live_loop :drone do
  with_fx :reverb, room: 0.9, mix: 0.7 do
    with_fx :slicer, phase: 0.25, wave: 0 do
      with_fx :lpf, cutoff: 60 do
        synth :dsaw, note: :C3, sustain: 16, release: 0, amp: 1.5
      end
    end
  end
  sleep 16
end

live_loop :melody do
  use_synth :piano
  with_fx :reverb, room: 0.9, mix: 0.5 do
    with_fx :distortion, mix: 0.3, distort: 0.5 do
      play_pattern_timed [:C4, :Eb4, :G4, :Bb4], [4, 4, 4, 4], release: 3, amp: 0.6
    end
  end
  sleep 16
end

live_loop :bass do
  use_synth :fm
  with_fx :reverb, room: 0.8, mix: 0.6 do
    play :C2, attack: 2, release: 8, amp: 0.5
  end
  sleep 8
end

live_loop :percussion do
  with_fx :reverb, room: 0.6, mix: 0.4 do
    sample :perc_bell, rate: 0.8, amp: 0.3
  end
  sleep 4
end
