Received: from mout.kundenserver.de ([212.227.17.13]:58065 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23990513AbcLNU4edmvtE (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 14 Dec 2016 21:56:34 +0100
From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: next build: 198 builds: 4 failed, 194 passed, 7 errors, 82 warnings (next-20161214)
Date: Wed, 14 Dec 2016 21:56:20 +0100
Message-ID: <6690634.sIS8JJ6W6I@wuerfel>
In-Reply-To: <20161214174539.h3xsugswlq576g7b@sirena.org.uk>
References: <58510536.04c7190a.4a2fb.ae5c@mx.google.com> <20161214160609.GA15191@linux-mips.org> <20161214174539.h3xsugswlq576g7b@sirena.org.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
To: kernel-build-reports@lists.linaro.org
Cc: Mark Brown <broonie@kernel.org>, Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org
Message-ID: <20161214205620.x54Yetv3J2EQMMMn-is7dPSGu75zTxpUz9zIfusE_6U@z>

On Wednesday, December 14, 2016 5:45:39 PM CET Mark Brown wrote:
> On Wed, Dec 14, 2016 at 05:06:09PM +0100, Ralf Baechle wrote:
> > On Wed, Dec 14, 2016 at 01:52:14PM +0000, Mark Brown wrote:
> > > On Wed, Dec 14, 2016 at 12:39:18AM -0800, kernelci.org bot wrote:
> 
> > > > mips:    gcc version 5.3.0 (Sourcery CodeBench Lite 2016.05-8)
> 
> > > These MIPS builds have been failing in kernelci ever since MIPS was
> > > added.  This means that we've got a constant level of noise in the
> > > results which makes them less useful for everyone - people get used to
> > > ignoring errors.  Is there any plan to get these fixed?
> 
> > I wonder if these are also toolchain-related issues.  allnoconfig and
> > tinyconfig do build fine for me with GCC 6.1.0 and binutils 2.26.20160125.
> 
> > generic_defconfig requires mkimage of uboot-tools or it will fail like this:
> 
> >   ITB     arch/mips/boot/vmlinux.gz.itb
> > "mkimage" command not found - U-Boot images will not be built
> > arch/mips/boot/Makefile:159: recipe for target 'arch/mips/boot/vmlinux.gz.itb' failed
> > make[1]: *** [arch/mips/boot/vmlinux.gz.itb] Error 1
> > arch/mips/Makefile:365: recipe for target 'vmlinux.gz.itb' failed
> > make: *** [vmlinux.gz.itb] Error 2
> 
> Ah, you don't have a separate uImage target?
> 
> > What binutils are you using and can you send me the build errors messages?
> 
> You can see logs for all the trees we build via the web interface:
> 
>    https://kernelci.org/job/
> 
> I don't have access to the builders to check the binutils version
> without going and finding/downloading the CodeSourcery release.  Where
> did your toolchain come from, is there something specific recommended
> for MIPS?
> 
