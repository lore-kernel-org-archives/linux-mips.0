Received: from mailapp01.imgtec.com ([195.59.15.196]:37478 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27011425AbbG0UCWuexWX (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 27 Jul 2015 22:02:22 +0200
Date: Mon, 27 Jul 2015 13:02:14 -0700
From: Paul Burton <paul.burton@imgtec.com>
Subject: Re: Crash in -next due to 'MIPS: Move FP usage checks into
 protected_{save, restore}_fp_context'
Message-ID: <20150727200214.GH7289@NP-P-BURTON>
References: <20150715160918.GA27653@roeck-us.net>
 <20150727150652.GA1756@roeck-us.net>
 <20150727172142.GE7289@NP-P-BURTON>
 <20150727174622.GA10708@roeck-us.net>
 <20150727180442.GG7289@NP-P-BURTON>
 <20150727194401.GC14674@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20150727194401.GC14674@roeck-us.net>
Return-Path: <Paul.Burton@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Guenter Roeck <linux@roeck-us.net>, Ralf Baechle <ralf@linux-mips.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mips@linux-mips.org
Message-ID: <20150727200214.0CPTUv2YO4ZkJSMocKxVcBmSvL9zNkg5W5v-HnWxJOc@z>

On Mon, Jul 27, 2015 at 12:44:01PM -0700, Guenter Roeck wrote:
> On Mon, Jul 27, 2015 at 11:04:42AM -0700, Paul Burton wrote:
> > On Mon, Jul 27, 2015 at 10:46:22AM -0700, Guenter Roeck wrote:
> > > On Mon, Jul 27, 2015 at 10:21:42AM -0700, Paul Burton wrote:
> > > > On Mon, Jul 27, 2015 at 08:06:52AM -0700, Guenter Roeck wrote:
> > > > > On Wed, Jul 15, 2015 at 09:09:18AM -0700, Guenter Roeck wrote:
> > > > > > Hi,
> > > > > 
> > > > > > my qemu test for mipsel crashes with next-20150715 as follows.
> > > > > > 
> > > > > ping ... problem is still seen as of next-20150727.
> > > > 
> > > > Hi Guenter,
> > > > 
> > > > Apologies for the delay. Could you share your affected kernel
> > > > configuration & which userland you're running?
> > > > 
> > > > I've just tested with a malta_defconfig kernel & a buildroot based
> > > > initramfs without problems, and things are also fine on my physical
> > > > MIPSr6 setups. If you have any directions with which I can reproduce
> > > > this problem that would be great.
> > > > 
> > > This is with qemu in little endian mode. Big endian works fine.
> > 
> > Yup, I was using little endian in both cases. malta_defconfig is little
> > endian - sadly use of the el suffix is pretty inconsistent...
> > 
> 
> Hi Paul,
> 
> some more data:
> 
> I tried with mipsel64, using malta_defconfig from 4.2-rc4 as starting point.
> Same failure. All releases from 3.2 up to 4.2-rc4 pass the test, linux-next
> as of today fails.
> 
> Here is the log:
> 
> http://server.roeck-us.net:8010/builders/qemu-mipsel64-next/builds/0/steps/qemubuildcommand/logs/stdio
> 
> I pushed the initramfs, configuration, and test script into rootfs/mipsel64
> of https://github.com/groeck/linux-build-test.

Hi Guenter,

I'm currently mailing out v2 of the series which should fix your
problem. It was an issue where the kernel would check the FP context for
whether a SIGFPE should be generated even in cases where FP had not been
used by userland, and thus had not been initialised. My userland is
hard float & thus makes use of the FPU early whilst I believe yours is
soft float, which explains the difference in behaviour.

I think the endian difference probably boils down to what garbage the
initial FP context contained.

Ralf: can you update the patches in -next please?

Thanks,
    Paul
