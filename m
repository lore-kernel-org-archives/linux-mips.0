From: Kanoj Sarcar <kanoj@google.engr.sgi.com>
Message-ID: <200009070005.RAA27824@google.engr.sgi.com>
Subject: Re: CVS Update@oss.sgi.com: linux
Date: Wed, 6 Sep 2000 17:05:18 -0700 (PDT)
In-Reply-To: <20000907020237.B20605@bacchus.dhis.org> from "Ralf Baechle" at Sep 07, 2000 02:02:37 AM
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
Return-Path: <owner-linux-mips@oss.sgi.com>
To: Ralf Baechle <ralf@oss.sgi.com>
Cc: linux-mips@oss.sgi.com
Message-ID: <20000907000518.1Q436hMx-TCwnUd_w1MOziqwvCTV9a2kTtPmxjTZiKg@z>

> 
> On Wed, Sep 06, 2000 at 04:51:19PM -0700, Kanoj Sarcar wrote:
> 
> > The act of flushing the L2 cache, should include flushing the L1
> > cache, whether done by software or processor provided primitives, 
> > to guarantee the inclusion principle.
> 
> The inclusion principle is not true for all processor types.

Which processor is supported out of the mips64 tree that does
not obey the inclusion principle?

Kanoj
