Subject: Re: [linux-fbdev] SGI VW 540, fbdev and pot pourii of faults and
Date: Sun, 13 Aug 2000 16:10:31 +0100 (BST)
In-Reply-To: <Pine.SGI.4.10.10008091908170.26870-100000@tigger.ccs.ornl.gov> from "philloc@tigger.ccs.ornl.gov" at Aug 09, 2000 07:28:07 PM
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <E13NzPH-0001bK-00@the-village.bc.nu>
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Sender: owner-linux-mips@oss.sgi.com
Return-Path: <owner-linux-mips@oss.sgi.com>
To: i15@ornl.gov
Cc: James Simmons <jsimmons@acsu.buffalo.edu>, linux-fbdev@vuser.vu.union.edu, linux@cthulhu.engr.sgi.com
Message-ID: <20000813151031.uMCVdukbp6dge4oAsGm5nk_Vm-fUPPvQvHV2ZSE9Fwc@z>

> 	Anyone from SGI care to comment on why SGI has not released the
> specs to reasonable attention, since they are unable to help port? 

Try getting the sources for the 3d driver and graphics components on their
current workstation.

> 	Hey as an aside, anyone know how to "uncompress" a "vmlinuz"
> kernel to a "vmlinux"? SGI had posted a kernel or 2 , but always in the
> "vmlinuz" format. To the best of my knowledge cannot be booted
> on the VW 540.

gzip -d <vmlinuz >vmlinux should be fine.
