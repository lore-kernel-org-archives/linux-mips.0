Return-Path: <owner-linux@cthulhu.engr.sgi.com>
Message-ID: <199806161546.RAA28259@aisa.fi.muni.cz>
Subject: Re: RedHat 5.1 (Manhattan) ALPHA 1 for SGI/Indys
In-Reply-To: <Pine.LNX.3.95.980614004054.27426A-100000@lager.engsoc.carleton.ca> from Alex deVries at "Jun 14, 98 00:44:23 am"
Date: Tue, 16 Jun 1998 17:46:06 +0200 (MET DST)
From: Honza Pazdziora <adelton@informatics.muni.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: owner-linux@cthulhu.engr.sgi.com
To: Alex deVries <adevries@engsoc.carleton.ca>
Cc: linux@cthulhu.engr.sgi.com
Message-ID: <19980616154606.BRkAAR9Cgo6unU8hH1NwikPsyl_TK0OSG2s6BLFr6sw@z>

> 
> 6. Last, but not least
> 
> Let us know if it worked!

Great! It worked. I mean: it worked!

I've installed it from our mirror at ftp.fi.muni.cz to an old 300 MB
disk. After some fiddling with the ftp server to support tftp
correctly and after one crash with some message about signal 11
(caused by the disk, I believe) it's now installed and running.

Some comments out of my head:

The /usr/sbin/timeconfig failed in the menu -- it doesn't seem to be
present in the installfs -- shall I find and compile it?

I've set up root password in the menu but it wasn't there after
reboot -- not even /etc/passwd -- I had to boot init=/bin/bash.

I had to install gcc from RH 5.0.

Mkswap failed with segmantation fault -- shall I send the register
output? I will try to compile my own, but the machine is slow without
swap, and I need to compile ssh first to get reasonable remote access.
Once this is done, we might be able to provide ssh*.mips.rpm, if you
are interested.

It might be nice to put the notice about this 5.1 on the web, so that
people are directed to the new stuff -- even this, plain text announce
and instructions would be nice.

As I have the system on a disk, it's much happier and it starts to
look really reasonably. I will boot my machine to Linux and run the
compilations of ssh and linux-utils (for mkswap) overnight. If there
is anything I can compile/test/do to help you, please let me know.

------------------------------------------------------------------------
 Honza Pazdziora | adelton@fi.muni.cz | http://www.fi.muni.cz/~adelton/
                   I can take or leave it if I please
------------------------------------------------------------------------
