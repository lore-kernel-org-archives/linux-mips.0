Message-ID: <001301c066c4$d2b9f7c0$0deca8c0@Ulysses>
From: "Kevin D. Kissell" <kevink@mips.com>
References: <3A3ABFA9.8608799D@isratech.ro>
Subject: Re: Little endian.
Date: Fri, 15 Dec 2000 19:28:15 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
Return-Path: <owner-linux-mips@oss.sgi.com>
To: Nicu Popovici <octavp@isratech.ro>, linux-mips@oss.sgi.com
Message-ID: <20001215182815.2q4rS2TL08FRLH0V_kmQlSmPdqYXNi7kRoiznbXCnmI@z>

If you want to run little-endian, you need to install
the little-endian binaries and libraries.  Since I needed
to "swing both ways", I put both a big-endian root and
a little-endian root partition on my Atlas disk, with user/data 
partitions that can be mounted on either one - fortunately, 
the Ext2FS metadata seems to be consistent regardless 
of endianness.

            Kevin K.

----- Original Message ----- 
From: "Nicu Popovici" <octavp@isratech.ro>
To: <linux-mips@oss.sgi.com>
Sent: Saturday, December 16, 2000 2:04 AM
Subject: Little endian.


> Hello ,
> 
> I have the follwing problem. I setup a HardHat distribution on a mips
> machine ( an ATLAS board) and everithing runs fine in big-endian mode.
> Now I want to run the board inlittle endian mode so I took the
> linux/mipsel distribution , I did the same steps as with big-endian
> distribution. I run load tftp:/linux/mipsel/vmlinux-el.srec and it works
> fine . Then I issue the command go . root=/dev/sda1 ( I do not install
> the HardHat again ???? maybe here it is the problem ) I get the
> following error.
> ==========================================================
> VFS: Mounted root (ext2 filesystem) readonly.
> Freeing prom memory: 1020k freed
> Freeing unused kernel memory: 68k freed
> Kernel panic: No init found.  Try passing init= option to kernel.
> ==========================================================
> So please tell me where did I go wrong ?
> 
> Nicu
> 
