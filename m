Received: from mail-oa0-f52.google.com ([209.85.219.52]:63493 "EHLO
        mail-oa0-f52.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S6839078Ab3HURZUA2UBL convert rfc822-to-8bit
        (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Wed, 21 Aug 2013 19:25:20 +0200
Received: by mail-oa0-f52.google.com with SMTP id f4so446169oah.11
        for <linux-mips@linux-mips.org>; Wed, 21 Aug 2013 10:25:13 -0700 (PDT)
Date: Wed, 21 Aug 2013 12:25:11 -0500
From: Rob Landley <rob@landley.net>
Subject: Re: [RFC] Get rid of SUBARCH
In-Reply-To: <CAMuHMdWk-EPTNmPB1O1+F7YVQLjhQsFJznYwA3t6UCGUU1T9PQ@mail.gmail.com>
        (from geert@linux-m68k.org on Wed Aug 21 07:07:33 2013)
Message-ID: <1377105911.2737.94@driftwood>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; DelSp=Yes; Format=Flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8BIT
Return-Path: <rob@landley.net>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Richard Weinberger <richard@nod.at>, Linux-Arch <linux-arch@vger.kernel.org>, Michal Marek <mmarek@suse.cz>, Ralf Baechle <ralf@linux-mips.org>, Paul Mundt <lethal@linux-sh.org>, Jeff Dike <jdike@addtoit.com>, Guan Xuetao <gxt@mprc.pku.edu.cn>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, the arch/x86 maintainers <x86@kernel.org>, linux-kbuild <linux-kbuild@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-m68k <linux-m68k@lists.linux-m68k.org>, Linux MIPS Mailing List <linux-mips@linux-mips.org>, Linux-sh list <linux-sh@vger.kernel.org>, uml-devel <user-mode-linux-devel@lists.sourceforge.net>
Message-ID: <20130821172511.HZNYaIaynJGc-Pjd5QUPsUk7sq0G0dPrE_31gVcHWsw@z>

On 08/21/2013 07:07:33 AM, Geert Uytterhoeven wrote:
> On Wed, Aug 21, 2013 at 10:19 AM, Richard Weinberger <richard@nod.at>  
> wrote:
> > This series is an attempt to remove the SUBARCH make parameter.
> > It as introduced at the times of Linux 2.5 for UML to tell the UML
> > build system what the real architecture is.
> >
> > But we actually don't need SUBARCH, we can store this information
> > in the .config file.
> 
> Haha, now you have OS_ARCH (shouldn't that be called HOST_ARCH?)  
> instead,
> which is available only for UM?
> 
> > The series touches also m68k, sh, mips and unicore32.
> > These architectures magically select a cross compiler if ARCH !=  
> SUBARCH.
> > Do really need that behavior?
> 
> This does remove functionality.
> It allows to build a kernel using e.g. "make ARCH=m68k".

   make ARCH=m68k CROSS_COMPILE=m68k-
   make ARCH=arm CROSS_COMPILE=armv5l-
   make ARCH=sparc CROSS_COMPILE=sparc-
   make ARCH=ppc CROSS_COMPILE=powerpc-
   make ARCH=sh CROSS_COMPILE=sh4-
   make ARCH=mips CROSS_COMPILE=mipsel-
   make ARCH=x86 CROSS_COMPILE=i686-
   make ARCH=alpha CROSS_COMPILE=alpha-

Works the same way on all the targets I've tried so far. You specify  
the architecture, you specify the cross compiler prefix, you feed it a  
config file, you build.

(If a target supplies its own default cross compiler prefix I just have  
to override it with what mine's called anyway...)

> Perhaps this can be moved to generic code? Most (not all!)  
> cross-toolchains
> are called $ARCH-{unknown-,}linux{,-gnu}.
> Exceptions are e.g. am33_2.0-linux and bfin-uclinux.

The linaro toolchain is arm-linux-gnueabihf- and the one on kernel.org  
is arm-unknown-linux-gnueabi- and the one I build is armv5l- (because  
the FSF's  
$ARCH-unknown-gnu-format-tuple-all-hail-stallman-gnu-gnu-gnu-dammit-gcc  
is just nuts: why would I say -linux- in a linux-to-linux toolchain? Do  
windows toolchains say -windows-?)

Other toolchain sources use other prefixes (-unknown- is often  
-$VENDORNAME-), and then of course there's llvm... which is why you  
specify CROSS_COMPILE= on the make command line.

Rob
