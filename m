Return-Path: <owner-linux@cthulhu.engr.sgi.com>
From: ariel@oz.engr.sgi.com (Ariel Faigon)
Message-ID: <199710110726.AAA34328@oz.engr.sgi.com>
Subject: Re: booted, what's next...
Date: Sat, 11 Oct 1997 00:26:35 -0700 (PDT)
In-Reply-To: <343E2AD9.2984F854@cadsys.com.pl> from "Maciek Dyczkowski" at Oct 10, 97 03:17:14 pm
Reply-To: ariel@cthulhu.engr.sgi.com (Ariel Faigon)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: owner-linux@cthulhu.engr.sgi.com
To: maciek@cadsys.com.pl
Cc: SGI/Linux mailing list <linux@cthulhu.engr.sgi.com>
Message-ID: <19971011072635.g-eQPfVyG9Zpw8fKHrGjclZT5pFS3pOoKuHNgIWJ_Oo@z>

:
:I was able to get my new OS running over the net. Kernel loads, NFS
:mounts root filesystem and .... this is all I can
:do. The next step should be :
:
:1. Mount your local disks.... how can I do that? How can I mount disks
:on SGI/Linux? Do I need to format my
:drive? What tools should I use?
:
:2. Download all RPMS .... done
:
:3. use command ' rpm --root=/mnt -Uvh *rpm ' ..... even I couldn't mount
:my drive I checked, whether I could use rpm
:command - it just doesn't exist in my root filesystem. Anybody has any
:experiences with installing SGI/Linux?
:
:Thank you for ANY help!
:
:--
:Maciek Dyczkowski
:
I believe that with your current setting that's what you can do.
You may mount additional remote disks via NFS but not local ones
as is.  The local disks are probably in formats that the current
snapshot of the port doesn't recognize (EFS or XFS).  Mike Shaver
was working in his spare time (he also needs to make a living :-)
on read-only EFS support.

To mount a local disk you need to go through a pretty complex
sequence that was discussed on this list before.

For a full archive of the list check-out:

	http://reality.sgi.com/ariel/linux.gz (~0.5 Mb)

We are working on a better installation and setup.

-- 
Peace, Ariel
