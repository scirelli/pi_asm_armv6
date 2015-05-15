@┍━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┑
@│                   mystruct.s                                                │
@│ Playing with linked lists. Creating dynamically allocating etc. etc.        │
@└─────────────────────────────────────────────────────────────────────────────┘  
.DATA
node:
    .WORD 0   @ data
    .WORD 0   @ p_next
nodeSz=8
p_head: .WORD 0
p_tail: .WORD 0
cnt=10
null=0
s_fmt: .asciz "%d "
s_EOL: .asciz "\n\r"
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
    MOV r0, #nodeSz             @ size of block, 8 bytes
    BL  malloc                  @ create space for a new node. r0 will hold the pointer to the new block

    LDR r4, =p_head
    STR r0, [r4]                @ store the address of the new node at p_head
    MOV r2, #5
    STR r2, [r0] 

    @┍━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┑
    @│ Then a second one and link them                 │
    @└─────────────────────────────────────────────────┘  
    MOV r0, #nodeSz             @ size of block, 8 bytes
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

    .Lfill_loop:
    MOV r0, #nodeSz             @ size of block, 4 bytes
    BL  malloc                  @ create space for a new node
    STR r5, [r0]                @ store the loop index as the data

    LDR r4, =p_tail             @ Get the tail pointer
    LDR r1, [r4]                @ Get the node at the tail
    STR r0, [r1,#4]             @ Set the tail's next node to the new node.
    STR r0, [r4]                @ Update the tail pointer to point at the new node

    SUBS r5, r5, #1             @ Decrement the index by 1
    BNE .Lfill_loop             @ Continue looping if we're not at 0
    
    LDR r0, =p_head             @ get the head pointer.
    BL printList
    LDR r0, =s_EOL              @ print a newline
    BL printf
    
    LDR r0, =p_head            @ get the head pointer.
    MOV r1, #14                @ value to append
    BL appendNode
    LDR r0, =p_head            @ get the head pointer.
    MOV r1, #15                @ value to append
    BL appendNode

    LDR r0, =p_head            @ get the head pointer.
    BL printList
    
    LDR r0, =s_EOL
    BL printf

    LDR r0, =p_head            @ test removing a node
    MOV r1, #1
    BL removeNode

    LDR r0, =p_head            @ get the head pointer.
    BL printList

    LDR r0, =s_EOL
    BL printf

    LDR r0, =p_head            @ test removing a node
    MOV r1, #5
    BL removeNode

    LDR r0, =p_head            @ get the head pointer.
    BL printList

    LDR r0, =s_EOL
    BL printf
BAL exit                       @ return


@┍━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┑
@│ removeNode()                                    │
@│ desc: Deletes the first node found with the     │
@│   passed in value.                              │
@│ param (r0): pointer to the head node.           │
@│ param (r1): Word value to find and delete.      │
@│ return: the address of the removed node.        │
@└─────────────────────────────────────────────────┘  
.global removeNode
removeNode:
    STMFD sp!, {r5, lr}        @ Store registerst that need to be preserved including the link reg.
    MOV r5, r0                 @ track the head node poniter
    LDR r0, [r0]               @ get the first node
    MOV r4, #null              @ r4 will be the previous node.
    .Lremove_loop:
        LDR   r3, [r0]         @ get the data
        CMP   r3, r1           @ compare it to the passed in value
        BEQ   .Lfound          @ If we've found it handle the find.
        LDR   r2, [r0,#4]      @ load the address of the next node into r2
        CMP   r2, #null        @ see if next node is null
        MOVNE r4, r0           @ if it's not null track the current node as the previous node.
        LDRNE r0, [r0,#4]      @ if it's not null move to the next node.
    BNE .Lremove_loop          @ and continue looping

    .LnotFound:
        MOV r0, #null              @ Didn't find it set return value to null
        BAL .Lreturn_removeNode    @ return

    .Lfound:                   @ Found it so remove the node from the list. At this point r0 is the found node. r4 is the previous node
        CMP r4, #null          @ Check if prev node is null. If it is we are at the head node
        MOVEQ r1, #null
        STREQ r1, [r5]
        BEQ .Lreturn_removeNode
                             @ ELSE
        LDR r1, [r0,#4]      @ Store next node address in r1
        STR r1, [r4,#4]      @ Set the previous node's next to the node after the one we want to delete
        STR r1, [r0,#4]      @ At this point r0 is the removed node. So zero it's next node 

    .Lreturn_removeNode:
@ ─────────────────────────────────────────────────
LDMFD sp!, {r5, pc}             @ Restore the registers and link reg. 

@┍━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┑
@│ appendNode()                                    │
@│ desc: Append a node to the list  starting from  │
@│   the head of the list.                         │
@│ param (r0): pointer to the head node.           │
@│ param (r1): Word value to append.               │
@│ return: the address of the new node.            │
@└─────────────────────────────────────────────────┘  
.global appendNode
appendNode:
    STMFD sp!, {lr}            @ Store registerst that need to be preserved including the link reg.
    LDR r0, [r0]               @ get the first node
    .Lappend_loop:
        LDR r2, [r0,#4]        @ load the address of the next node into r2
        CMP r2, #null          @ see if next node is null
        LDRNE r0, [r0,#4]      @ if it's not null move to the next node.
    BNE .Lappend_loop          @ and continue looping
    STMFD sp!, {r0,r1}         @ r0 has the address of the tail node.
    MOV r0, #nodeSz            @ size of block, 4 bytes
    BL  malloc                 @ create space for a new node. r0 holds the address of new node
    LDMFD sp!, {r1,r2}         @ restore the tail and the value to r1 and r2
    STR r2, [r0]               @ Store the node's value
    STR r0, [r1,#4]            @ set tail's next node to the new node. r0 (the return value) will have the new node
@ ─────────────────────────────────────────────────
LDMFD sp!, {pc}                @ Restore the registers and link reg. 

@┍━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┑
@│ printList()                                     │
@│ desc: Loop through the list and print it.       │
@│ param: pointer to the head node.                │
@│ return: nothing                                 │
@└─────────────────────────────────────────────────┘  
.global printList
printList:
    STMFD sp!, {lr}            @ Store registerst that need to be preserved including the link reg.
    MOV r1, r0                 @ prepare to call printf by putting the head node in r1
    LDR r1, [r1]               @ get the first node
    .Lprint_loop:
        LDR r0, =s_fmt         @ keep the format string in r0
        STMFD sp!, {r1}
        LDR r1, [r1]           @ get the value from the node
        BL printf              @ print the value
        LDMFD sp!, {r1}
        LDR r1, [r1,#4]        @ load the address of the next node into r1
        CMP r1, #null          @ see if next node is null
    BNE .Lprint_loop
@ ─────────────────────────────────────────────────
LDMFD sp!, {pc}                @ Restore the registers and link reg.

@┍━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┑
@│ Exit                                            │
@└─────────────────────────────────────────────────┘  
exit:
    MOV r0, #0
    LDMFD sp!, {r4-r12,PC}      @ Restore the registers and link reg.
