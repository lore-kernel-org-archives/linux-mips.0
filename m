Received: from mout.kundenserver.de ([212.227.126.135]:59615 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27013700AbcCNPeXQw2m1 convert rfc822-to-8bit (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 14 Mar 2016 16:34:23 +0100
From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] Firmware: broadcom sprom: clarifiy SSB dependency
Date: Mon, 14 Mar 2016 16:34:09 +0100
Message-ID: <4928549.J7iBRWWaDH@wuerfel>
In-Reply-To: <CACna6rwx4Lna-PXNaHFwqn8xWitN=5ReUsAGPsK75YC2SLpDNg@mail.gmail.com>
References: <1457965305-3258441-1-git-send-email-arnd@arndb.de> <CACna6rwx4Lna-PXNaHFwqn8xWitN=5ReUsAGPsK75YC2SLpDNg@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
Content-Type: text/plain; charset="utf-8"
Return-Path: <arnd@arndb.de>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Ralf Baechle <ralf@linux-mips.org>, Paul Walmsley <paul@pwsan.com>, "linux-mips@linux-mips.org" <linux-mips@linux-mips.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Message-ID: <20160314153409.vDffkGugHhCU1maz2ZmxxyZI4OwvHjdU13UGvq_GpkE@z>

On Monday 14 March 2016 15:37:18 Rafał Miłecki wrote:
> On 14 March 2016 at 15:21, Arnd Bergmann <arnd@arndb.de> wrote:
> > The broadcom firmware drvier calls into the ssb SPROM code if that
> > is enabled, but it fails if the SSB code is in a loadable module
> > because the bcm47xx firmware is always built-in:
> >
> > drivers/firmware/built-in.o: In function `bcm47xx_sprom_register_fallbacks':
> > bcm47xx_sprom.c:(.text+0x11c4): undefined reference to `ssb_arch_register_fallback_sprom'
> >
> > This adds a Kconfig dependency to ensure that we cannot turn on the
> > generic sprom support if the ssb sprom is in a module.
> 
> Can you attach your config that triggered this build error? I modified
> condition to the:
> #if IS_BUILTIN(CONFIG_SSB) && IS_ENABLED(CONFIG_SSB_SPROM)
> which I believe should be enough.
