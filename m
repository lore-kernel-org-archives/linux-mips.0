Subject: Re: math broken on mips
References: <Pine.LNX.4.44.0202181603470.25667-100000@moshier.net>
Reply-To: drepper@redhat.com (Ulrich Drepper)
From: Ulrich Drepper <drepper@redhat.com>
Date: 18 Feb 2002 13:39:04 -0800
In-Reply-To: <Pine.LNX.4.44.0202181603470.25667-100000@moshier.net>
Message-ID: <m3it8ua2rr.fsf@myware.mynet>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: owner-linux-mips@oss.sgi.com
To: moshier@moshier.net
Cc: Geoff Keating <geoffk@redhat.com>, fxzhang@ict.ac.cn, linux-mips@oss.sgi.com, libc-alpha@sources.redhat.com
Message-ID: <20020218213904.5cHqr9Dd06KSoMMOfyE2TA6-z0u3EACKOjAbX1DryBE@z>

Stephen L Moshier <moshier@moshier.net> writes:

> Does the glibc documentation define it?

No version of any math library reliably worked with anything but
round-to-nearest.  Only functions which were implemented using integer
operations were immune and this set varied among different platforms.
It's not written down but was always said.  If somebody wants to add
it to the documentation s/he can write something up.

-- 
---------------.                          ,-.   1325 Chesapeake Terrace
Ulrich Drepper  \    ,-------------------'   \  Sunnyvale, CA 94089 USA
Red Hat          `--' drepper at redhat.com   `------------------------
