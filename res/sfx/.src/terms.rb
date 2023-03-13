# Terminal Sfx
# CC-BY 4.0 License
# (c) 2023, Jost Grant

define :terminal_poweron do
  with_fx :reverb, mix: 0.5 do
    with_fx :echo, mix: 0.3, phase: 0.3 do
      with_fx :lpf, cutoff: 80 do
        # Should sound like "Time To Go!"
        play_pattern_timed [:g4, :c5, :e5], [0.2, 0.2, 0.4], release: 0.2
      end
    end
  end
end


define :terminal_poweroff do
  with_fx :reverb, mix: 0.5 do
    with_fx :echo, mix: 0.3, phase: 0.3 do
      with_fx :lpf, cutoff: 80 do
        # Should sound like "Goodbye!"
        play_pattern_timed [:c5, :g4], [0.2, 0.4], release: 0.2
      end
    end
  end
end

terminal_poweron
sleep 3
terminal_poweroff
sleep 3