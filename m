Message-ID: <200304101937.h3AJbl211418@uhler-linux.mips.com>
Reply-To: uhler@mips.com
Subject: Re: way selection bit for multi-way cache 
In-reply-to: Your message of "Thu, 10 Apr 2003 21:24:30 +0200."
             <20030410212430.A519@linux-mips.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 10 Apr 2003 12:37:47 -0700
From: "Mike Uhler" <uhler@mips.com>
Return-Path: <uhler@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Ralf Baechle <ralf@linux-mips.org>
Cc: Mike Uhler <uhler@mips.com>, Jun Sun <jsun@mvista.com>, linux-mips@linux-mips.orguhler@mips.com
Message-ID: <20030410193747.OUwDPCES7qdkhDN2H7HBDOxH83pgjvSmE6RgTIoXS8I@z>

> On Thu, Apr 10, 2003 at 11:50:53AM -0700, Mike Uhler wrote:
> 
> > I can't comment on anything but MIPS32 and MIPS64 CPUs, but the
> > MIPS32 and MIPS64 standard is to use the bits above the index field
> > to specify the way.  See the figure entitled "Usage of Address Fields
> > to Select Index and Way" in the CACHE instruction description of the
> > MIPS32 and MIPS64 Architecture for Programmer's manuals.
> 
> The question came up between Jun and me when revising the way of handling
> multi-way caches.  There is the MIPS32 / MIPS64 way of selecting the
> cache way - but that scheme was originally already introduced by the
> R4600.  The second somewhat less common scheme is using the lowest bits
> of the address.  That was originally introduced with the R10000 but a
> few other processors such as the R5432 and the TX49 series are using it
> as well.  Unfortunately there has been way to much creativity (usually
> a positive property but ...) among designers so this posting is an
> attempt to achieve completeness.
> 
>   Ralf

Exactly why we made it a standard in MIPS32 and MIPS64.
-- 

  =*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=
  Michael Uhler, VP, Systems, Architecture, and Software Products 
  MIPS Technologies, Inc.   Email: uhler@mips.com   Pager: uhler_p@mips.com
  1225 Charleston Road      Voice:  (650)567-5025   FAX:   (650)567-5225
  Mountain View, CA 94043   Mobile: (650)868-6870   Admin: (650)567-5085
