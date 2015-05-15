@┍━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┑
@│                   mystruct.s                                                │
@│ Playing with linked lists. Creating dynamically allocating etc. etc.        │
@└─────────────────────────────────────────────────────────────────────────────┘  
.DATA
node:
    .WORD 0   @ data
    .WORD 0   @ p_next
p_head: .WORD 0
p_tail: .WORD 0
cnt=10
null=0
s_fmt: .asciz "%d\n"
.TEXT
.ALIGN 2
.GLOBAL main
.FUNC main

@┍━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┑
@│ main()                                          │
@└─────────────────────────────────────────────────┘  
main:
    STMFD sp!, {r4-r12,LR}      @ Store registerst that need to be preserved including the link reg.
    
    @┍━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┑
    @│ First use local variable to create a node       │
    @└─────────────────────────────────────────────────┘  
    MOV r0, #1
    LDR r1, =node
    STR r0, [r1]

    MOV r0, #2
    STR r0, [r1,#4]
    
    @┍━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┑
    @│ Then try and create one on the heap             │
    @└─────────────────────────────────────────────────┘  
    MOV r0, #4                  @ size of block, 4 bytes
    BL  malloc                  @ create space for a new node. r0 will hold the pointer to the new block

    LDR r4, =p_head
    STR r0, [r4]                @ store the address of the new node at p_head
    MOV r2, #5
    STR r2, [r0] 

    @┍━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┑
    @│ Then a second one and link them                 │
    @└─────────────────────────────────────────────────┘  
    MOV r0, #4                  @ size of block, 4 bytes
    BL  malloc                  @ create space for a new node
    
    MOV r2, #6
    STR r2, [r0]                @ store some data in the new node
    LDR r1, [r4]                @ get the node at p_head
    STR r0, [r1, #4]            @ set p_head->p_next to the address of the new node

    @┍━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┑
    @│ Now try to create a long chain in a loop        │
    @└─────────────────────────────────────────────────┘  
    LDR r4, =p_tail
    STR r0, [r4]                @ Track the last node in p_tail 
    MOV r5, #cnt                @ loop counter

    fill_loop:
    MOV r0, #4                  @ size of block, 4 bytes
    BL  malloc                  @ create space for a new node
    STR r5, [r0]                @ store the loop index as the data

    LDR r4, =p_tail             @ Get the tail pointer
    LDR r1, [r4]                @ Get the node at the tail
    STR r0, [r1,#4]             @ Set the tail's next node to the new node.
    STR r0, [r4]                @ Update the tail pointer to point at the new node

    SUBS r5, r5, #1             @ Decrement the index by 1
    BNE fill_loop               @ Continue looping if we're not at 0
    
    LDR r0, =p_head            @ get the head pointer.

    BL printList
BAL exit                       @ return

@┍━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┑
@│ printList()                                     │
@│ desc: Loop through the list and print it.       │
@│ param: pointer to the head node.                │
@│ return: nothing                                 │
@└─────────────────────────────────────────────────┘  
printList:
    STMFD sp!, {lr}            @ Store registerst that need to be preserved including the link reg.
    MOV r1, r0                 @ prepare to call printf by putting the head node in r1
    LDR r1, [r1]               @ get the first node
    print_loop:
        LDR r0, =s_fmt         @ keep the format string in r0
        STMFD sp!, {r1}
        LDR r1, [r1]           @ get the value from the node
        BL printf              @ print the value
        LDMFD sp!, {r1}
        LDR r1, [r1,#4]        @ load the address of the next node into r1
        CMP r1, #null          @ see if next node is null
    BNE print_loop
    LDMFD sp!, {lr}            @ Restore the registers and link reg.
@ ─────────────────────────────────────────────────
MOV pc, lr                     @ return

@┍━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┑
@│ Exit                                            │
@└─────────────────────────────────────────────────┘  
exit:
    MOV r0, #0
    LDMFD sp!, {r4-r12,LR}      @ Restore the registers and link reg.
    MOV PC, LR
