From: Kanoj Sarcar <kanoj@google.engr.sgi.com>
Message-ID: <200008232312.QAA92824@google.engr.sgi.com>
Subject: Re: CVS Update@oss.sgi.com: linux
Date: Wed, 23 Aug 2000 16:12:58 -0700 (PDT)
In-Reply-To: <20000823125657.A1008@bacchus.dhis.org> from "Ralf Baechle" at Aug 23, 2000 12:56:57 PM
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
Return-Path: <owner-linux-mips@oss.sgi.com>
To: Ralf Baechle <ralf@oss.sgi.com>
Cc: Kanoj Sarcar <kanoj@oss.sgi.com>, linux-mips@oss.sgi.com
Message-ID: <20000823231258.3KiX0sG3PLk5acDcNQOhzQ_QPVc6Lo8onxz7rU-rwTs@z>

> 
> On Wed, Aug 23, 2000 at 10:23:50AM -0700, Kanoj Sarcar wrote:
> 
> > Log message:
> > 	Make prom_printf() functional on IP27s. And prom_printf() is not an
> > 	init function, it needs to be around during regular system usage.
> 
> On my system after the first TLB flush all PROM functions are no longer
> usable since the function pointer point to mapped space.  Similar for
> other ARC machines.
> 
>   Ralf
> 

I can see how the IP27 can have access to prom functions after init.
Not sure how arc behaves on other machines, but I guess if you really
wanted to use arc prom functions after init, you could take steps to
ensure that ...

Kanoj
