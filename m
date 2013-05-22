Received: from co9ehsobe002.messaging.microsoft.com ([207.46.163.25]:48940
        "EHLO co9outboundpool.messaging.microsoft.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S6835040Ab3EVQOHKFq15 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 22 May 2013 18:14:07 +0200
Message-ID: <519CEEBE.5020403@caviumnetworks.com>
Date: Wed, 22 May 2013 09:13:50 -0700
From: David Daney <ddaney@caviumnetworks.com>
MIME-Version: 1.0
Subject: Re: [PATCH] MIPS: OCTEON: Rename Kconfig CAVIUM_OCTEON_REFERENCE_BOARD
 to CAVIUM_OCTEON_SOC
References: <1369088378-13957-1-git-send-email-ddaney.cavm@gmail.com> <20130521220457.GF31836@blackmetal.musicnaut.iki.fi> <519BF01B.1010600@caviumnetworks.com> <20130522122232.GD10769@linux-mips.org>
In-Reply-To: <20130522122232.GD10769@linux-mips.org>
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
To: Ralf Baechle <ralf@linux-mips.org>
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>, David Daney <ddaney.cavm@gmail.com>, linux-mips@linux-mips.org, David Daney <david.daney@cavium.com>, linux-ide@vger.kernel.org, linux-edac@vger.kernel.org, linux-i2c@vger.kernel.org, netdev@vger.kernel.org, spi-devel-general@lists.sourceforge.net, devel@driverdev.osuosl.org, linux-usb@vger.kernel.org
Message-ID: <20130522161350.NCyRqt5Q8BQtpczYJp_bqbmEQGw4gWgYs84oFKsksYQ@z>

On 05/22/2013 05:22 AM, Ralf Baechle wrote:
> On Tue, May 21, 2013 at 03:07:23PM -0700, David Daney wrote:
>
>>>>   config USB_OCTEON_OHCI
>>>>   	bool "Octeon on-chip OHCI support"
>>>> -	depends on CPU_CAVIUM_OCTEON
>>>> +	depends on  CAVIUM_OCTEON_SOC
>>>
>>> Just a minor comment, here the extra whitespace after "depends on"
>>> could be eliminated.
>>>
>>
>> Good point.  I will regenerate the patch to correct this.
>
> I took care of that and queued the patch.
>

Can you take v2 instead?  It has the missing watchdog adjustment that is 
not in v1.

Thanks,
David Daney
