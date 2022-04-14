## Title: Hyposprays

### Description:

Gives Medical personnel hyposprays. They are devices that can spray or inject the contents of a removable, refillable vial into/onto a patient. The CMO has a unique hypospray with larger vials and quicker injection times.

### TG Changes:

- CMO's locker now contains a new object, the CMO's Hypospray Kit. The /tg/ standard hypospray has been removed from the CMO's locker, though remains in code.

### Defines:

- #define HYPO_SPRAY 0
- #define HYPO_INJECT 1
- #define WAIT_SPRAY 25
- #define WAIT_INJECT 25
- #define SELF_SPRAY 15
- #define SELF_INJECT 15
- #define DELUXE_WAIT_SPRAY 0
- #define DELUXE_WAIT_INJECT 5
- #define DELUXE_SELF_SPRAY 10
- #define DELUXE_SELF_INJECT 10
- #define COMBAT_WAIT_SPRAY 0
- #define COMBAT_WAIT_INJECT 0
- #define COMBAT_SELF_SPRAY 0
- #define COMBAT_SELF_INJECT 0

### Included files that are not contained in this module:

- code/game/objects/structures/crates_locker/closets/secure/medical.dm
- code/modules/vending/medical.dm
- code/modules/reagents/chemistry/machinery/chem_master.dm
- code/modules/plumbing/plumbers/pill_press.dm
- code/modules/research/designs/autolathe_designs.dm

### Credits:

Skyrat - Code ported from here
