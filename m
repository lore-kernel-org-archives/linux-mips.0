Return-Path: <owner-linux@cthulhu.engr.sgi.com>
From: Ralf Baechle <ralf@mailhost.uni-koblenz.de>
Message-ID: <199710242359.BAA19922@informatik.uni-koblenz.de>
Subject: Re: Step by step, cont'd
Date: Sat, 25 Oct 1997 01:57:24 +0200 (MEST)
In-Reply-To: <34512C2B.41C6@nothingreal.com> from "Emmanuel Mogenet" at Oct 24, 97 04:15:55 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
Sender: owner-linux@cthulhu.engr.sgi.com
To: Emmanuel Mogenet <mgix@nothingreal.com>
Cc: linux@cthulhu.engr.sgi.com
Message-ID: <19971024235724.QGltz9aTfVXSX60w7n9zAZVcfWujbQrt0YTcR6t72TI@z>

> 
> Today, I tried to boot Linux on my Indy with an NFS mounted
> root. Failed again. Here's what I did:
> 
> 1. Installed the root tree on machine 192.0.2.15, in /disk4
> 2. Configured bootp on machine 192.0.2.3 so that it could inform
>    my machine that it's address is 192.0.2.2.
> 3. Rebooted my machine
> 4. Went to sash.
> 5 Typed:
> 
> scsi(0)disk(1)rdisk(0)partition(0)/vmlinux nfsroot=192.0.2.15:/disk4
> 
> So far, so good.
> 
> 5. The linux kernel booted, and said:
> 
> Root-NFS: Got BOOTP answer from 192.0.2.3, my address is 192.0.2.2
> Root-NFS: Adding default route failed!
> Root-NFS: Unable to contact server ...
> 
> 
> Anybody knows why it couldn't add a route ?
> I'm using the following kernel:
> 
> 	vmlinux-970916-efs
> 
> I'm going to try an older one.

I've you've got a working crosscompiler, try building one of the most
current ones.  The bug you're reporting is fixed in current kernels.

  Ralf
