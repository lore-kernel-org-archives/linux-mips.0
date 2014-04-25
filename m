Received: from mailapp01.imgtec.com ([195.89.28.115]:18807 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S6821742AbaDYMG7N2fZS (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 25 Apr 2014 14:06:59 +0200
Date: Fri, 25 Apr 2014 13:06:54 +0100
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: Re: [PATCH v3 13/14] MIPS: net: Add BPF JIT
Message-ID: <20140425120654.GA30753@mchandras-linux.le.imgtec.org>
References: <1396957635-27071-14-git-send-email-markos.chandras@imgtec.com>
 <1398351013-29490-1-git-send-email-markos.chandras@imgtec.com>
 <20140424163114.GD36716@pburton-linux.le.imgtec.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20140424163114.GD36716@pburton-linux.le.imgtec.org>
Return-Path: <Markos.Chandras@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Paul Burton <paul.burton@imgtec.com>
Cc: linux-mips@linux-mips.org, "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org
Message-ID: <20140425120654.nmhr_KrxYfP7C-vFuvDuqrt7MXgw2JRWFF3euuvusk8@z>

On Thu, Apr 24, 2014 at 05:31:14PM +0100, Paul Burton wrote:
> On Thu, Apr 24, 2014 at 03:50:13PM +0100, Markos Chandras wrote:
> > diff --git a/arch/mips/net/bpf_jit.c b/arch/mips/net/bpf_jit.c
> > new file mode 100644
> > index 0000000..864e5b7
> > --- /dev/null
> > +++ b/arch/mips/net/bpf_jit.c
> 
> ... cut ...
> 
> > +			off = offsetof(struct sk_buff, protocol);
> > +			emit_half_load(r_A, r_skb, off, ctx);
> > +#ifdef CONFIG_CPU_LITTLE_ENDIAN
> > +			/* This needs little endian fixup */
> > +			if (cpu_has_mips_r1) {
> 
> Doesn't cpu_has_mips_r1 cover everything >= r1? ie. everything will now
> take this path, including systems >= r2. Don't you want the inverse
> (!cpu_has_mips_r2) instead?
> 
> Paul

Hi Paul,

Yes you are right. I will fix it and submit a new version.

-- 
markos
