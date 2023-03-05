![](/.self/banner.webp)

>> Not Worrying About Framing; Just Spending My (Free-)Time Actually Working On Something.

Δ is an unapologetic first-pass attempt at 'my dream game'. 
A voxel survival-sandbox with a focus on automation / programming (and ultimately something that teaches outright introductory compsci and ee concepts in a fun, easy-to-understand way.).
I have no idea what I'm doing atm; Mistakes **will** be made. Things will break, early and often. Features will be shipped before they're ready -- and reimplemented without any assurance the APIs will be the same (or even close). lol
Think of it as the extended prototype-phase for "Rune: Magic Evolved"; Which I plan to start from scratch and have a lot of these concepts ironed out. 

![](/.self/screenshot.webp)
[Dev Log](https://github.com/delta-game/meta/blob/main/log/dev.md) | [Design Doc](https://github.com/delta-game/meta/blob/main/design/docs.md) | [Mind-Map](https://github.com/delta-game/meta/blob/main//mind/map.md) | [Roadmap](https://github.com/delta-game/meta/blob/main/road/map.md)

## Features

- Basic terrain generation
- Add and remove blocks.
- Move and fly.
- Multiplayer support

## How To Play

- W, S, A, D to move around.
- TAB to toggle flying mode.
- SPACE to jump.
- Left and right click to add/remove a block.
- E, R to cycle through the blocks.

---

## Setup

### Depends.
Currently, we have [three](https://git-scm.com/downloads) [external](https://go.dev/dl/) [dependencies](https://github.com/magefile/mage/releases) you need to grab / install. 
### From Source
One is intended to build & run (as well-as other misc operations) from the included Magefile. This assumes you have a static-binary of [Mage](https://magefile.org/) on your system and/or in your path, which you can call. If you have the dependencies in the last-section installed already, your platform may have support for our automatic dependency resolution using the `mage depends` command. We currently have a bias towards the Debian ecosystem here and it's the only thing that's been tested -- so thar be dragons atm. (Atm and at-minimum rn you need `xorg-dev` & `glfw3` as depedendencies on other Linux distros.)

##### Using The Magefile
###### Change directory into DELTΔ, try resolve dependencies, build the binary x run it.

`cd delta && mage depends && mage rerun`

(When in doubt, `mage help`.)

### From Binary
>> This doesn't currently exist! Build from source. Sorry. lol
Extract the release snapshot to a given directory (by default it should be `DELTΔ`) & run the `delta` executable found therein. 

---

## Credits
Thanks to [Icexin](https://github.com/icexin/gocraft) and all his work on [Gocraft](https://github.com/icexin/gocraft)! This project is a hard-fork of Gocraft and in many ways wouldn't of been possible without the basin it provided DELTΔ.
Gocraft is in-turn an implementation of / heavily inspired by [Fogleman's](https://github.com/fogleman) great [Craft](https://github.com/fogleman/Craft).





