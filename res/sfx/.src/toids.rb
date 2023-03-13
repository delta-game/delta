# Toid Sfx
# CC-BY 4.0 License
# (c) 2023, Jost Grant

use_bpm 120

define :toid_error do
  with_fx :reverb, mix: 0.7 do
    with_fx :echo, mix: 0.5, phase: 0.5 do
      with_fx :hpf, cutoff: 30 do
        with_fx :slicer, phase: 0.25, mix: 0.5 do
          with_fx :hpf, cutoff: 20 do
            # Generate the sound by playing a high-pitched noise
            play_pattern_timed [:c7], [0.5], release: 0.1
          end
        end
      end
    end
  end
end


define :toid_accepted do
  with_fx :reverb, mix: 0.5 do
    with_fx :bitcrusher, bits: 8 do
      with_fx :lpf, cutoff: 100 do
        play_pattern_timed [:c5, :g5, :c6], [0.05, 0.05, 0.2], release: 0.1
      end
    end
  end
end

define :toid_happy do
  with_fx :reverb, mix: 0.6 do
    with_fx :distortion, mix: 0.5 do
      with_fx :lpf, cutoff: 80 do
        play_pattern_timed chord(:g4, :major), [0.2, 0.2, 0.3], release: 0.2
      end
    end
  end
end


toid_error
sleep 3
toid_accepted
sleep 3
toid_happy
sleep 3
