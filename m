content-class: urn:content-classes:message
Subject: Linux booting on malta board
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
Date: Tue, 17 Feb 2004 20:26:21 +0530
Message-ID: <9A45247F1AEBB94189B16E7083981F930588A9@INDIAEXCH.gmi.domain>
From: "Nilanjan Roychowdhury" <nilanjan@genesis-microchip.com>
Return-Path: <nilanjan@genesis-microchip.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org
Message-ID: <20040217145621.6lShimtI2DfM2M50NaxXhqgfIONSHASTZvKAYPc0GpE@z>





I have a MIPS based malta board. For this board I also have two LINUX  images. One the non real time flavor obtained from MIPS technologies and other is a small footprint embedded image from monta vista.

I have first booted the board with the monitor program and then tried to download the linux images from my linux host using NFS + TFTP.
Now I am able to load the images but when I say go in the monitor prompt...it shows me a message like "LINUX started" in my mincom screen @ host ;also the LED on the board shows "LINUX" but after that the board just hangs. ( it does not respond to any ping ).
The same problem occurs with both the non real time as well as the image from monta vista.


Have you ever faced any such issues??? Any first hand comments???
Regards
Nilanjan
