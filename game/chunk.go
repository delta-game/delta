package main

import (
	"log"
	"math"
	"sync"

	"github.com/go-gl/mathgl/mgl32"
)

const (
	ChunkWidth = 32 // Width of the chunk in blocks.
)

// Vec3 represents a 3-dimensional vector.
type Vec3 struct {
	X, Y, Z int
}

func (v Vec3) Left() Vec3 {
	return Vec3{v.X - 1, v.Y, v.Z}
}
func (v Vec3) Right() Vec3 {
	return Vec3{v.X + 1, v.Y, v.Z}
}
func (v Vec3) Up() Vec3 {
	return Vec3{v.X, v.Y + 1, v.Z}
}
func (v Vec3) Down() Vec3 {
	return Vec3{v.X, v.Y - 1, v.Z}
}
func (v Vec3) Front() Vec3 {
	return Vec3{v.X, v.Y, v.Z + 1}
}
func (v Vec3) Back() Vec3 {
	return Vec3{v.X, v.Y, v.Z - 1}
}
func (v Vec3) Chunkid() Vec3 {
	return Vec3{
		int(math.Floor(float64(v.X) / ChunkWidth)),
		0,
		int(math.Floor(float64(v.Z) / ChunkWidth)),
	}
}

// NearBlock returns the vector as an integer that is nearest to the given floating-point position.
func NearBlock(pos mgl32.Vec3) Vec3 {
	return Vec3{
		int(round(pos.X())),
		int(round(pos.Y())),
		int(round(pos.Z())),
	}
}

// Chunk represents a single chunk of blocks in the game world.
type Chunk struct {
	id     Vec3	  // ID of the given chunk.
	blocks sync.Map   // TODO
}

// NewChunk creates and returns a new Chunk with the given ID.
func NewChunk(id Vec3) *Chunk {
	c := &Chunk{
		id: id,
	}
	return c
}

// Returns the ID of the chunk.
func (c *Chunk) Id() Vec3 {
	return c.id
}

func (c *Chunk) Block(id Vec3) int {
	if id.Chunkid() != c.id {
		log.Panicf("id %v chunk %v", id, c.id)
	}
	w, ok := c.blocks.Load(id)
	if ok {
		return w.(int)
	}
	return 0
}

func (c *Chunk) add(id Vec3, w int) {
	if id.Chunkid() != c.id {
		log.Panicf("id %v chunk %v", id, c.id)
	}
	c.blocks.Store(id, w)
}

func (c *Chunk) del(id Vec3) {
	if id.Chunkid() != c.id {
		log.Panicf("id %v chunk %v", id, c.id)
	}
	c.blocks.Delete(id)
}

func (c *Chunk) RangeBlocks(f func(id Vec3, w int)) {
	c.blocks.Range(func(key, value interface{}) bool {
		f(key.(Vec3), value.(int))
		return true
	})
}
