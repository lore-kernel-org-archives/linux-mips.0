From: "Michael Weichselgartner" <mw@izd.de>
Subject: RaQ2+ NIC problem 2nd try
Date: Fri, 30 May 2003 19:00:28 +0200
Message-ID: <005d01c326cc$f9468c80$0300a8c0@so9>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
Return-Path: <mw@izd.de>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org
Message-ID: <20030530170028.CwLWuqhOPHXyKavhjrAWinEoPFWfaZWfarCANrkOjW4@z>

hello,

unfortunately i never got feedback to my problem allthough
i know many people have the same problem. So i will try it
again with additional information.

Used hardware: Cobalt RaQ2+, 256MB, Nevada CPU, Galileo Chipset
Used OS: Debian 3.0 Woody, Kernel 2.4.18/2.4.20/2.4.21

Problem: If i enable both nic´s network traffic stops after
a few minutes withour any error message.

No matter wether you use tulip as module or not. The higher
the kernel version the shorter the time until all networktraffic
stops. The server is still running and i can logon to the
serial console. Restarting networking solves the problem
until i connect with ssh, ftp or whatever and start to 
transfer data (even fast scrolling in midnight commander
kills the network traffic).

If load only one of the nic´s (tulip as module and only
one alias for modutils) everthing works great, fast and day
for day.

I spent weeks to locate the problem by reading the old
(original) source of the cobalttulip_raq driver (Kernel 2.0). 
But i am not able to see which patches have been merged into
the kernel 2.4.x because the entire format has changed.

The question is has someone fixed this bug?
Did the developers merge the cobalt specific changes?

I have seen a lot of information in the old drivers telling
the RaQ would not be DMA COHERENT and therefore needs
some cache flushing within the network driver. I cant
see such information in the current tulip driver (0.9.12 - 0.9.15).
Could this cause the freezing?

I realy do not know what else i can do. Any hints?

Your feedback is welcome.

Best regards

Michael
