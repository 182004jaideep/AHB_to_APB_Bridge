
# run.tcl - Script to automate simulation in Vivado

# Set the simulation project name
set proj_name "ahb_apb_sim"

# Clean up previous runs
file delete -force $proj_name

# Create project
create_project $proj_name . -part xc7a35tcpg236-1 -force

# Add RTL files
add_files [glob ./rtl/*.v]

# Add testbench
add_files -tb ./tb/tb.v

# Set top module
set_property top tb [current_fileset]

# Launch simulation
launch_simulation

# Run simulation for 5000 ns
run 5000ns

# Open waveform window
open_wave_config

# Add signals to waveform
add_wave *

# Run again to populate waveform
run 5000ns
