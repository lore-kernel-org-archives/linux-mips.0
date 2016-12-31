Received: from mail-ua0-f178.google.com ([209.85.217.178]:36434 "EHLO
        mail-ua0-f178.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23992196AbcLaBg5XENcH (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Sat, 31 Dec 2016 02:36:57 +0100
Received: by mail-ua0-f178.google.com with SMTP id 88so259203119uaq.3
        for <linux-mips@linux-mips.org>; Fri, 30 Dec 2016 17:36:57 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20161230155634.8692-2-dsafonov@virtuozzo.com>
References: <20161230155634.8692-1-dsafonov@virtuozzo.com> <20161230155634.8692-2-dsafonov@virtuozzo.com>
From: Andy Lutomirski <luto@amacapital.net>
Date: Fri, 30 Dec 2016 17:36:31 -0800
Message-ID: <CALCETrVsjDqWpF2E4gZKMx4EEFHLYSR+AOX_3BcV3FNPe13pkg@mail.gmail.com>
Subject: Re: [RFC 1/4] mm: remove unused TASK_SIZE_OF()
Content-Type: text/plain; charset=UTF-8
Return-Path: <luto@amacapital.net>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Dmitry Safonov <dsafonov@virtuozzo.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Dmitry Safonov <0x7f454c46@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Ralf Baechle <ralf@linux-mips.org>, "James E.J. Bottomley" <jejb@parisc-linux.org>, Helge Deller <deller@gmx.de>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, Martin Schwidefsky <schwidefsky@de.ibm.com>, Heiko Carstens <heiko.carstens@de.ibm.com>, "David S. Miller" <davem@davemloft.net>, Peter Zijlstra <peterz@infradead.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Linux MIPS Mailing List <linux-mips@linux-mips.org>, linux-parisc@vger.kernel.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, sparclinux@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, X86 ML <x86@kernel.org>
Message-ID: <20161231013631.p517tF6H-D7lD8GgL1heH1y9gO62cRoeIYGfQApRPF8@z>

On Fri, Dec 30, 2016 at 7:56 AM, Dmitry Safonov <dsafonov@virtuozzo.com> wrote:
> All users of TASK_SIZE_OF(tsk) have migrated to mm->task_size or
> TASK_SIZE_MAX since:
> commit d696ca016d57 ("x86/fsgsbase/64: Use TASK_SIZE_MAX for
> FSBASE/GSBASE upper limits"),
> commit a06db751c321 ("pagemap: check permissions and capabilities at
> open time"),

I like this.

Reviewed-by: Andy Lutomirski <luto@kernel.org> # for x86
