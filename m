Return-Path: <owner-linux@cthulhu.engr.sgi.com>
From: olson@anchor.engr.sgi.com (Dave Olson)
Message-ID: <199904281753.KAA79893@anchor.engr.sgi.com>
Subject: Re: using ec3 on a Challenge S
In-Reply-To: <Pine.LNX.3.96.990428133838.9204B-100000@lager.engsoc.carleton.ca> from Alex deVries at "Apr 28, 99 01:42:22 pm"
Date: Wed, 28 Apr 1999 10:53:47 -0700 (PDT)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: owner-linux@cthulhu.engr.sgi.com
To: Alex deVries <adevries@engsoc.carleton.ca>
Cc: cpezzee@microsoft.com, linux@cthulhu.engr.sgi.com
Message-ID: <19990428175347.8e_fwkyiAtJIelPmwW4Cr5b70eh09lbycvL8KUQkCYo@z>

Alex deVries wrote: 
|  You should probably try to figure out where on the GIO64 that is located,
|  it shouldn't be too difficult with some guidance from folks at SGI.  What
|  ethernet controller is on there exactly?

It's basicly the same ethernet setup as the IP20 (r4k Indigo).
The driver is quite similar, but there are a few differences in
features.  The DMA is the IP20 dma (hpc1, not hpc3), but the 
ethernet chip is identical to the one on the indy/challenge S,
just some features enabled by hpc3 aren't present.

If you have an irix system, the HPC31 defines in hpc3.h provide
most of the necessary info.  On irix, it's actually shipped as
a seperate binary driver from the onboard ethernet, because of
the dma/control register differences.  It would be possible to
do it all in one driver, but we didn't bother.  The source code
for irix is the same for both, with a few ifdefs.


Dave Olson, Silicon Graphics
http://reality.sgi.com/olson   olson@sgi.com
