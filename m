From: "Jay Carlson" <nop@nop.com>
Subject: RE: snow, a statically linked shared library MIPS ABI
Date: Thu, 22 Mar 2001 10:28:41 -0500
Message-ID: <KEEOIBGCMINLAHMMNDJNMEHDCAAA.nop@nop.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
In-Reply-To: <013a01c0b2db$749249a0$0deca8c0@Ulysses>
Sender: owner-linux-mips@oss.sgi.com
To: "Kevin D. Kissell" <kevink@mips.com>, Jay Carlson <nop@place.org>, linux-mips@oss.sgi.com, linuxce-devel@linuxce.org
Message-ID: <20010322152841.FScZWPhUkGjjd6TC31VxCqOn2ry4M-kaouAjtlAC6gY@z>

Kevin D. Kissell [mailto:kevink@mips.com] writes:

> > Instead, we can build shared library images located at fixed locations
> > in memory, with the location configured at library creation time.
> > Stub libraries are generated that hold the absolute addresses of
> > functions and data within the library image; programs (and other
> > libraries) link with the stubs.
>
> In fact, this is exactly how shared libraries worked under
> UNIX System V.  It is inelegant, but economical.

Yeah.  I bet there are precedents back in the mainframe world too.  But my
first encounter with it was Linux a.out libraries, so it's a sign that I'm
truly a Linux Weenie that I think of it that way :-)

Jay
