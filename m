Return-Path: <owner-linux@cthulhu.engr.sgi.com>
Message-ID: <199807170809.KAA26176@aisa.fi.muni.cz>
Subject: Mouse support in 2.1.100-2
In-Reply-To: <Pine.LNX.3.95.980717012901.5792D-100000@lager.engsoc.carleton.ca> from Alex deVries at "Jul 17, 98 01:32:29 am"
Date: Fri, 17 Jul 1998 10:09:43 +0200 (MET DST)
From: Honza Pazdziora <adelton@informatics.muni.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: owner-linux@cthulhu.engr.sgi.com
To: Alex deVries <adevries@engsoc.carleton.ca>
Cc: linux@cthulhu.engr.sgi.com
Message-ID: <19980717080943.XgiooTpgcEgmXxBIQNY8nGrxwpUirT7-VBLsFTvZXQo@z>

> > - mouse doesn't work?
> 
> In the HH install, there's a package called 'kernel-2.1.100-2'.  If you
> install this, you'll have something like /boot/vmlinux-2.1.100.  That
> kernel (2.1.100) should have mouse support in it.  you'll have to make a
> symbolic link from /dev/psaux to /dev/mouse.

I'm using the new kernel but am confused about the devices. Should I have

	psaux (10/1) and mouse -> psaux ?

Here gpm fails with

	gpm: /dev/mouse: Operation not supported by device

and the same message I get then I do cat /dev/psaux.

Or
	mouse (4/64) and psaux -> mouse ?

Here gpm starts without a problem but no running cursor on the screen.

Yours,

------------------------------------------------------------------------
 Honza Pazdziora | adelton@fi.muni.cz | http://www.fi.muni.cz/~adelton/
                   I can take or leave it if I please
------------------------------------------------------------------------
