Message-ID: <001a01bfb349$59f95440$0ceca8c0@satanas.mips.com>
From: "Kevin D. Kissell" <kevink@mips.com>
Subject: Re: VC exceptions
Date: Mon, 1 May 2000 10:43:34 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-linuxmips@oss.sgi.com
Return-Path: <owner-linuxmips@oss.sgi.com>
To: Ralf Baechle <ralf@oss.sgi.com>
Cc: Florian Lohoff <flo@rfc822.org>, linux@cthulhu.engr.sgi.com
Message-ID: <20000501084334.NeHNDa8yUOBf7xpTv-BaI-xuMttxp6x63yFuVWymLHc@z>

>> >Apropriate placement of mappings in the address space isn't always possible.
>> >MAP_FIXED is one example.  Aliases in the page cache are harder to handle.
>> >If one of the page cache mappings is writable then readers may even observe
>> >stale data or in worst  case stale data being written to disk.
>>
>> mmap() is allowed to fail.  I would think that,  if someone tries to force an
>> unsafe mapping, one should give them EINVAL if one doesn't want to deal
>> with the special case otherwise, or create a copy-on-write clone in a safe
>> physical page if one wants to be extra-specially nice...
>
>I'm only worried because I don't know how much software such a change
>would break.

But it's already broken - it just doesn't know it.  The difference is that
now the software will fail in a systematic and recoverable way, whereas
before it would simply be randomly corrupt.  I agree that it's regrettable,
but the job of the OS (IMHO) is to provide a known-reliable access
to the underlying hardware, and to refuse accesses that compromise
the integrity of the system and the application.

>IRIX uses something they call page ownership switching.  Essentially they
>ensure that only mappings of one colour are accessible at any time.
>Accessing a page's mapping of a different colour will make the mm flush
>caches, make the old colour inaccessible and the new colour accessible
>in the page tables.  That requires a reverse mapping of physical to virtual
>addresses, something that Linus so far has always refused to accept.

Just what has he refused to accept, and what was his rationale?

            Kevin K.
