From: "Gill" <gill.robles@exterity.co.uk>
Subject: Char device driver problem
Date: Fri, 30 Jan 2004 15:07:07 -0000
Message-ID: <000b01c3e742$ba513d90$2000a8c0@gillpc>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-Path: <gill.robles@exterity.co.uk>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org
Message-ID: <20040130150707.n95LWDeLg2ZpjAtUCPxzYCRPwFllumByNW5-vEvZgL0@z>

I'm currently writing a char device driver, and I've seen some unexpected
behaviour, which someone may be able to explain.

 
I have some test code which simply opens my device and makes an ioctl call.
Initially, the device's "open" function did nothing, and the ioctl call:

o Performed initialisation

o Called function to produce a test tone.

This worked as expected, and generated the test tone.  However, I then moved
the initialisation code into the open function.  This time, when the user
opens the device and makes the ioctl call, no test tone is generated,
although the function returns with a success code.

Does anyone know why moving code in this way should change the behaviour?
The initialisation code does not create any tasks, and calls to the device
driver are blocking.  I've even tried using copy_to_user, and copy_from_user
to ensure that arguments are passed correctly, although this doesn't make
any discernable difference.  The only difference I can see is that I do
additional context switches...

Any help/suggestions would be much appreciated!

 
Gill

 

 
