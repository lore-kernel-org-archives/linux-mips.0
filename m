Received: from mail-by2lp0243.outbound.protection.outlook.com ([207.46.163.243]:8275
        "EHLO na01-by2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S6823043Ab3I3VIqSvWo2 (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Mon, 30 Sep 2013 23:08:46 +0200
Message-ID: <5249E84F.2070008@caviumnetworks.com>
Date: Mon, 30 Sep 2013 14:08:31 -0700
From: David Daney <ddaney@caviumnetworks.com>
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] staging: octeon-ethernet: don't assume that CPU 0
 is special
References: <1380397834-14286-1-git-send-email-aaro.koskinen@iki.fi> <5249B37E.4050000@caviumnetworks.com> <20130930193502.GE4572@blackmetal.musicnaut.iki.fi> <5249D407.2090904@caviumnetworks.com> <20130930195642.GF4572@blackmetal.musicnaut.iki.fi>
In-Reply-To: <20130930195642.GF4572@blackmetal.musicnaut.iki.fi>
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
Cc: devel@driverdev.osuosl.org, linux-mips@linux-mips.org, David Daney <david.daney@cavium.com>, richard@nod.at, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Message-ID: <20130930210831.iJKYyQPxIVqYAHWlQLnPDATs6Qu42xUfkn6nsnGZJFc@z>

On 09/30/2013 12:56 PM, Aaro Koskinen wrote:
> Hi,
>
> On Mon, Sep 30, 2013 at 12:41:59PM -0700, David Daney wrote:
>> On 09/30/2013 12:35 PM, Aaro Koskinen wrote:
>>> No, the original logic was already broken. The code assumed that the
>>> NAPI scheduled by the driver init gets executed always on CPU 0. The
>>> IRQ got enabled just because we are lucky.
>>
>> No.  The default affinity for all irqs is CPU0 for just this reason.
>> So there was no luck involved.
>
> According the Kconfig, this driver can be compiled as a module:
>
>> config OCTEON_ETHERNET
>> 	tristate "Cavium Networks Octeon Ethernet support"
> [...]
>> 	To compile this driver as a module, choose M here.  The module
>> 	will be called octeon-ethernet.
>
> What guarantees that CPU0 is around (or the smp_affinity is at its
> default value) by the time user executes modprobe?

Nothing enforced by the kernel.  Just don't take CPU0 off-line and you 
should be good to go.

There is a lot of room for improvement in the driver.

Really this whole thing of starting NAPI on multiple CPUs for the same 
input queue is not good.  It leads to loss of packet ordering when 
forwarding.

What we really want is to have one POW group (input queue) per CPU and 
only run one CPU per group.  If we did that, we wouldn't have all these 
affinity issues.

David Daney
