Message-ID: <013a01c0b2db$749249a0$0deca8c0@Ulysses>
From: "Kevin D. Kissell" <kevink@mips.com>
References: <KEEOIBGCMINLAHMMNDJNAEHDCAAA.nop@nop.com>
Subject: Re: snow, a statically linked shared library MIPS ABI
Date: Thu, 22 Mar 2001 15:21:48 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
To: Jay Carlson <nop@nop.com>, linux-mips@oss.sgi.com, linuxce-devel@linuxce.org
Message-ID: <20010322142148.qJ3bj-h-gMLGxsujb3vxXtmuUYvsXnfKhE-MRLZeK5Y@z>

> Instead, we can build shared library images located at fixed locations
> in memory, with the location configured at library creation time.
> Stub libraries are generated that hold the absolute addresses of
> functions and data within the library image; programs (and other
> libraries) link with the stubs.

In fact, this is exactly how shared libraries worked under
UNIX System V.  It is inelegant, but economical.

            Kevin K.
