From: Kanoj Sarcar <kanoj@google.engr.sgi.com>
Message-ID: <200009062351.QAA14035@google.engr.sgi.com>
Subject: Re: CVS Update@oss.sgi.com: linux
Date: Wed, 6 Sep 2000 16:51:19 -0700 (PDT)
In-Reply-To: <20000907014521.A20605@bacchus.dhis.org> from "Ralf Baechle" at Sep 07, 2000 01:45:21 AM
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
Return-Path: <owner-linux-mips@oss.sgi.com>
To: Ralf Baechle <ralf@oss.sgi.com>
Cc: linux-mips@oss.sgi.com
Message-ID: <20000906235119.kNK_qsVhsBQpoazKun2oYGnjWu3oPZXdavtt1PW3_mQ@z>

> 
> On Wed, Sep 06, 2000 at 04:36:29PM -0700, Kanoj Sarcar wrote:
> 
> > 	Compile fix: flush only L2 cache.
> 
> That's wrong, sysmips(FLUSH_CACHE) is supposed to flush all caches.
> 
>   Ralf
> 

The act of flushing the L2 cache, should include flushing the L1
cache, whether done by software or processor provided primitives, 
to guarantee the inclusion principle.

Notwithstanding, feel free to add in a call to flush_cache_l1()
(and I don't know whether you want to flush the i and d caches
both, or just one), making sure there are no compile breakages.
(the breakage that I fixed was due to the fact that there is no
__flush_cache_all for mips64).

Kanoj
