Return-Path: <owner-linux@cthulhu.engr.sgi.com>
From: ariel@yon.engr.sgi.com (Ariel Faigon)
Message-ID: <199606181721.KAA14883@yon.engr.sgi.com>
Subject: Re: anyone know if this is true?
Date: Tue, 18 Jun 1996 10:21:17 -0700 (PDT)
In-Reply-To: <199606181711.KAA13973@anchor.engr.sgi.com> from "Dave Olson" at Jun 18, 96 10:11:49 am
Reply-To: ariel@cthulhu.engr.sgi.com
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: owner-linux@cthulhu.engr.sgi.com
To: Dave Olson <olson@anchor.engr.sgi.com>
Cc: linux@cthulhu.engr.sgi.com
Message-ID: <19960618172117.Hv5qqbJeWWuy8EoiZBlyDV0_PXUKBdZS0wv1XSViNKA@z>

>
>It's not true.  All he has to do is install eoe.hdrs and compiler_eoe.hdrs.
>
Dave, I'm afraid you're misinformed. The problem is real.
Customers cannot build anything on 6.2 even if the install the above
subsystems, unless they buy our IDO.

I said it many times, to be able to build anything on 6.2
they still miss a linker (the GNU linker is not supported in
any official GNU or Cygnus releases on any SGI and we don't include 
/usr/lib/crt[1n].o with our headers and libraries)

David Miller has a heavily patched working GNU linker that creates
Linux elf-32 binaries. He told me that it should be easy to
make it produce native IRIX binaries. As for the crt[1n].o files
I really hope they are not a problem to give away.

>That's just the *BASE* header files.
>
This is correct. From the point of view of the original complaint
Is not enough.

-- 
Peace, Ariel
