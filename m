Received: from mailapp01.imgtec.com ([195.59.15.196]:61462 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27012176AbaJVW3nm43qd (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 23 Oct 2014 00:29:43 +0200
Date: Wed, 22 Oct 2014 23:29:36 +0100
From: James Hogan <james.hogan@imgtec.com>
Subject: Re: [PATCH] mips: add arch_trigger_all_cpu_backtrace() function
Message-ID: <20141022222936.GE12296@jhogan-linux.le.imgtec.org>
References: <1061520101.169091413960858532.JavaMail.weblogic@epmlwas02b>
 <544758AB.3060100@openwrt.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <544758AB.3060100@openwrt.org>
Return-Path: <James.Hogan@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: John Crispin <blogic@openwrt.org>
Cc: eunb.song@samsung.com, "ralf@linux-mips.org" <ralf@linux-mips.org>, "linux-mips@linux-mips.org" <linux-mips@linux-mips.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Message-ID: <20141022222936.pdbbsq9msQP73OQtvfpavkvC4NWd_VNmNi6tjAxqVII@z>

Hi John,

On Wed, Oct 22, 2014 at 09:11:39AM +0200, John Crispin wrote:
> On 22/10/2014 08:54, Eunbong Song wrote:
> >>> +void arch_trigger_all_cpu_backtrace(bool); +#define
> >>> arch_trigger_all_cpu_backtrace arch_trigger_all_cpu_backtrace
> > 
> >> What is the purpose of this define ? is this maybe a leftover from
> >> some regex/cleanups ?
> > 
> > Hi John.
> > Actually, I just follow the same function of sparc architecture.
> > You can find this in arch/sparc/include/asm/irq_64.h as below
> > 
> > void arch_trigger_all_cpu_backtrace(bool);
> > #define arch_trigger_all_cpu_backtrace arch_trigger_all_cpu_backtrace
> > 
> > I guess this is used for conditional compile. 
> > See below.
> > include/linux/nmi.h
> > #ifdef arch_trigger_all_cpu_backtrace
> > static inline bool trigger_all_cpu_backtrace(void)
> > {
> >         arch_trigger_all_cpu_backtrace(true);
> > 
> >         return true;
> > }
> > static inline bool trigger_allbutself_cpu_backtrace(void)
> > {
> >         arch_trigger_all_cpu_backtrace(false);
> >         return true;
> > }
> > #else
> > static inline bool trigger_all_cpu_backtrace(void)
> > {
> >         return false;
> > }
> > static inline bool trigger_allbutself_cpu_backtrace(void)
> > {
> >         return false;
> > }
> > #endif
> > 
> > Thanks. 
> >> John
> > 
> 
> i don't see how this is required for conditional compiles. the code
> define a->a which is bogus i think.

It's a pretty common pattern in the asm headers, in order to allow
generic code to use the preprocessor to see whether it was defined or
not.

Cheers
James
