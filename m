Return-Path: <owner-linux@cthulhu.engr.sgi.com>
From: "Greg Chesson" <greg@xtp.engr.sgi.com>
Message-ID: <9811251304.ZM24036@xtp.engr.sgi.com>
Date: Wed, 25 Nov 1998 13:04:47 -0800
In-Reply-To: alan@lxorguk.ukuu.org.uk (Alan Cox)
        "Re: help offered" (Nov 25,  9:46pm)
References: <m0zimlz-0007U1C@the-village.bc.nu>
Subject: Re: help offered
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: owner-linux@cthulhu.engr.sgi.com
To: Alan Cox <alan@lxorguk.ukuu.org.uk>, ariel@cthulhu.engr.sgi.com
Cc: galibert@pobox.com, linux@cthulhu.engr.sgi.com
Message-ID: <19981125210447.P4LV2db7m9aWacWK-soBrI70mYrpEMPwXCcUqwDhJXo@z>

One definition of OS scalability that I have not seen
in general use is this:

	an OS scales to S number of processors if all S processors
	can be executing in the kernel at the same time.

An OS that scales to S active kernels can usually operate hardware
with P processors, where P > S.  A system for 1P should
be able to handle 2P with a little work.  I expect a lightweight kernel
like Linux to handle 4p with a few locks if on average only one of the
4p is in the kernel.  I'd suggest that the LInux kernel is at present
(1S, 4p) or maybe (1.5S, 4P).

g

-- 
Greg Chesson
