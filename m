Date: Wed, 21 Jun 2000 22:38:42 +0100 (IST)
From: Paul Jakma <paul@clubi.ie>
Subject: RE: Problems with multiple harddisks on my Indigo2
In-Reply-To: <NAENLMKGGBDKLPONCDDOAELFCNAA.mailinglist@ichilton.co.uk>
Message-ID: <Pine.LNX.4.21.0006212234190.5050-100000@fogarty.jakma.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-linux-mips@oss.sgi.com
Return-Path: <owner-linux-mips@oss.sgi.com>
To: Ian Chilton <mailinglist@ichilton.co.uk>
Cc: spock@mgnet.de, Linux Debian MIPS <debian-mips@lists.debian.org>, Linux MIPS cthulhu <linux@cthulhu.engr.sgi.com>, Linux MIPS <linux-mips@fnet.fr>, MIPS vger <linux-mips@vger.rutgers.edu>
Message-ID: <20000621213842.AoKua-mXH-gpwvkUOB6Cn76aH0SEBvamJz0UvLw7hxA@z>

On Wed, 21 Jun 2000, Ian Chilton wrote:

> I have an SGI Indy, with 2 internal hard disks, a 4GB and a 1GB
> 
> I get the same thing!
> 
> 
> > Also I'm getting a message
> > sc1,2,0: cmd=0x12 timeout after 2 sec.  Resetting SCSI bus
> 
> I started getting this when I added the 2nd HD (1GB).
> 

fwiw, i got this too on my indy when i added a Quantum Empire 1GB.

From cold boot the PROM doesn't recognise the second disk, but IRIX
does (PROM gives me the exact same error message as the one you wrote
above - but prints it twice). If i halt back to PROM then the PROM
does see the second disk. (and only prints that error message once)

my theories are:

1. PROM controller driver is minimal and doesn't init the
controller/disks properly whereas the IRIX driver does. 

2. disk spin up times.. ??

3. Perhaps cause the outboard SCSI port is not terminated. (least not
on my indy)

> 
-- 
Paul Jakma	paul@clubi.ie
PGP5 key: http://www.clubi.ie/jakma/publickey.txt
-------------------------------------------
Fortune:
Give me a fish and I will eat today.

Teach me to fish and I will eat forever.
