Date: Wed, 18 Apr 2001 18:21:27 +0200 (MET DST)
From: Karel van Houten <K.H.C.vanHouten@research.kpn.com>
Subject: Indy and the multiple disk problem
Message-ID: <200104181621.SAA06516@sparta.research.kpn.com>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii
Content-transfer-encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
To: linux-mips@oss.sgi.com
Cc: "Houten K.H.C. van Karel" <K.H.C.vanHouten@research.kpn.com>
Message-ID: <20010418162127.OYshay8fh6dQ1Q6a22xKNDdmri5ORuLixlv43DNOAXc@z>

Hi All

I've made some observations concerning the indy multiple disk problem:

The setup:
Root FS on /dev/sda1, /local on /dev/sdb3, and some NFS mounted systems.
Kernel 2.4.2 (March 30 CVS).

Doing this:
I mke2fs-ed the sdb3 partition, mounted it at /local, and copied
a tree from an NFS filesystem to /local. No other activity on the system.
I used tar | (cd;tar) for the copy.

What happened:
I tried to 'su' in another window on the machine, and it responded
with a segfault. Several other programs reacted with segfaults or
bus errors. 

I stopped the copy, synced, and fsck-ed (-n) the local partitions.
No problems on the /local partition, but the root was badly corrupted.
Hey! That's strange, I didn't do anything on that partition!
Could it be that there is some bug in the buffer layer, that is
corrupting the buffers belonging to another FS?

Any hints?

I hope that I get the system up again tomorrow when I get to the office :(

-- 
Karel van Houten

----------------------------------------------------------
The box said "Requires Windows 95 or better."
I can't understand why it won't work on my Linux computer. 
----------------------------------------------------------
