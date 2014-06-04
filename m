Received: from mail-bn1lp0145.outbound.protection.outlook.com ([207.46.163.145]:47075
        "EHLO na01-bn1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S6816071AbaFDRMtzG8rJ (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Wed, 4 Jun 2014 19:12:49 +0200
Message-ID: <538F5387.8000200@caviumnetworks.com>
Date: Wed, 4 Jun 2014 10:12:39 -0700
From: David Daney <ddaney@caviumnetworks.com>
MIME-Version: 1.0
Subject: Re: [1/3] MIPS: octeon: Add interface mode detection for Octeon II
References: <1401358203-60225-2-git-send-email-alex.smith@imgtec.com> <20140604144739.GB24816@ak-desktop.emea.nsn-net.net> <538F420A.60007@imgtec.com>
In-Reply-To: <538F420A.60007@imgtec.com>
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
To: Alex Smith <alex.smith@imgtec.com>
Cc: Aaro Koskinen <aaro.koskinen@nsn.com>, David Daney <david.daney@cavium.com>, linux-mips@linux-mips.org
Message-ID: <20140604171239._nRfYvz2bjog4lDvmyXfMthVop2vclMeRqRiIhmhRFo@z>

On 06/04/2014 08:58 AM, Alex Smith wrote:
> On 04/06/14 15:47, Aaro Koskinen wrote:
>> On Thu, May 29, 2014 at 11:10:01AM +0100, Alex Smith wrote:
>>> Add interface mode detection for Octeon II. This is necessary to detect
>>> the interface modes correctly on the UBNT E200 board. Code is taken
>>> from the UBNT GPL source release, with some alterations: SRIO, ILK and
>>> RXAUI interface modes are removed and instead return disabled as these
>>> modes are not currently supported.
>>>
>>> Tested-by: David Daney <david.daney@cavium.com>
>>> Signed-off-by: Alex Smith <alex.smith@imgtec.com>
>>
>> I tried booting ebb6800 board with these patches.

There seem to be problems (I think in the interrupt controller code) for 
cn68xx based systems in the kernel.org kernel.  So I couldn't get it to 
boot on my ebb6800 even to the point it tries to initialize the 
networking hardware.

Therefore ...

>>
>> It hangs somewhere in __cvmx_helper_xaui_enable() with XAUI port. Looking
>> at the UBNT GPL package, xaui init is quite different with 68XX specific
>> code paths.  Maybe those bits should be added too, or then disable XAUI
>> support as well?
>
> Probably the best thing to do for now would be to disable it. Does it
> boot successfully for you if you switch CVMX_HELPER_INTERFACE_MODE_XAUI
> to disabled?

... I don't think it matters.  The patch Alex et al. came up with is an 
improvement over what is already there.  The fact that there are still 
some configurations that don't work can be addressed with follow-on patches.

If I misunderstand the situation, please let me know, and we can work 
towards something better.

David Daney


>
> Alex
