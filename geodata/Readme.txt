##############################################
GEODATA COMPENDIUM
##############################################

Comprehensive guide for geodata.

How to configure it
    a - Prerequisites
    b - Make it work

This file is based on the geodata instructions from L2J Mobius.

##############################################
How to configure it
##############################################

----------------------------------------------
a - Prerequisites
----------------------------------------------

* A 64bits Windows/Java JDK is a must-have to run server with geodata. Linux servers don't have the issue.
* The server can start (hardly) with -Xmx3000m. -Xmx4g is recommended.

----------------------------------------------
b - Make it work
----------------------------------------------

To make geodata work:
* unpack your geodata files into "/release/{RELEASE_ID}/game/data/geodata" folder

Share geodata between releases (recommended for l2j-deployment):
* unpack your geodata files into "/geodata" and create a symlink from "/current/game/data/geodata" to the former