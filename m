Date: Tue, 19 Feb 2002 10:27:52 -0500 (EST)
From: Stephen L Moshier <steve@moshier.net>
Reply-To: steve@moshier.net
Subject: Re: endless loop in remainder() on mips
Message-ID: <Pine.LNX.4.44.0202191023460.26177-100000@moshier.net>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-linux-mips@oss.sgi.com
To: Zhang Fuxin <fxzhang@ict.ac.cn>
Cc: linux-mips@oss.sgi.com, libc-alpha@sources.redhat.com
Message-ID: <20020219152752.wbI8mLqdOiCdmOsRtZIpAV7Jwwy5Cya16yKfB3YSuag@z>


> t-remainder.c

This code does not look like the current version of
  sysdeps/ieee754/dbl-64/e_remainder.c

IBM fixed the bug, and I thought there was acknowledgment
here that the fix worked on a MIPS.  The change was installed
December 5, 2001 and it seems to be in glibc-2.2.5.
