Received: from mailapp01.imgtec.com ([195.59.15.196]:61017 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27011286AbbG0SEvUu9oz (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 27 Jul 2015 20:04:51 +0200
Date: Mon, 27 Jul 2015 11:04:42 -0700
From: Paul Burton <paul.burton@imgtec.com>
Subject: Re: Crash in -next due to 'MIPS: Move FP usage checks into
 protected_{save, restore}_fp_context'
Message-ID: <20150727180442.GG7289@NP-P-BURTON>
References: <20150715160918.GA27653@roeck-us.net>
 <20150727150652.GA1756@roeck-us.net>
 <20150727172142.GE7289@NP-P-BURTON>
 <20150727174622.GA10708@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20150727174622.GA10708@roeck-us.net>
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
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-next@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>, linux-kernel@vger.kernel.org, linux-mips@linux-mips.org
Message-ID: <20150727180442.IOLwRsqlMzwKnMna13_go1zIViPCducBiPFXhBvvqfI@z>

On Mon, Jul 27, 2015 at 10:46:22AM -0700, Guenter Roeck wrote:
> On Mon, Jul 27, 2015 at 10:21:42AM -0700, Paul Burton wrote:
> > On Mon, Jul 27, 2015 at 08:06:52AM -0700, Guenter Roeck wrote:
> > > On Wed, Jul 15, 2015 at 09:09:18AM -0700, Guenter Roeck wrote:
> > > > Hi,
> > > > 
> > > > my qemu test for mipsel crashes with next-20150715 as follows.
> > > > 
> > > ping ... problem is still seen as of next-20150727.
> > 
> > Hi Guenter,
> > 
> > Apologies for the delay. Could you share your affected kernel
> > configuration & which userland you're running?
> > 
> > I've just tested with a malta_defconfig kernel & a buildroot based
> > initramfs without problems, and things are also fine on my physical
> > MIPSr6 setups. If you have any directions with which I can reproduce
> > this problem that would be great.
> > 
> This is with qemu in little endian mode. Big endian works fine.

Yup, I was using little endian in both cases. malta_defconfig is little
endian - sadly use of the el suffix is pretty inconsistent...

> The configuration, the script to build and run the kernel, 
> and the root file system used are are available at
> https://github.com/groeck/linux-build-test, in directory
> rootfs/mipsel/. The log for the latest build failure is in
> http://server.roeck-us.net:8010/builders/qemu-mipsel-next/builds/194/steps/qemubuildcommand/logs/stdio.

Thanks for the pointers, I'm able to reproduce it using your config and
initramfs, and I'll dig into what's going on here.

Paul
