From: "Ian Chilton" <mailinglist@ichilton.co.uk>
Subject: RE: Problems with multiple harddisks on my Indigo2
Date: Wed, 21 Jun 2000 13:43:07 +0100
Message-ID: <NAENLMKGGBDKLPONCDDOAELFCNAA.mailinglist@ichilton.co.uk>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
In-Reply-To: <20000621112343.A19912@spock>
Sender: owner-linux-mips@oss.sgi.com
Return-Path: <owner-linux-mips@oss.sgi.com>
To: spock@mgnet.de, Linux Debian MIPS <debian-mips@lists.debian.org>, Linux MIPS cthulhu <linux@cthulhu.engr.sgi.com>, Linux MIPS <linux-mips@fnet.fr>, MIPS vger <linux-mips@vger.rutgers.edu>
Message-ID: <20000621124307.iBNzkLmsVrJ8iPOi4RVlKYmTRotdEIkiVPRv9MKOh8Y@z>

Hello,

> cp: /mnt/redhat/kernel23/linux/arch/sparc/lib/COPYING.LIB: 
> Input/output error
> And dmesg shows:
> attempt to access beyond end of device
> 08:03: rw=0, want=959546428, limit=1888830
[SNIP]


I have an SGI Indy, with 2 internal hard disks, a 4GB and a 1GB

I get the same thing!


> Also I'm getting a message
> sc1,2,0: cmd=0x12 timeout after 2 sec.  Resetting SCSI bus

I started getting this when I added the 2nd HD (1GB).


Bye for Now,

Ian


                     \|||/ 
                     (o o)
 /----------------ooO-(_)-Ooo----------------\
 |  Ian Chilton                              |
 |  E-Mail :   ian@ichilton.co.uk            |
 |  IRC Nick:  GadgetMan                     |
 \-------------------------------------------/
