Date: Tue, 20 Mar 2001 21:12:02 +0100 (MET)
From: Karel van Houten <K.H.C.vanHouten@research.kpn.com>
Subject: Re: Recommended toolchain
In-reply-to: <3AB6C948.7F8EE4B7@oz.agile.tv>
Message-ID: <200103202012.VAA07412@sparta.research.kpn.com>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii
Content-transfer-encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
To: Simon Gee <simong@oz.agile.tv>
Cc: linux-mips@oss.sgi.com
Message-ID: <20010320201202.KPyq_Ok_EBEMHSGxmhuohL1CwN59neXoKE7Sy9PEPhE@z>

Hi Simon,

You wrote:
> Recently I've been working with various version mixes of the gnu tool
> chain for a mipsel-linux target and settled on a patchy binutils
> 2.8.1/egcs 1.1.2/glibc 2.0.6 setup. However this lacks the functionality
> that I would get from a newer toolchain for use with the linux 2.4
> kernel. As a result, I was wondering if someone could recommend the
> latest "stable"/recommended toolchain for a mipsel-linux target.

Well, I'm currently using:
binutils 2.10.1
gcc 2.95.3 (with Maciej's patches)
glibc 2.2.2 (compiled with above toolchain).

This toolchain works for native compiles on my mipsel box.
One drawback: I can't compile any kernels with this setup,
For kernel compiles I use 2.8.1/egcs-2.90.27/glibc-2.0.6.

-- 
Karel van Houten
----------------------------------------------------------
The box said "Requires Windows 95 or better."
I can't understand why it won't work on my Linux computer. 
----------------------------------------------------------
