Date: Fri, 15 Jun 2001 14:41:30 -0500 (CDT)
From: Steve Langasek <vorlon@netexpress.net>
Subject: Re: First version of sid-based root-tarball for mipsel available
In-Reply-To: <20010615200828.A19897@linuxtag.org>
Message-ID: <Pine.LNX.4.30.0106151412040.1744-100000@tennyson.netexpress.net>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-linux-mips@oss.sgi.com
To: linux-mips@oss.sgi.com
Cc: debian-mips@lists.debian.org
Message-ID: <20010615194130.8jOYGN6sgk7jRJ-CEZxH65IcIAzIFHUlF21_B-HV9hI@z>

Hi Karsten,

On Fri, 15 Jun 2001, Karsten Merker wrote:

> Hallo everyone,

> I have put together a first version of a root-tarball for mipsel based on
> Debian "Sid". This is mostly untested yet and due to the SYSMIPS-problem
> it works only on R4K and higher. If somebody wants to try it out, please
> let me know the results.

> The tarball can be found at
> ftp://bolugftp.uni-bonn.de/pub/mipsel-linux/rootfs/experimental/debian-mipsel-rootfs-20010615.tar.bz2

I'd be interested to give this a try, if only I could get a recent Linux
kernel booting on my system. :)  My Cobalt CacheRaq has so far resisted all of
my efforts to get 2.4 booting; it finds the kernel I've compiled, gets as far
as starting to load the filesystems, but then goes into a loop reporting
problems with 'spurious interrupts'.  So either I'm running the wrong patch
against the 2.4.0 sources, or the CacheRaq is not yet well-supported under
2.4.

Karsten, what type of system are you doing your mipsel testing/development on?

Regards,
Steve Langasek
postmodern programmer
