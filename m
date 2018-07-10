Received: from mail-by2nam05on0709.outbound.protection.outlook.com ([IPv6:2a01:111:f400:fe52::709]:35278
        "EHLO NAM05-BY2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S23993997AbeGJRL1RhAU3 (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Tue, 10 Jul 2018 19:11:27 +0200
Date: Tue, 10 Jul 2018 10:10:40 -0700
From: Paul Burton <paul.burton@mips.com>
Subject: Re: [PATCH V2] MIPS: implement smp_cond_load_acquire() for Loongson-3
Message-ID: <20180710171040.f3gyyh524xlsqv4j@pburton-laptop>
References: <1531103198-16764-1-git-send-email-chenhc@lemote.com>
 <20180709164939.uhqsvcv4a7jlbhvp@pburton-laptop>
 <CAAhV-H7bqhz+dzgPk0_tTAN6y_k_8Ds9heF0p5uPHsHNg0v4Rg@mail.gmail.com>
 <20180710093637.GF2476@hirez.programming.kicks-ass.net>
 <20180710105437.GT2512@hirez.programming.kicks-ass.net>
 <tencent_26F8B9E004D4512B2225FCE1@qq.com>
 <20180710121727.GK2476@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180710121727.GK2476@hirez.programming.kicks-ass.net>
Return-Path: <pburton@wavecomp.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Peter Zijlstra <peterz@infradead.org>, =?utf-8?B?6ZmI5Y2O5omN?= <chenhc@lemote.com>
Cc: Ralf Baechle <ralf@linux-mips.org>, James Hogan <jhogan@kernel.org>, linux-mips <linux-mips@linux-mips.org>, Fuxin Zhang <zhangfx@lemote.com>, wuzhangjin <wuzhangjin@gmail.com>, stable <stable@vger.kernel.org>, Alan Stern <stern@rowland.harvard.edu>, Andrea Parri <andrea.parri@amarulasolutions.com>, Will Deacon <will.deacon@arm.com>, Boqun Feng <boqun.feng@gmail.com>, Nicholas Piggin <npiggin@gmail.com>, David Howells <dhowells@redhat.com>, Jade Alglave <j.alglave@ucl.ac.uk>, Luc Maranget <luc.maranget@inria.fr>, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, Akira Yokosawa <akiyks@gmail.com>, LKML <linux-kernel@vger.kernel.org>
Message-ID: <20180710171040.ETykqrIbrSLkWat6m-JhA4EzDSkahKnSURV2ckJ44Rg@z>

Hello,

On Tue, Jul 10, 2018 at 02:17:27PM +0200, Peter Zijlstra wrote:
> >  1, CPU0 set the lock to 0, then do something;
> >  2, While CPU0 is doing something, CPU1 set the flag to 1 with
> >     WRITE_ONCE(), and then wait the lock become to 1 with a READ_ONCE()
> >     loop;
> >  3, After CPU0 complete its work, it wait the flag become to 1, and if
> >     so then set the lock to 1;
> >  4, If the lock becomes to 1, CPU1 will leave the READ_ONCE() loop.
> 
> > If without SFB, everything is OK. But with SFB in step 2, a
> > READ_ONCE() loop is right after WRITE_ONCE(), which makes the flag
> > cached in SFB (so be invisible by other CPUs) for ever, then both CPU0
> > and CPU1 wait for ever.
> 
> Sure.. we all got that far. And no, this isn't the _real_ problem. This
> is a manifestation of the problem.
> 
> The problem is that your SFB is broken (per the Linux requirements). We
> require that stores will become visible. That is, they must not
> indefinitely (for whatever reason) stay in the store buffer.

For the record, my understanding is that this doesn't really comply with
the MIPS architecture either. It doesn't cover store buffers explicitly
but does cover the more general notion of caches.
