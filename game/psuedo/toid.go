package toid

import (
	"math/rand"
	"time"
)

// Toid represents a programmable turtle in the voxel sandbox game.
type Toid struct {
	ID   int
	Fuel int
	X    int
	Y    int
	Z    int
	// Add any other fields you need for your toids.
}

var existingIDs []int

// NewToid creates a new toid with a unique ID.
func NewToid() *Toid {
	// Use current time in nanoseconds as a seed for the random number generator.
	rand.Seed(time.Now().UnixNano())

	// Generate a random integer between 0 and 999999 for the ID.
	var id int
	for {
		id = rand.Intn(1000000)
		if !idExists(id) {
			break
		}
	}

	existingIDs = append(existingIDs, id)

	return &Toid{
		ID:   id,
		Fuel: 100, // Set initial fuel level to 100.
		// Set initial coordinates to (0, 0, 0).
		X: 0,
		Y: 0,
		Z: 0,
	}
}

// idExists checks if an ID already exists in the slice of existing IDs.
func idExists(id int) bool {
	for _, existingID := range existingIDs {
		if existingID == id {
			return true
		}
	}
	return false
}

// toid.moveForward moves the toid forward by a certain distance in the direction it's facing.
func (t *Toid) moveForward(id int, distance int)

// toid.moveBack moves the toid back by a certain distance in the opposite direction of where it's facing.
func (t *Toid) moveBack(id int, distance int)

// toid.moveLeft moves the toid left by a certain distance in the direction it's facing.
func (t *Toid) moveLeft(id int, distance int)

// toid.moveRight moves the toid right by a certain distance in the direction it's facing.
func (t *Toid) moveRight(id int, distance int)

// toid.turnLeft turns the toid 90 degrees to the left.
func (t *Toid) turnLeft(id int)

// toid.turnRight turns the toid 90 degrees to the right.
func (t *Toid) turnRight(id int)

// toid.turnAround turns the toid 180 degrees.
func (t *Toid) turnAround(id int)

// toid.setCords sets the toid's to move to the specified (x, y, z) coordinates.
func (t *Toid) setCords(id int, x, y, z int)

// toid.getCords returns all of the toid's current coordinates.
func (t *Toid) getCords(id int) (int, int, int)

// toid.xcord returns the toid's current x coordinate.
func (t *Toid) xcord(id int) int

// toid.ycord returns the toid's current y coordinate.
func (t *Toid) ycord(id int) int

// toid.zcord returns the toid's current z coordinate.
func (t *Toid) zcord(id int) int

// toid.headHome makes the toid start returning home. This is a user-specified space, that's typically a charging
// dock. If nothing is set, it tries to get to the DELTA -- non-destructively. As-in it won't break things to get
// there. And should stop within a certain radius.
func (t *Toid) headHome(id int)

// toid.refuel refuels the toid with any available fuel items in its inventory.
func (t *Toid) refuel(id int)

// toid.getFuelLevel returns the toid's current fuel level.
func (t *Toid) getFuelLevel(id int) int

// toid.sendMessage sends a message to the chat.
func (t *Toid) sendMessage(id int, msg string)

// toid.detectBlock returns the type of the block the toid is facing.
func (t *Toid) detectBlock(id int) string

// toid.blockPlace places a block in the world.
func (t *Toid) blockPlace(id int)

// toid.blockPath adds a 'path' one diagonally (one block down and one-block forward) of where you're facing.
// Useful to build bridges.
func (t *Toid) blockPath(id int)

// toid.itemDump dumps all items in the toid's inventory.
func (t *Toid) itemDump(id int)

// toid.itemInfo returns the current selected item in the toid's inventory. Including the amount.
func (t *Toid) itemInfo(id int) string

// toid.itemSelect selects the inventory slot with the specified number.
func (t *Toid) itemSelect(id int, slot_number int)

// toid.inventorySpace returns the amount of space available for the specified item in the toid's inventory.
func (t *Toid) inventorySpace(id int, item_name string) int
