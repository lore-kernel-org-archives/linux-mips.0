Return-Path: <owner-linux@cthulhu.engr.sgi.com>
Date: Tue, 2 Sep 1997 17:47:13 -0400 (EDT)
From: Alex deVries <adevries@engsoc.carleton.ca>
Subject: Booting off of sdb1...
Message-ID: <Pine.LNX.3.95.970902173244.5212A-100000@lager.engsoc.carleton.ca>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-linux@cthulhu.engr.sgi.com
To: linux@cthulhu.engr.sgi.com
Message-ID: <19970902214713.Q_3_Wwrpg9ksh9WdP5KTM262QsgoWjp27hQiMZ-r5tE@z>


First off, thanks to input from Mike, I got my partition setup properly.
Here's how it's done:

In fx in IRIX, create an optional partition.  This will create one huge
partition at the beginning (sdb1), and a volume header (sdb2), which you
won't use.  It doesn't matter what type of partition you label sdb1, Linux
doesn't recognize either.  All this means is you may have to force the
type recognition when doing a mount.

From within an nfs-rooted Linux, I mke2fs'd it, and copied all the files
over from my nfsroot (esentially Ralf's root .cpio.gz).

But, here's my problem:  I've take my old kernel that boots with NFS root,
and tried to boot it using:  
vmlinux root=/dev/sdb1

The kernel starts, and it finishes off with:

Partition check:
 sda: sad1 sda2 sda3 sda4
 sdb: sdb1 sdb2 sdb3
VFS: Mounted root (ext2 filesystem) readonly.
: Can't open

And then nothing.

What am I missing?

- Alex


      Alex deVries              Success is realizing 
  System Administrator          attainable dreams.
   The EngSoc Project     
