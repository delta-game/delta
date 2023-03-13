package main

import (
	"io"
	"os"

	"github.com/hajimehoshi/go-mp3"
	"github.com/hajimehoshi/oto"
)

// PlayBackgroundMusic plays an MP3 file as background music.
// Note: This function currently does not loop the file.
// To add looping logic, look into if there's a Seek function
// and places where the decoder is reset to the beginning of
// the file ... because you don't want to a new allocation
// each time you end up looping. Especially as OST grows.
func PlayBackgroundMusic(filename string) error {
	// Load MP3 file
	file, err := os.Open(filename)
	if err != nil {
		return err
	}
	defer file.Close()

	decoder, err := mp3.NewDecoder(file)
	if err != nil {
		return err
	}

	// Initialize oto player
	context, err := oto.NewContext(decoder.SampleRate(), 2, 2, 8192)
	if err != nil {
		return err
	}

	player := context.NewPlayer()
	defer player.Close()

	// Play music
	_, err = io.Copy(player, decoder)
	if err != nil {
		return err
	}

	return nil
}
