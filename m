Date: Mon, 22 Oct 2001 12:19:19 -0700
From: "H . J . Lu" <hjl@lucon.org>
Subject: Re: First attempt to install Linux on my Indigo 2
Message-ID: <20011022121919.A27925@lucon.org>
References: <20011022130659.B20721@minus-9.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20011022130659.B20721@minus-9.com>; from mat@minus-9.com on Mon, Oct 22, 2001 at 01:06:59PM +0100
Sender: owner-linux-mips@oss.sgi.com
To: Mat Withers <mat@minus-9.com>
Cc: linux-mips@oss.sgi.com
Message-ID: <20011022191919.VLU97mxTut-nMyXt4Ql_5u-G6V1ag7GmgegQ5gbEOUY@z>

On Mon, Oct 22, 2001 at 01:06:59PM +0100, Mat Withers wrote:
> Hi
> 
> I've been subscribed to the list for quite a while but am just about to try installing Linux on my Indigo2 (R4400SC / 128Mb RAM) for the first time.
> 
> I want to try H J Lu's port of Radhat 7.1. I've read the the howto at http://oss.sgi.com/mips/mips-howto.html, have set up a tftp server a bootp server an nfs server and have made up a working serial cable. Now having browsed ftp://oss.sgi.com/pub/linux/mips/redhat/7.1/ I am unsure what to do next. I assume I will need a kernel image and a root filing system to nfs mount but can't see anything resembling them on the ftp site.

1. You need to find a working kernel for your machine. I don't have
one.

2. In README:

3. install.tar.bz2 has some scripts to prepare NFS root and install
RedHat 7.1 on a hard drive.

> 
> I have a spare 4Gb scsi disk that I want to attempt the install on. I assume that once I have got the machine booted using an nfs root I can partion the hard disk - somehow install the RPMS on it and then use dvhtool to get my SGI to boot from the hard disk.
> 

From README:

3. install.tar.bz2 has some scripts to prepare NFS root and install
RedHat 7.1 on a hard drive.


H.J.
