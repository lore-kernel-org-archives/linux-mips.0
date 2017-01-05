Received: from mail-ua0-x230.google.com ([IPv6:2607:f8b0:400c:c08::230]:33197
        "EHLO mail-ua0-x230.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23992535AbdAERy4Q1c-u (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 5 Jan 2017 18:54:56 +0100
Received: by mail-ua0-x230.google.com with SMTP id i68so280686709uad.0
        for <linux-mips@linux-mips.org>; Thu, 05 Jan 2017 09:54:56 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <063D6719AE5E284EB5DD2968C1650D6DB0258289@AcuExch.aculab.com>
References: <20161230155634.8692-1-dsafonov@virtuozzo.com> <20161230155634.8692-2-dsafonov@virtuozzo.com>
 <063D6719AE5E284EB5DD2968C1650D6DB0258289@AcuExch.aculab.com>
From: Andy Lutomirski <luto@amacapital.net>
Date: Thu, 5 Jan 2017 09:54:30 -0800
Message-ID: <CALCETrXUB8AeEzJ-WtW3kW9c189AcOe+GBq8TE7GPE+xrvXS8g@mail.gmail.com>
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
To: David Laight <David.Laight@aculab.com>
Cc: Dmitry Safonov <dsafonov@virtuozzo.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-mips@linux-mips.org" <linux-mips@linux-mips.org>, Peter Zijlstra <peterz@infradead.org>, Heiko Carstens <heiko.carstens@de.ibm.com>, Paul Mackerras <paulus@samba.org>, "H. Peter Anvin" <hpa@zytor.com>, "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>, "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, Helge Deller <deller@gmx.de>, "x86@kernel.org" <x86@kernel.org>, "James E.J. Bottomley" <jejb@parisc-linux.org>, Will Deacon <will.deacon@arm.com>, Ingo Molnar <mingo@redhat.com>, Catalin Marinas <catalin.marinas@arm.com>, "0x7f454c46@gmail.com" <0x7f454c46@gmail.com>, Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>, Ralf Baechle <ralf@linux-mips.org>, Martin Schwidefsky <schwidefsky@de.ibm.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "David S. Miller" <davem@davemloft.net>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Message-ID: <20170105175430.ksx7ZqmCz826I7YpUH7sDpPoglnK2a69hsHPLsaKnic@z>

On Thu, Jan 5, 2017 at 1:51 AM, David Laight <David.Laight@aculab.com> wrote:
> From: Dmitry Safonov
>> Sent: 30 December 2016 15:57
>> All users of TASK_SIZE_OF(tsk) have migrated to mm->task_size or
>> TASK_SIZE_MAX since:
>> commit d696ca016d57 ("x86/fsgsbase/64: Use TASK_SIZE_MAX for
>> FSBASE/GSBASE upper limits"),
>> commit a06db751c321 ("pagemap: check permissions and capabilities at
>> open time"),
> ...
>> +#define TASK_SIZE            (current->thread.task_size)
>
> I'm not sure I like he hidden 'current' argument to an
> apparent constant.

Me neither.  But this patch is merely changing the implementation.
