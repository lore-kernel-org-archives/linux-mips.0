Received: from comal.ext.ti.com ([198.47.26.152]:35984 "EHLO comal.ext.ti.com"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S6824768Ab3GVOuwhcE8Q (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Mon, 22 Jul 2013 16:50:52 +0200
Message-ID: <51ED469A.9000801@ti.com>
Date: Mon, 22 Jul 2013 10:50:02 -0400
From: Santosh Shilimkar <santosh.shilimkar@ti.com>
MIME-Version: 1.0
Subject: Re: [PATCH v2] of: Specify initrd location using 64-bit
References: <1372702835-5333-1-git-send-email-santosh.shilimkar@ti.com> <51D1F5E2.6070609@gmail.com> <20130720053945.C7AC63E0C52@localhost>
In-Reply-To: <20130720053945.C7AC63E0C52@localhost>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-Path: <santosh.shilimkar@ti.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Grant Likely <grant.likely@linaro.org>
Cc: Rob Herring <robherring2@gmail.com>, Rob Herring <rob.herring@calxeda.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>, Vineet Gupta <vgupta@synopsys.com>, Russell King <linux@arm.linux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Mark Salter <msalter@redhat.com>, Aurelien Jacquiot <a-jacquiot@ti.com>, James Hogan <james.hogan@imgtec.com>, Michal Simek <monstr@monstr.eu>, Ralf Baechle <ralf@linux-mips.org>, Jonas Bonn <jonas@southpole.se>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, x86@kernel.org, arm@kernel.org, Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>, Nicolas Pitre <nicolas.pitre@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-c6x-dev@linux-c6x.org, linux-mips@linux-mips.org, linuxppc-dev@lists.ozlabs.org, linux-xtensa@linux-xtensa.org, devicetree-discuss@lists.ozlabs.org
Message-ID: <20130722145002.kztdtOuQsE8amqjvXhuQ-JxYCxdgZVIOpo6whNj8IDg@z>

On Saturday 20 July 2013 01:39 AM, Grant Likely wrote:
> On Mon, 01 Jul 2013 16:34:26 -0500, Rob Herring <robherring2@gmail.com> wrote:
>> On 07/01/2013 01:20 PM, Santosh Shilimkar wrote:
>>> On some PAE architectures, the entire range of physical memory could reside
>>> outside the 32-bit limit.  These systems need the ability to specify the
>>> initrd location using 64-bit numbers.
>>>
>>> This patch globally modifies the early_init_dt_setup_initrd_arch() function to
>>> use 64-bit numbers instead of the current unsigned long.
>>>
>>> There has been quite a bit of debate about whether to use u64 or phys_addr_t.
>>> It was concluded to stick to u64 to be consistent with rest of the device
>>> tree code. As summarized by Geert, "The address to load the initrd is decided
>>> by the bootloader/user and set at that point later in time. The dtb should not
>>> be tied to the kernel you are booting"
>>
>> That was quoting me. Otherwise:
>>
>> Acked-by: Rob Herring <rob.herring@calxeda.com>
>>
>> Unless Grant feels compelled to pick this up for 3.11, I think it has to
>> wait for 3.12.
> 
> Nope, 3.12 is fine. Applied.
> 
Thanks Grant.

Regards,
Santosh
