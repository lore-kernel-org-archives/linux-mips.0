Received: from ch1ehsobe004.messaging.microsoft.com ([216.32.181.184]:4221
        "EHLO ch1outboundpool.messaging.microsoft.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S6822681Ab3EVWhEKb0Lm (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 23 May 2013 00:37:04 +0200
Message-ID: <519D4883.9050905@caviumnetworks.com>
Date: Wed, 22 May 2013 15:36:51 -0700
From: David Daney <ddaney@caviumnetworks.com>
MIME-Version: 1.0
Subject: Re: [PATCH] MIPS: Enable interrupts before WAIT instruction.
References: <CA+55aFwDGyHOzu=Qh7SJOBK6QvAwAh7pMDL6LfMUE=AW_kapAw@mail.gmail.com> <1367527692-25809-1-git-send-email-ddaney.cavm@gmail.com> <20130522223225.GH31836@blackmetal.musicnaut.iki.fi>
In-Reply-To: <20130522223225.GH31836@blackmetal.musicnaut.iki.fi>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-Path: <David.Daney@caviumnetworks.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Aaro Koskinen <aaro.koskinen@iki.fi>
Cc: David Daney <ddaney.cavm@gmail.com>, linux-mips@linux-mips.org, ralf@linux-mips.org, Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, David Daney <david.daney@cavium.com>, Thomas Gleixner <tglx@linutronix.de>, Jonas Gorski <jogo@openwrt.org>
Message-ID: <20130522223651.pChl0SqoS7C7txbmEt0DZ7OYVDVRPg8XCWtiwH06wrY@z>

On 05/22/2013 03:32 PM, Aaro Koskinen wrote:
> Hi,
>
> On Thu, May 02, 2013 at 01:48:12PM -0700, David Daney wrote:
>> From: David Daney <david.daney@cavium.com>
>>
>> As noted by Thomas Gleixner:
>>
>>     commit cdbedc61c8 (mips: Use generic idle loop) broke MIPS as I did
>>     not realize that MIPS wants to invoke the wait instructions with
>>     interrupts enabled.
>>
>> Instead of enabling interrupts in arch_cpu_idle() as Thomas' initial
>> patch does, we follow Linus' suggestion of doing it in the assembly
>> code to prevent the compiler from rearranging things.
>>
>> Signed-off-by: David Daney <david.daney@cavium.com>
>> Reported-by: EunBong Song <eunb.song@samsung.com>
>> Cc: Thomas Gleixner <tglx@linutronix.de>
>> Cc: Jonas Gorski <jogo@openwrt.org>
>> ---
>>
>> This is only very lightly tested, we need more testing before
>> declaring it the definitive fix.
>
> I wonder what is the status of this patch? Or is there some alternative
> fix?
>
> I have Octeon+ board that hangs during 3.10-rc2 boot in spawn_ksoftirqd()
> without this. Also, this patch does not apply cleanly to 3.10-rc2
> anymore...
>
> A.
>

Ralf has an alternate fix here:

http://git.linux-mips.org/pub/scm/ralf/upstream-linus.git

If all goes well, it will be merged soon.

David Daney
