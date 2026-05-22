How to use pyo on the PocketBeagle2 with the Bela Gem cape
==========================================================

This tutorial has been tested with a Bela Gem stereo board flashed with the 
Bela image _v6.12_ following the official Bela website instructions
https://learn.bela.io/get-started-guide/bela-gem-get-started/
on May 22 2026.

Step 1 - Flash the Bela image to your SD card
---------------------------------------------

Flash the Bela image on your SD card.
You can do that with the BeagleBoard Imager software which you can get from
https://beagleboard.github.io/bb-imager-rs/bb-imager/1.0.7/install-gui.html
The imager contains the image from the link on the top of this file
so you don't need to download it.

Step 2 - Clone or download the needed repos from github
-------------------------------------------------------

If your board has an internet connection,
clone the Pyo-bela repository straight on your Bela board,
otherwise clone it in your computer first.
If you do this straight on the Bela, you can either SSH to the board with:

    ssh root@bela.local

or you can just type all these commands in the command entry at the bottom part of the window.
Clone the pyo-bela repository with:

    git clone https://github.com/alexdrymonitis/pyo-bela.git

If you clone it in your computer, copy it to your board with:

    scp -r pyo-bela/ root@bela.local:/root/Bela

The next steps assumes that the Pyo-bela repository is in /root/Bela 
and that the board is plugged to the host computer with a usb cable.

Step 3 - Install pyo wheel on the board
---------------------------------------

If your board has an internet connection, follow this step
straight in your board, otherwise go to step 4.
To download and install the latest pyo binaries on the board, run the 
script _install\_pyo\_on\_board.sh_ from pyo-bela sources (or follow
instructions on the [release page](https://github.com/alexdrymonitis/pyo-bela/releases)):

    cd pyo-bela
    ./install_pyo_on_board.sh

Step 4 - Download pyo wheel on your computer
--------------------------------------------

If your board doesn't have an internet connection
download the Bela Gem Pyo wheel from
https://github.com/alexdrymonitis/pyo-bela/releases/download/v1.0.6/pyo-1.0.6-cp311-cp311-linux_aarch64.whl

Then open the IDE in your browser or SSH into your board with:

    ssh root@bela.local

If you SSH, cd to /root/Bela.
Whether in the browser or in the terminal (if you SSHed) create a pyo/dist directory in /root/Bela with:

    mkdir pyo
    mkdir pyo/dist

Then copy the Pyo wheel from your computer to this directory with (this command must be typed from your computer, not the Bela):

    scp pyo-1.0.6-cp311-cp311-linux_aarch64.whl root@bela.local:/root/Bela/pyo/dist

Finally, in the Bela, cd to /root/Bela/pyo/dist and install the wheel with:

    python3 -m pip install --user --break-system-packages pyo-1.0.6-cp311-cp311-linux_aarch64.whl

Step 5 - Prepare the host for managing a pyo-bela project
-----------------------------------------------------------

Copy the pyo-bela/build_pyo.sh script to Bela/scripts folder and make it executable:

    cp build_pyo.sh ../scripts
    chmod +x ../scripts/build_pyo.sh

Step 6 - Compile and run a pyo-bela project
-------------------------------------------

From Bela/scripts folder, compile and run any of the examples in the 
pyo-bela/examples folder. The first argument to the build_pyo.sh script is 
the python file to execute (the project will have the same name as this file, 
without ".py"). The second argument is the path of the pyo-bela/common folder,
which contain all needed files to run a bela project.

    ./build_pyo.sh ../pyo-bela/examples/music-box.py ../pyo-bela/common

The second argument can be ommited if an environment variable called PYO_BELA_COMMON
is set to point to the location of pyo-bela/common folder.

    export PYO_BELA_COMMON=/path/to/pyo-bela/common
    ./build_pyo.sh ../pyo-bela/examples/music-box.py

Documentation
=============

For a complete description of functions that can be used to communicate 
with the pyo embedded processes, see documentation comments in the file 
common/PyoClass.cpp.

(c) 2026 - belangeo

