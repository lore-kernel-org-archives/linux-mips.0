Return-Path: <owner-linux@cthulhu.engr.sgi.com>
From: Ralf Baechle <ralf@mailhost.uni-koblenz.de>
Message-ID: <199708160618.IAA20984@informatik.uni-koblenz.de>
Subject: Re: boot linux - wish
Date: Sat, 16 Aug 1997 08:18:21 +0200 (MET DST)
In-Reply-To: <33F535E0.7336423F@detroit.sgi.com> from "Eric Kimminau" at Aug 16, 97 01:08:48 am
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: owner-linux@cthulhu.engr.sgi.com
To: eak@detroit.sgi.com
Cc: miguel@nuclecu.unam.mx, adevries@engsoc.carleton.ca, ariel@sgi.com, linux@cthulhu.engr.sgi.com
Message-ID: <19970816061821.C_gOSrvXKbjGoavVXgmXoAVNcUzlXl--8uQBoOJCcQ0@z>

> Is there ever ANY chance of seeing XFS in Linux? Or a flavor of a really
> fast journaled file system?

FYI:

From owner-linux-ljfs@majordomo.ibasys.net  Wed Aug 13 00:13:50 1997
Received: from alles.intern.julia.de (root@loehnberg1.core.julia.de [194.221.49.2]) by informatik.uni-koblenz.de (8.8.6/8.6.9) with ESMTP id AAA17532 for <ralf@uni-koblenz.de>; Wed, 13 Aug 1997 00:13:33 +0200 (MEST)
Received: from smtp1.ibasys.net (smtp1.ibasys.net [207.51.79.5])
	by alles.intern.julia.de (8.8.5/8.8.5) with ESMTP id WAA17166
	for <ralf@Julia.DE>; Tue, 12 Aug 1997 22:49:47 +0200
Received: from kis.net (pop.kis.net [207.51.79.11]) by smtp1.ibasys.net (8.7.5/8.7.3) with ESMTP id KAA11443; Tue, 12 Aug 1997 10:03:51 -0400
Received: (from majordom@localhost)
	by  kis.net (8.8.6/8.8.6) id SAA20470
	for linux-ljfs-outgoing; Tue, 12 Aug 1997 18:07:49 -0400
Message-Id: <m0wyOwj-0001BkC@adam.yggdrasil.com>
Date: Tue, 12 Aug 1997 14:57:45 -0700 (PDT)
From: adam@yggdrasil.com (Adam J. Richter)
To: linux-ljfs@majordomo.ibasys.net
Subject: LINUX-LJFS: snapshot FTPable
Sender: owner-linux-ljfs@majordomo.ibasys.net
Precedence: bulk
Reply-To: linux-ljfs@majordomo.ibasys.net
Status: RO


	The Fall 1994 and Fall 1995 releases of Yggdrasil Plug & Play
Linux include development snapshots of a compressed log strucutred
filesystem for Linux.  This code is not functional.  An updated
snapshot is now FTPable from:

ftp://ftp.yggdrasil.com/private/adam/linux-2.0.30.ygg.tar.gz
ftp://ftp.yggdrasil.com/private/adam/mklogfs.c

	There is no fsck program yet.

	Again, this is just a snapshot.  The code is not yet functional,
but it is lightyears ahead of the discussions on this list and it includes
the sorts of kernel modifications necessary to implement a fast log
strucutured filesystem under the Linux kernel.  The code should be
instructuctive and should provide a good starting point for anyone
wanted to implement a log structured filesystem under Linux.

	Be warned that when I get back to hacking on this filesystem,
I intend to make some incompatible changes to the filesystem format.
In particular, it will use btrees to map logical blocks to physical
blocks and the directory structure will support something faster
than linear searches to find a file name in a directory.

Adam J. Richter     __     ______________   4880 Stevens Creek Blvd, Suite 205
adam@yggdrasil.com     \ /                  San Jose, California 95129-1034
+1 408 261-6630         | g g d r a s i l   United States of America
fax +1 408 261-6631      "Free Software For The Rest Of Us."
