Subject: Re: FP emulation patch available
Date: Mon, 13 Mar 2000 13:46:19 +0000 (GMT)
In-Reply-To: <002701bf8cc6$c2ef0200$0ceca8c0@satanas.mips.com> from "Kevin D. Kissell" at Mar 13, 2000 09:33:02 AM
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <E12UVAr-0007rR-00@the-village.bc.nu>
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Sender: owner-linuxmips@oss.sgi.com
Return-Path: <owner-linuxmips@oss.sgi.com>
To: "Kevin D. Kissell" <kevink@mips.com>
Cc: Harald Koerfgen <Harald.Koerfgen@home.ivm.de>, linux-mips@vger.rutgers.edu, linux-mips@fnet.fr, Linux SGI <linux@cthulhu.engr.sgi.com>
Message-ID: <20000313134619.b2FavqGARwzCiSEK0NVsP5gUneH5jXZmfVXj751KxCk@z>

> Does anyone out there actually need/want an SMP
> version of the emulator?   It's not completely trivial,
> but it would not be all that difficult to do...

If you dont do it please add

#ifdef CONFIG_SMP
#error "Not on this emulator"
#endif

to the emu code - for the person who didnt know 8)
