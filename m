Received: from 19pmail.ess.barracuda.com ([64.235.154.231]:52968 "EHLO
        19pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23992334AbdKNPo0CqAJ0 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 14 Nov 2017 16:44:26 +0100
Subject: Re: [PATCH] MIPS: ath25: Avoid undefined early_serial_setup() without
 SERIAL_8250_CONSOLE
References: <1510666157-27252-1-git-send-email-matt.redfearn@mips.com>
 <20171114140534.GA14698@linux-mips.org>
From: Matt Redfearn <matt.redfearn@mips.com>
Message-ID: <c3c985db-3ad7-d5f3-8d3a-065a458b6900@mips.com>
Date: Tue, 14 Nov 2017 15:43:43 +0000
MIME-Version: 1.0
In-Reply-To: <20171114140534.GA14698@linux-mips.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Return-Path: <Matt.Redfearn@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Ralf Baechle <ralf@linux-mips.org>
Cc: James Hogan <james.hogan@mips.com>, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Philippe Ombredanne <pombredanne@nexb.com>, Kate Stewart <kstewart@linuxfoundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Message-ID: <20171114154343.klKKnHMHkC09N1Cf-7I5D8l2DEOfewN1xA0ZQOcNvsg@z>



On 14/11/17 14:05, Ralf Baechle wrote:
> On Tue, Nov 14, 2017 at 01:29:17PM +0000, Matt Redfearn wrote:
> 
>> Currently MIPS allnoconfig with CONFIG_ATH25=y fails to link due to
>> missing support for early_serial_setup():
>>
>>    LD      vmlinux
>> arch/mips/ath25/devices.o: In function ath25_serial_setup':
>> devices.c:(.init.text+0x68): undefined reference to 'early_serial_setup'
>>
>> Rather than adding dependencies to the platform to force inclusion of
>> SERIAL_8250_CONSOLE together with it's dependencies like TTY, HAS_IOMEM,
>> etc, just make ath25_serial_setup() a no-op when the dependency is not
>> selected in the kernel config.
> 
> Looks like arch/mips/rb532/serial.c might be suffering from the same
> issue?

Hi Ralf!

Indeed it does, and another unmet dependency. Patches incoming.

Thanks,
Matt

> 
>    Ralf
> 
