Received: from us01smtprelay-2.synopsys.com ([198.182.47.9]:58710 "EHLO
        smtprelay.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23991346AbcIHSfclMkk0 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 8 Sep 2016 20:35:32 +0200
Subject: Re: [PATCH] atomic64: No need for
 CONFIG_ARCH_HAS_ATOMIC64_DEC_IF_POSITIVE
References: <1473352098-5822-1-git-send-email-vgupta@synopsys.com>
 <20160908181905.GY10153@twins.programming.kicks-ass.net>
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Message-ID: <a37b81a2-9634-255e-b20b-51e75913cb40@synopsys.com>
Date: Thu, 8 Sep 2016 11:34:29 -0700
MIME-Version: 1.0
In-Reply-To: <20160908181905.GY10153@twins.programming.kicks-ass.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-Path: <Vineet.Gupta1@synopsys.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Peter Zijlstra <peterz@infradead.org>
Cc: "linux-mips@linux-mips.org" <linux-mips@linux-mips.org>, Catalin Marinas <catalin.marinas@arm.com>, Linus Walleij <linus.walleij@linaro.org>, Alexey Brodkin <Alexey.Brodkin@synopsys.com>, Heiko Carstens <heiko.carstens@de.ibm.com>, "James E.J. Bottomley" <jejb@parisc-linux.org>, Paul Mackerras <paulus@samba.org>, "H. Peter Anvin" <hpa@zytor.com>, "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>, "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>, "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, Andi Kleen <ak@linux.intel.com>, Herbert Xu <herbert@gondor.apana.org.au>, Michael Ellerman <mpe@ellerman.id.au>, Helge Deller <deller@gmx.de>, "x86@kernel.org" <x86@kernel.org>, Russell King <linux@armlinux.org.uk>, Ingo Molnar <mingo@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Matthew Wilcox <willy@linux.intel.com>, Matt Turner <mattst88@gmail.com>, Borislav Petkov <bp@suse.de>, Ming Lin <ming.l@ssi.samsung.com>, Chris Metcalf <cmetcalf@mellanox.com>, Arnd Bergmann <arnd@arndb.de>, Will Deacon <will.deacon@arm.com>, Boqun Feng <boqun.feng@gmail.com>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Zhaoxiu Zeng <zhaoxiu.zeng@gmail.com>, Andrey Ryabinin <aryabinin@virtuozzo.com>, Thomas Gleixner <tglx@linutronix.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Richard Henderson <rth@twiddle.net>, "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>, "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Ralf Baechle <ralf@linux-mips.org>, "linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>, Martin Schwidefsky <schwidefsky@de.ibm.com>, Alexander Potapenko <glider@google.com>, Andrew Morton <akpm@linux-foundation.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "David S. Miller" <davem@davemloft.net>
Message-ID: <20160908183429.Iqc_RT-lrElJ2_1UG-otAXBiL7RM4G6nzIXAAtkNPMM@z>

On 09/08/2016 11:19 AM, Peter Zijlstra wrote:
> On Thu, Sep 08, 2016 at 09:28:18AM -0700, Vineet Gupta wrote:
>> This came to light when implementing native 64-bit atomics for ARCv2.
>>
>> The atomic64 self-test code uses CONFIG_ARCH_HAS_ATOMIC64_DEC_IF_POSITIVE
>> to check whether atomic64_dec_if_positive() is available.
>> It seems it was needed when not every arch defined it.
>> However as of current code the Kconfig option seems needless
>>
>> - for CONFIG_GENERIC_ATOMIC64 it is auto-enabled in lib/Kconfig and a
>>   generic definition of API is present lib/atomic64.c
>> - arches with native 64-bit atomics select it in arch/*/Kconfig and
>>   define the API in their headers
>>
>> So I see no point in keeping the Kconfig option
>>
>> Compile tested for 2 representatives:
>>  - blackfin (CONFIG_GENERIC_ATOMIC64)
>>  - x86 (!CONFIG_GENERIC_ATOMIC64)
>>
>> Also logistics wise it seemed simpler to just do this in 1 patch vs.
>> splitting per arch - but I can break it up if maintainer feel that
>> is better to avoid conflicts.
> Works for me; you want me to take this, or do you need it for you ARCv2
> patches?

Please do. ARCv2 patch (following shortly) doesn't need it - I selected the
option in orig patch - which I can just take out.

Thx,
-Vineet
