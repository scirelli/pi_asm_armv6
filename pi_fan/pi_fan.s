@┍━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┑
@│ pi_fan.s                                                   │
@│	Turn pin 17 (3v) on and off based on the temperature of the Pi, reported by the command:
@│	      /opt/vc/bin/vcgencmd measure_temp
@│	This could be used to turn a fan on and off to keep the Pi cool. 
@│
@│	This program reads the stdout of 'vcgencmd measure_temp' from stdin and turns on pin 17
@│	if the temp is >= 30C
@│ 
@│ To configure the temperature at which the pin is turned on or off create a config file with a single number.
@│ That number will be read in as the max temperature. By default the program will look for a file called config.conf
@│ in the working directory. Or you can pass the file path as the first paramater.
@│ 
@│ Note:
@│ 	Do not run a fan from this pin, use a relay or mosfet from a power supply that can run
@│      the fan you want.
@│
@│ Example temp string:
@│  temp=37.9'C
@└─────────────────────────────────────────────────────────────────────────────┘
.balign 4
.fpu vfp
.data
.section	.rodata

.ALIGN 4
.TEXT

PIN_17=0                 @#define PIN_17 0
INDEX_OF_START_OF_TEMP=5 @#define INDEX_OF_START_OF_TEMP 5
MAX_TEMP=29.0            @#define MAX_TEMP 29.f

.ALIGN	2

@┍━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┑
@│ main()                                          │
@│ param(r0): length of the argv array.            │
@│ param(r1): char * argv[]                        │
@└─────────────────────────────────────────────────┘  
.GLOBAL main
.FUNC main
main:
    STMFD sp!, {r4-r12,lr}          @ Keep 8byte aligned
    MOV fp, sp

.Lmain_end:
    MOV sp, fp
 @─────────────────────────────────────────────────
    LDMFD sp!, {r4-r12,lr}
    BX lr
.ENDFUNC
