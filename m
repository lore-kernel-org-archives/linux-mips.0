Return-Path: <owner-linux@cthulhu.engr.sgi.com>
Message-ID: <m0yo2x5-000aOnC@the-village.bc.nu>
From: alan@lxorguk.ukuu.org.uk (Alan Cox)
Subject: Re: 5.1 installation fun & games...
Date: Mon, 22 Jun 1998 10:31:49 +0100 (BST)
In-Reply-To: <Pine.SGI.3.96.980622095548.12756A-100000@wintermute.reading.sgi.com> from "Leon Verrall" at Jun 22, 98 10:08:21 am
Content-Type: text
Sender: owner-linux@cthulhu.engr.sgi.com
To: Leon Verrall <leon@reading.sgi.com>
Cc: linux@cthulhu.engr.sgi.com
Message-ID: <19980622093149.msg0wZyw8sOhJriAyd3qXcZHLBrFiWb_7TG2WnCKYtE@z>

> Anyway, this boots the kernel, mounts the root fs and then stops with the
> message:
> 
>   Warning: unable to open an initial console

You don't have a valid "/dev" inside of /scratch/linux/installfs

Tar preserves major/minor numbers which will screw you royally across
NFS (which doesnt). 
