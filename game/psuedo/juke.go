package juke

// JukeBlock represents a single juke block in Minecraft.
type JukeBlock struct {
    Identity    string
    Instrument  string
    Notation    string
    Amplitude   float32
    IsActive    bool
    RestTime    int
}

// juke.Place places a juke block with the specified identity at the location directly in front of the player.
func Place(identity string)

// juke.Instrument sets the instrument for the juke block with the specified identity to play when triggered.
func Instrument(identity string, instrument string)

// juke.Notation sets the musical notation for the juke block with the specified identity to play when triggered.
func Notation(identity string, notation string)

// juke.Amplitude sets the loudness of the note being played by the juke block with the specified identity.
func Amplitude(identity string, amplitude float32)

// juke.Trigger triggers the juke block with the specified identity to play the configured note, instrument, and timing when a signal is received via the specified pipe.
func Trigger(identity string, pipe string)

// juke.RestTime sets the rest time for the juke block with the specified identity before playing the next note.
func RestTime(identity string, restTime int)

// juke.IsActive sets the active state of the juke block with the specified identity.
func IsActive(identity string, isActive bool)

// juke.GetJukeBlock returns the JukeBlock instance representing the juke block with the specified identity.
func GetJukeBlock(identity string) *JukeBlock

// juke.Remove removes the juke block with the specified identity from the world.
func Remove(identity string)

// juke.Clear clears the configuration of the juke block with the specified identity.
func Clear(identity string)

// juke.IsActive returns whether the juke block with the specified identity is currently active.
func IsActive(identity string) bool
