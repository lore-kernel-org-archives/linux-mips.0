Message-ID: <002801bfb2e9$d0bec2f0$0ceca8c0@satanas.mips.com>
From: "Kevin D. Kissell" <kevink@mips.com>
Subject: Re: VC exceptions
Date: Sun, 30 Apr 2000 23:19:41 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-linuxmips@oss.sgi.com
Return-Path: <owner-linuxmips@oss.sgi.com>
To: Ralf Baechle <ralf@oss.sgi.com>
Cc: Florian Lohoff <flo@rfc822.org>, linux@cthulhu.engr.sgi.com
Message-ID: <20000430211941.dOj0C_-V1hM1NVszEZCaMRRIbYY7X-34th9mUaseV28@z>

On Saturday, April 29, 2000 at 11:57PM, Ralf Baechle wrote:

>On Thu, Apr 27, 2000 at 08:12:14PM +0200, Kevin D. Kissell wrote:
>
>> It's a thing that can happen whenever caches are
>> virtually indexed (for speed) but physically tagged
>> (for correctness), and caches get large enough for
>> the algorithm to be wrong once in a while.  They can
>> be avoided with a little thought and overhead in the
>> assignment of physical pages to virtual addresses.
>> Gimme a day or so to look at the code, and I'll propose
>> a fix for Linux...

Sadly, I've been handed a more urgent (and more to the
point, paid) assignment, and won't be able to do anything
about this a quickly as I would like.  I note that you've posted
a patch, Ralf, so one can hope that it will deal with Florian's
problem.

>Apropriate placement of mappings in the address space isn't always possible.
>MAP_FIXED is one example.  Aliases in the page cache are harder to handle. 
>If one of the page cache mappings is writable then readers may even observe 
>stale data or in worst  case stale data being written to disk.

mmap() is allowed to fail.  I would think that,  if someone tries to force an 
unsafe mapping, one should give them EINVAL if one doesn't want to deal 
with the special case otherwise, or create a copy-on-write clone in a safe
physical page if one wants to be extra-specially nice...

            Kevin K.
