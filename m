Received: from mail-oa0-f48.google.com ([209.85.219.48]:54092 "EHLO
        mail-oa0-f48.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S6867659Ab3HVUlWxqaXm convert rfc822-to-8bit
        (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Thu, 22 Aug 2013 22:41:22 +0200
Received: by mail-oa0-f48.google.com with SMTP id o17so4389401oag.7
        for <linux-mips@linux-mips.org>; Thu, 22 Aug 2013 13:41:16 -0700 (PDT)
Date: Thu, 22 Aug 2013 15:41:09 -0500
From: Rob Landley <rob@landley.net>
Subject: Re: [RFC] Get rid of SUBARCH
References: <1377073172-3662-1-git-send-email-richard@nod.at>
        <CAMuHMdWk-EPTNmPB1O1+F7YVQLjhQsFJznYwA3t6UCGUU1T9PQ@mail.gmail.com>
        <20130821195157.GA18191@merkur.ravnborg.org>
        <CAMuHMdWqwQxxky7UDnh-oxN13C-sxfnxKVBuBz1GU_RtJvbf3A@mail.gmail.com>
In-Reply-To: <CAMuHMdWqwQxxky7UDnh-oxN13C-sxfnxKVBuBz1GU_RtJvbf3A@mail.gmail.com>
        (from geert@linux-m68k.org on Thu Aug 22 07:58:26 2013)
Message-ID: <1377204069.2737.108@driftwood>
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
Cc: Sam Ravnborg <sam@ravnborg.org>, Richard Weinberger <richard@nod.at>, Linux-Arch <linux-arch@vger.kernel.org>, Michal Marek <mmarek@suse.cz>, Ralf Baechle <ralf@linux-mips.org>, Paul Mundt <lethal@linux-sh.org>, Jeff Dike <jdike@addtoit.com>, Guan Xuetao <gxt@mprc.pku.edu.cn>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, the arch/x86 maintainers <x86@kernel.org>, linux-kbuild <linux-kbuild@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-m68k <linux-m68k@lists.linux-m68k.org>, Linux MIPS Mailing List <linux-mips@linux-mips.org>, Linux-sh list <linux-sh@vger.kernel.org>, uml-devel <user-mode-linux-devel@lists.sourceforge.net>
Message-ID: <20130822204109.Sfy-3pLzB6PZdiQnhqA3MlQiCrvhh8fiJO03_sUkQCw@z>

On 08/22/2013 07:58:26 AM, Geert Uytterhoeven wrote:
> On Wed, Aug 21, 2013 at 9:51 PM, Sam Ravnborg <sam@ravnborg.org>  
> wrote:
> >> > The series touches also m68k, sh, mips and unicore32.
> >> > These architectures magically select a cross compiler if ARCH !=  
> SUBARCH.
> >> > Do really need that behavior?
> >>
> >> This does remove functionality.
> >> It allows to build a kernel using e.g. "make ARCH=m68k".
> >>
> >> Perhaps this can be moved to generic code? Most (not all!)  
> cross-toolchains
> >> are called $ARCH-{unknown-,}linux{,-gnu}.
> >> Exceptions are e.g. am33_2.0-linux and bfin-uclinux.
> >
> > Today you can specify CROSS_COMPILE in Kconfig.
> > With this we should be able to remove these hacks.
> 
> The correct CROSS_COMPILE value depends on the host environment, not
> on the target configuration.

Actually it depends on _both_.

Rob
