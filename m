Date: Fri, 9 Jun 2000 10:31:05 -0300
From: "J. Scott Kasten" <jsk@tetracon-eng.net>
Subject: Re: Linux on Indy
In-Reply-To: <NAENLMKGGBDKLPONCDDOGEBOCMAA.mailinglist@ichilton.co.uk>
Message-ID: <Pine.SGI.4.10.10006091025370.1120-100000@thor.tetracon-eng.net>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-linux-mips@oss.sgi.com
Return-Path: <owner-linux-mips@oss.sgi.com>
To: Ian Chilton <mailinglist@ichilton.co.uk>
Cc: Linux-MIPS Mailing List <linux-mips@oss.sgi.com>
Message-ID: <20000609133105.9R_RWkK_hsOJUAffsw334xYadMCzUTaHZDCj0e9bxTw@z>


Let's try and keep this discussion on the list as I'm going to be trying
the same thing in a few weeks.

From what I have observed, the 5.1 tarball has under the mipseb directory
a minimal root file system with etc, sbin, lib, etc. in addition to the
RedHat/RPMS directory.  I suspect that you will need to get that minimal
root file system mounted, and then use that to run the install and explode
the RPMS to the disk.  I'm further going to speculate that you will
probably netboot the thing the first time and do an NFS mounted root to
make that happen.  But again, this is pure speculation...

-S-

--

J. Scott Kasten
Email: jsk AT tetracon-eng DOT net

"The only future you have is the one
 you choose to make for yourself..."

On Fri, 9 Jun 2000, Ian Chilton wrote:

> Hello,
> 
> OK...I now have a 2nd disk in my Indy. I have read the MIPS/HOWTO, the
> SGI/Linux mini-HOWTO (by: Raju) and the Hard Hat 5.1 installation
> instructions, but I still haven't got a clue how to do this....
> 
> I have an SGI Indy running Irix 6.5.8m (now with a 2nd hard disk).
> I also have a PC running Win98 and another running SuSE Linux.
> 
> I have got the hardhat-sgi-5.1tar.gz file...can't I just copy this to the
> Indy while running IRIX, and unpack from there?
> 
> Please could someone explain how I do this?
> (incl partitioning this new disk for Linux...I ran fx, but didn't have a
> clue how to use it...)
> 
> 
> Thanks!
> 
> 
> Bye for Now,
> 
> Ian
> 
> 
>                      \|||/
>                      (o o)
>  /----------------ooO-(_)-Ooo----------------\
>  |  Ian Chilton                              |
>  |  E-Mail : ian@ichilton.co.uk              |
>  \-------------------------------------------/
> 
> 
