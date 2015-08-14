Received: from mail-bn1bon0091.outbound.protection.outlook.com ([157.56.111.91]:41984
        "EHLO na01-bn1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S27012080AbbHNTuO3KzG9 (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Fri, 14 Aug 2015 21:50:14 +0200
Message-ID: <55CE4666.4050307@caviumnetworks.com>
Date: Fri, 14 Aug 2015 12:49:58 -0700
From: David Daney <ddaney@caviumnetworks.com>
MIME-Version: 1.0
Subject: Re: [PATCH 00/14] MIPS/staging: OCTEON: enable ethernet/xaui on CN68XX
References: <1439472106-7750-1-git-send-email-aaro.koskinen@nokia.com> <55CCED1B.6030701@caviumnetworks.com> <20150814130912.GR1199@ak-desktop.emea.nsn-net.net>
In-Reply-To: <20150814130912.GR1199@ak-desktop.emea.nsn-net.net>
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
To: Aaro Koskinen <aaro.koskinen@nokia.com>
Cc: Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org, Janne Huttunen <janne.huttunen@nokia.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devel@driverdev.osuosl.org
Message-ID: <20150814194958.nU_AQlpQ3wfGk1ORMOFBf6jtFqTeMieHa4vPaXo7wUI@z>

On 08/14/2015 06:09 AM, Aaro Koskinen wrote:
> Hi,
>
> On Thu, Aug 13, 2015 at 12:16:43PM -0700, David Daney wrote:
>> On 08/13/2015 06:21 AM, Aaro Koskinen wrote:
>>> Currently mainline Linux is unusable on OCTEON II CN68XX SOCs due to
>>> issues in Ethernet driver initialization. Some boards are hanging during
>>> init, and all the needed register differences compared to the older SOCs
>>> are not taken into account to make interrupts and packet delivery to work.
>>>
>>> This patch set provides a minimal support to get octeon-ethernet going
>>> on CN68XX. Tested on top of 4.2-rc6 with Cavium EBB6800 and Kontron
>>> S1901 boards by sending traffic over XAUI interface with busybox.
>>
>> You don't say how it was tested.
>>
>> Does OCTEON and OCTEON II networking continue to function?
>
> I tested today with EBH5600 (OCTEON+) as well and networking works
> as before.

Good, that is the main thing I was worried about.

>
>> There is no SSO provisioning, so there will be limited buffering on packet
>> ingress.  For low packet rates, it should be fine though.
>
> We are aware of limitations. However, I guess this should be added...
> I will take a look.
>

If what you have now works, I would merge this patch set, so:

Acked-by: David Daney <david.daney@cavium.com>


Follow-on improvements can be made with additional patches.

David Daney
