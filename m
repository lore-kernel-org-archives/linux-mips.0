Received: from mailapp01.imgtec.com ([195.59.15.196]:45551 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23993417AbdFDPsi4C1og (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Sun, 4 Jun 2017 17:48:38 +0200
Date: Sun, 4 Jun 2017 16:48:24 +0100
From: "Maciej W. Rozycki" <macro@imgtec.com>
Subject: Re: QEMU Malta emulation using I6400: runaway loop modprobe
 binfmt-464c
In-Reply-To: <B0501081-3292-48D8-ACFF-043C3BA87D8C@imgtec.com>
Message-ID: <alpine.DEB.2.00.1706041613440.10864@tp.orcam.me.uk>
References: <996c275d-d969-508e-6b4e-bef22d8e7385@longlandclan.id.au> <alpine.DEB.2.00.1706031310470.2590@tp.orcam.me.uk> <81bca3a5-88dc-d6af-9c6a-3e17d9a8bda5@longlandclan.id.au> <B0501081-3292-48D8-ACFF-043C3BA87D8C@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Return-Path: <Maciej.Rozycki@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: James Hogan <james.hogan@imgtec.com>
Cc: linux-mips@linux-mips.org, Stuart Longland <stuartl@longlandclan.id.au>
Message-ID: <20170604154824.Vp_mEyXkTyUIJvJ6G2NEandjv9XiDhMSHRiwDsRKcDo@z>

On Sun, 4 Jun 2017, James Hogan wrote:

> >The ultimate target for this is
> >Loongson 2F which probably uses the old encoding.
> 
> indeed. i think nan2008 is optional in r5, required in r6.

 Support for 2008 NaN has been first added to R3 with run-time selection 
between the legacy-NaN and the 2008-NaN encoding allowed, but not mandated 
by the architecture.  No actual hardware has implemented this selection, 
so in reality all R3 hardware is hardwired to either legacy NaN or 2008 
NaN.

 The kernel emulator does implement the run-time selection though, as 
specified by the architecture, which is why with the `nofpu' kernel 
parameter or on non-FPU hardware you can run both legacy-NaN and 2008-NaN 
user software.  To make people's lives easier the run-time selection is 
allowed regardless of the architecture level implemented by the CPU 
(although for legacy hardware only with `ieee754=relaxed').  I can't speak 
for QEMU -- the patches I made a while ago and submitted upstream did 
provide for run-time selection, on a per emulated CPU basis, but then 
someone else took over that effort and reimplemented the feature, and I 
have no idea how much of the original work has been preserved.

 In R5 the architecture mandates the NaN setting to be hardwired, and 
2008-NaN support is required if the MSA module has been implemented, or 
otherwise implementing either legacy NaN or 2008 NaN is allowed, but no 
run-time selection.

 In R6 the architecture indeed mandates the NaN setting to be hardwired to 
2008.

 In all architecture revisions the current NaN setting and the ability to 
change it can be determined at run time by software, which can then adapt 
accordingly.

  Maciej
