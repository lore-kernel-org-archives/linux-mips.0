Received: from mailapp01.imgtec.com ([195.59.15.196]:64387 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23993883AbdDDMTEdNx0F (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 4 Apr 2017 14:19:04 +0200
Subject: Re: [PATCH] MIPS: IRQ Stack: Unwind IRQ stack onto task stack
References: <1490107945-21553-1-git-send-email-matt.redfearn@imgtec.com>
 <CAHmME9p_Yw7Xi2P=zs4snEM3vGo8OkgM8cddpOy69KssNHqsmA@mail.gmail.com>
From: Matt Redfearn <matt.redfearn@imgtec.com>
Message-ID: <c2249854-12ee-6040-4623-bcc17c467f2d@imgtec.com>
Date: Tue, 4 Apr 2017 13:18:58 +0100
MIME-Version: 1.0
In-Reply-To: <CAHmME9p_Yw7Xi2P=zs4snEM3vGo8OkgM8cddpOy69KssNHqsmA@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-Path: <Matt.Redfearn@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org, Paolo Bonzini <pbonzini@redhat.com>, Marcin Nowakowski <marcin.nowakowski@imgtec.com>, Masanari Iida <standby24x7@gmail.com>, Chris Metcalf <cmetcalf@mellanox.com>, LKML <linux-kernel@vger.kernel.org>, James Hogan <james.hogan@imgtec.com>, Paul Burton <paul.burton@imgtec.com>, Ingo Molnar <mingo@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
Message-ID: <20170404121858.DDDBsSElitM6ubReZtOVKTG4C9TzYHO3azW0IlYS-p8@z>

Hi Jason,


On 04/04/17 12:58, Jason A. Donenfeld wrote:
> This indeed is useful. Out of curiosity, are other archs using a
> similar technique? In anycase,
>
> Acked-by: Jason A. Donenfeld <Jason@zx2c4.com>

Yes, at least x86 and ARM64 do the same thing (probably more)

x86 saves the previous stack pointer on the IRQ stack in 
http://lxr.free-electrons.com/source/arch/x86/kernel/irq_32.c#L70
which is then unwound in 
http://lxr.free-electrons.com/source/arch/x86/kernel/dumpstack.c#L51

ARM64 saves the task SP in 
http://lxr.free-electrons.com/source/arch/arm64/kernel/entry.S#L249
And unwinds it in 
http://lxr.free-electrons.com/source/arch/arm64/kernel/traps.c#L140

Thanks,
Matt
