# formula1_tester
A testbench created for HW3-2019 for CENG232 - Logic Design class.  
This testbench is intended for use with lab3_2 module.

## Properties
+ Rising clocks at every 6n+3 nanoseconds
+ Falling clocks at every 6n nanoseconds
+ Checks happen at every 6n+4 nanoseconds
+ Inputs given at every 6n+1 nanoseconds, propagating to the next test

## Q: How do I use this?
First, make sure the software is in "Simulation" mode and not the "Implementation" mode.
Then,
+ Use "Add Copy Of Source" option in the left pane in Xilinx ISE, and select the testbench_formula1.v file.
Then:
+ Select the testbench_formula1 file from the left pane.
+ Click ISIM Simulator in the left pane.
    + Click "Behavioral check syntax". This is where you see if your code has syntax errors, indicated at the bottom pane.
    + If syntax check is successful, click "Simulate Behavioral Model". This should open a new window, with console outputs at the bottom, and the timing diagram at "Default.wcfg".

## Q: How do I add testcases?
Do the following:
+ (Optionally) Add a "successful test count" variable at the top (See example: ozanTests)
+ Set the inside components of the module by issuing Set 0, or Set 1 calls
+ Determine the output (by hand)
+ Test the output by an if statement
+ (Optionally) Increment your testCount variable
+ Advance the clock.
+ (Optionally) Display the fraction of correct results by using the test count variable.

__Be very cautious with timing. Errors in timing are hard to find and fix.__ 

## Q: The code does not compile, why?
Check:
+ You have named your modulename, and variables correctly, as specified in the PDF.  
+ Check your syntax again
+ If there's nothing wrong with your syntax, try to run the code in an inek machine. Some OS's, especially *Mindovz*, is known to cause problems.

If you cannot synthesize and upload your code to the FPGA, check if you have the correct settings.
In Implementation mode,
Go to Board232.v file on the left, right click "Generate Programming File" option. Click "Process Properties". Then, on "Startup Options", change your FPGA Startup Clock variable to JTAG Clock. Apply, and try to compile again.

If you have static arrays, and they stay constant throughout, they are stripped out by the synthesizer. Do not write your solutions based on static arrays and such.

## Q: Why isn't my Xilinx ISE installation working?
Answer: Probably nobody knows. This software is... bizarre.
