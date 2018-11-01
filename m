Received: from mail-eopbgr810137.outbound.protection.outlook.com ([40.107.81.137]:11712
        "EHLO NAM01-BY2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S23991066AbeKARywOIdfQ convert rfc822-to-8bit (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 1 Nov 2018 18:54:52 +0100
From: Paul Burton <paul.burton@mips.com>
Subject: Re: [RFC PATCH] lib: Introduce generic __cmpxchg_u64() and use it
 where needed
Date: Thu, 1 Nov 2018 17:54:50 +0000
Message-ID: <20181101175448.sld6krwbs5n7ovak@pburton-laptop>
References: <1541015538-11382-1-git-send-email-linux@roeck-us.net>
 <20181031213240.zhh7dfcm47ucuyfl@pburton-laptop>
 <20181031220253.GA15505@roeck-us.net>
 <20181031233235.qbedw3pinxcuk7me@pburton-laptop>
 <4e2438a23d2edf03368950a72ec058d1d299c32e.camel@hammerspace.com>
In-Reply-To: <4e2438a23d2edf03368950a72ec058d1d299c32e.camel@hammerspace.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <CF3B98CF3394B54E933F2B98E3776DB7@namprd22.prod.outlook.com>
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
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
To: Trond Myklebust <trondmy@hammerspace.com>
Cc: "linux@roeck-us.net" <linux@roeck-us.net>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "ralf@linux-mips.org" <ralf@linux-mips.org>, "jlayton@kernel.org" <jlayton@kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "bfields@fieldses.org" <bfields@fieldses.org>, "linux-mips@linux-mips.org" <linux-mips@linux-mips.org>, "linux-nfs@vger.kernel.org" <linux-nfs@vger.kernel.org>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "anna.schumaker@netapp.com" <anna.schumaker@netapp.com>, "jhogan@kernel.org" <jhogan@kernel.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "davem@davemloft.net" <davem@davemloft.net>, "arnd@arndb.de" <arnd@arndb.de>, "paulus@samba.org" <paulus@samba.org>, "mpe@ellerman.id.au" <mpe@ellerman.id.au>, "benh@kernel.crashing.org" <benh@kernel.crashing.org>
Message-ID: <20181101175450.DGsouHan7EDDBVlAifXZ3TpT5VS0azcvmxohCYf76TA@z>

Hi Trond,

On Thu, Nov 01, 2018 at 12:17:31AM +0000, Trond Myklebust wrote:
> On Wed, 2018-10-31 at 23:32 +0000, Paul Burton wrote:
> > In this particular case I have no idea why
> > net/sunrpc/auth_gss/gss_krb5_seal.c is using cmpxchg64() at all. It's
> > essentially reinventing atomic64_fetch_inc() which is already
> > provided
> > everywhere via CONFIG_GENERIC_ATOMIC64 & the spinlock approach. At
> > least
> > for atomic64_* functions the assumption that all access will be
> > performed using those same functions seems somewhat reasonable.
> > 
> > So how does the below look? Trond?
> 
> My one question (and the reason why I went with cmpxchg() in the first
> place) would be about the overflow behaviour for atomic_fetch_inc() and
> friends. I believe those functions should be OK on x86, so that when we
> overflow the counter, it behaves like an unsigned value and wraps back
> around.  Is that the case for all architectures?
> 
> i.e. are atomic_t/atomic64_t always guaranteed to behave like u32/u64
> on increment?
> 
> I could not find any documentation that explicitly stated that they
> should.

Based on other replies it seems like it's at least implicitly assumed by
other code, even if not explicitly stated.
