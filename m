Received: from mailapp01.imgtec.com ([195.59.15.196]:3276 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23992285AbcLGJZ7zbCtt (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 7 Dec 2016 10:25:59 +0100
Subject: Re: [PATCH 1/5] MIPS: Introduce irq_stack
References: <1480685957-18809-1-git-send-email-matt.redfearn@imgtec.com>
 <1480685957-18809-2-git-send-email-matt.redfearn@imgtec.com>
 <CAHmME9pFdLALj9sigunS7Uk+NqJi4GcoUGP+Tgpbku0v1ADk=w@mail.gmail.com>
From: Matt Redfearn <matt.redfearn@imgtec.com>
Message-ID: <09b9fc86-d2ed-6d97-4b46-0d526da68a8c@imgtec.com>
Date: Wed, 7 Dec 2016 09:25:53 +0000
MIME-Version: 1.0
In-Reply-To: <CAHmME9pFdLALj9sigunS7Uk+NqJi4GcoUGP+Tgpbku0v1ADk=w@mail.gmail.com>
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
Cc: Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org, Thomas Gleixner <tglx@linutronix.de>, Paolo Bonzini <pbonzini@redhat.com>, Chris Metcalf <cmetcalf@mellanox.com>, Petr Mladek <pmladek@suse.com>, LKML <linux-kernel@vger.kernel.org>, James Hogan <james.hogan@imgtec.com>, Paul Burton <paul.burton@imgtec.com>, Aaron Tomlin <atomlin@redhat.com>, Andrew Morton <akpm@linux-foundation.org>
Message-ID: <20161207092553.wRI2BOgocxJXV_CqHGusK6U8wqHni3QOXnGjBPEI7K0@z>

Hi Jason,


On 06/12/16 22:13, Jason A. Donenfeld wrote:
> On Fri, Dec 2, 2016 at 2:39 PM, Matt Redfearn <matt.redfearn@imgtec.com> wrote:
>> +void *irq_stack[NR_CPUS];
> I'm curious why you implemented it this way rather than using
> DEFINE_PER_CPU and the related percpu helper functions.
Because in the IRQ entry point in assembler we have to look up the 
address of this CPU's IRQ stack. Doing so with a simple array can be 
done with fewer instructions than a per-cpu variable. The kernel stack 
pointer for each CPU is held in a similar array.

MIPS does not have a particularly optimized per-cpu implementation with 
the per-cpu offset being held somewhere easily accessible, so right now 
it has be looked up from the __per_cpu_offset array, and then applied to 
the per-cpu pointer. Obviously doing the first lookup is analogous to 
what I am doing, and the subsequent application to the per-cpu pointer 
would be additional instructions.

Thanks,
Matt
