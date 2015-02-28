Received: from mail-vc0-f169.google.com ([209.85.220.169]:51887 "EHLO
        mail-vc0-f169.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S27007597AbbB1CBRJgbuj (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Sat, 28 Feb 2015 03:01:17 +0100
Received: by mail-vc0-f169.google.com with SMTP id kv19so7707195vcb.0
        for <linux-mips@linux-mips.org>; Fri, 27 Feb 2015 18:01:11 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20150228123656.538301ef@canb.auug.org.au>
References: <20150228005228.GA23638@www.outflux.net>
        <20150228123656.538301ef@canb.auug.org.au>
Date: Fri, 27 Feb 2015 18:01:11 -0800
Message-ID: <CAGXu5jLgbzzYQkeLmpgSGu7w7DKKTHpFE=F2_a=ayjkU6atBQQ@mail.gmail.com>
Subject: Re: [PATCH] seccomp: switch to using asm-generic for seccomp.h
From: Kees Cook <keescook@chromium.org>
Content-Type: text/plain; charset=UTF-8
Return-Path: <keescook@google.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, Linux MIPS Mailing List <linux-mips@linux-mips.org>, linux-sh@vger.kernel.org, Heiko Carstens <heiko.carstens@de.ibm.com>, Paul Mackerras <paulus@samba.org>, sparclinux@vger.kernel.org, linux-s390@vger.kernel.org, Russell King <linux@arm.linux.org.uk>, Helge Deller <deller@gmx.de>, "x86@kernel.org" <x86@kernel.org>, "James E.J. Bottomley" <jejb@parisc-linux.org>, AKASHI Takahiro <takahiro.akashi@linaro.org>, James Hogan <james.hogan@imgtec.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Michal Simek <monstr@monstr.eu>, linux-parisc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Ralf Baechle <ralf@linux-mips.org>, Martin Schwidefsky <schwidefsky@de.ibm.com>, linux390@de.ibm.com, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Message-ID: <20150228020111.cCgVrp_gKsvoX0ioEGMM4Pb-17zE1LuWS3BG8c0agCk@z>

On Fri, Feb 27, 2015 at 5:36 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Kees,
>
> On Fri, 27 Feb 2015 16:52:29 -0800 Kees Cook <keescook@chromium.org> wrote:
>>
>> diff --git a/arch/arm/include/asm/seccomp.h b/arch/arm/include/asm/seccomp.h
>> index 52b156b341f5..66ca6a30bf5c 100644
>> --- a/arch/arm/include/asm/seccomp.h
>> +++ b/arch/arm/include/asm/seccomp.h
>> @@ -1,11 +1 @@
>> -#ifndef _ASM_ARM_SECCOMP_H
>> -#define _ASM_ARM_SECCOMP_H
>> -
>> -#include <linux/unistd.h>
>> -
>> -#define __NR_seccomp_read __NR_read
>> -#define __NR_seccomp_write __NR_write
>> -#define __NR_seccomp_exit __NR_exit
>> -#define __NR_seccomp_sigreturn __NR_rt_sigreturn
>> -
>> -#endif /* _ASM_ARM_SECCOMP_H */
>> +#include <asm-generic/seccomp.h>
>
> I think that these cases (where you replace the file by a stub that
> just include <asm-generic/seccomp.h>) can be replaced by removing the
> file completely and adding
>
> generic-y = seccomp.h
>
> to <ARCH>/include/asm/Kbuild

Ah-ha! I thought total removal was possible, but I lacked the Kbuild
piece. There are a lot of arch/ headers that are just the one line.
Maybe I should send a another patch to clean up those?

-Kees

-- 
Kees Cook
Chrome OS Security
