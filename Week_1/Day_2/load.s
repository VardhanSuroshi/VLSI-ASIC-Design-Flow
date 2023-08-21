.section .text        # Text section where the code resides
.global load          # Declare the function "load" as global
.type load, @function # Define the type of "load" as a function

load:                 # Start of the "load" function

# Initialize a4 with the value of a0 (copy value from a0 to a4)
add a4, a0, zero

# Copy the value of a1 to a2
add a2, a0, a1

# Initialize a3 with the value of a0 (copy value from a0 to a3)
add a3, a0, zero

loop:                 # Label for the loop

# Add the value in a3 to a4 (accumulate)
add a4, a3, a4

# Increment the value in a3 by 1
addi a3, a3, 1

# Compare a3 with a2 (comparison for loop termination)
blt a3, a2, loop       # Branch to "loop" if a3 < a2

# Copy the accumulated value in a4 to a0 (result)
add a0, a4, zero

ret                    # Return from the function

