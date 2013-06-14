Received: from multi.imgtec.com ([194.200.65.239]:19078 "EHLO multi.imgtec.com"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S6822998Ab3FNI0Ywnz7X (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Fri, 14 Jun 2013 10:26:24 +0200
Message-ID: <51BAD3B0.9060605@imgtec.com>
Date: Fri, 14 Jun 2013 09:26:24 +0100
From: Markos Chandras <Markos.Chandras@imgtec.com>
MIME-Version: 1.0
Subject: Re: [PATCH] MIPS: Kconfig: Select USB_EHCI_HCD if USB_SUPPORt is
 enabled
References: <1371138134-21216-1-git-send-email-markos.chandras@imgtec.com> <51B9F634.30506@gmail.com>
In-Reply-To: <51B9F634.30506@gmail.com>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-Path: <Markos.Chandras@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: David Daney <ddaney.cavm@gmail.com>
Cc: USB list <linux-usb@vger.kernel.org>, Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org
Message-ID: <20130614082624.nGElQxuV62lNFsqbY5uQIREtOJ_kXTXqI2BI_eBZuw4@z>

On 06/13/13 17:41, David Daney wrote:
> On 06/13/2013 08:42 AM, Markos Chandras wrote:
>> Commit 94d83649e1c2f25c87dc4ead9c2ab073305
>> "USB: remove USB_EHCI_BIG_ENDIAN_{DESC,MMIO} depends on architecture
>> symbol"
>>
>> caused the following regression in cavium_octeon_defconfig:
>>
>> warning: (MIPS_SEAD3 && PMC_MSP && CPU_CAVIUM_OCTEON) selects
>> USB_EHCI_BIG_ENDIAN_MMIO which has unmet direct dependencies
>> (USB_SUPPORT && USB && USB_EHCI_HCD)
>>
>> We fix this problem by selecting the USB_EHCI_HCD missing dependency
>> if USB_SUPPORT is enabled.
>>
>> Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
>> Acked-by: Steven J. Hill <Steven.Hill@imgtec.com>
>
> NAK.  This is incorrect.
>
> It is completely backwards and forces us to have EHCI unconditionally.
>
> The proper fix is to move USB_EHCI_BIG_ENDIAN_MMIO (and similar other
> Kconifg variables) out of the conditional section and make them
> universally visible/usable.
>
> David Daney
>
>

Hi David,

Thanks. I will prepare a new patch.

-- 
markos
