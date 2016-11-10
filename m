Received: from mailapp01.imgtec.com ([195.59.15.196]:46179 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23993094AbcKJQgRiBk7B (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 10 Nov 2016 17:36:17 +0100
Subject: Re: Proposal: HAVE_SEPARATE_IRQ_STACK?
References: <CAHmME9oSUcAXVMhpLt0bqa9DKHE8rd3u+3JDb_wgviZnOpP7JA@mail.gmail.com>
 <alpine.DEB.2.20.1611092227200.3501@nanos>
 <CAHmME9pGoRogjHSSy-G-sB4-cHMGcjCeW9PSrNw1h5FsKzfWAw@mail.gmail.com>
 <alpine.DEB.2.20.1611100959040.3501@nanos>
 <CAHmME9pHYA82M3iDNfDtDE96gFaZORSsEAn_KnePd3rhFioqHQ@mail.gmail.com>
From: Matt Redfearn <matt.redfearn@imgtec.com>
Message-ID: <db056fb5-82b3-c17e-46ce-263872ef7334@imgtec.com>
Date: Thu, 10 Nov 2016 16:36:10 +0000
MIME-Version: 1.0
In-Reply-To: <CAHmME9pHYA82M3iDNfDtDE96gFaZORSsEAn_KnePd3rhFioqHQ@mail.gmail.com>
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
To: "Jason A. Donenfeld" <Jason@zx2c4.com>, Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, linux-mips@linux-mips.org, linux-mm@kvack.org, WireGuard mailing list <wireguard@lists.zx2c4.com>, k@vodka.home.kg
Message-ID: <20161110163610.W3M5FbyTubJzzpjsfuODrYvcLs4Qje1aNxIeuhFM_eM@z>

Hi Jason,


On 10/11/16 11:41, Jason A. Donenfeld wrote:
> On Thu, Nov 10, 2016 at 10:03 AM, Thomas Gleixner <tglx@linutronix.de> wrote:
>> If you want to go with that config, then you need
>> local_bh_disable()/enable() to fend softirqs off, which disables also
>> preemption.
> Thanks. Indeed this is what I want.
>
>>> What clever tricks do I have at my disposal, then?
>> Make MIPS use interrupt stacks.
> Yea, maybe I'll just implement this. It clearly is the most correct solution.
> @MIPS maintainers: would you merge something like this if done well?
> Are there reasons other than man-power why it isn't currently that
> way?

I don't see a reason not to do this - I'm taking a look into it.

Thanks,
Matt

>> Does the slowdown come from the kmalloc overhead or mostly from the less
>> efficient code?
>>
>> If it's mainly kmalloc, then you can preallocate the buffer once for the
>> kthread you're running in and be done with it. If it's the code, then bad
>> luck.
> I fear both. GCC can optimize stack variables in ways that it cannot
> optimize various memory reads and writes.
>
> Strangely, the solution that appeals to me most at the moment is to
> kmalloc (or vmalloc?) a new stack, copy over thread_info, and fiddle
> with the stack registers. I don't see any APIs, however, for a
> platform independent way of doing this. And maybe this is a horrible
> idea. But at least it'd allow me to keep my stack-based code the
> same...
>
