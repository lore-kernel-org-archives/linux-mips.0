From: "Gill" <gill.robles@exterity.co.uk>
Subject: Socket problem?
Date: Sat, 22 May 2004 09:02:48 +0100
Message-ID: <000001c43fd3$2c25a350$2000a8c0@gillpc>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-Path: <gill.robles@exterity.co.uk>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org
Message-ID: <20040522080248.9WRQl2rLVyBnn9TBBbvUckWbn6Ei5ovG8eiXJEQwlS8@z>

Hi -

Has anyone come across a socket problem where the user app calls select() on
a set of sockets, which returns, indicating that data is waiting...then
subsequent recvfrom() call returns -1 indicating that there's nothing
there??

I'm using linux v2.4.2, IPv4, and the ethernet driver is pcnet32.  We're
receiving a UDP stream.

I'm trying to check for dropped packets.  /proc/net/snmp indicates a number
of UDP InErrors (~1 per second).  However, not yet sure whether this is a
consequence of the problem above, or cause of it.

Any help much appreciated!

/Gill
