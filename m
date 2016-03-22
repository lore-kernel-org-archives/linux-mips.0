Received: from mail-bn1on0082.outbound.protection.outlook.com ([157.56.110.82]:51857
        "EHLO na01-bn1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S27006641AbcCVShtPp4Ch (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Tue, 22 Mar 2016 19:37:49 +0100
Message-ID: <56F190F2.9090300@caviumnetworks.com>
Date: Tue, 22 Mar 2016 11:37:38 -0700
From: David Daney <ddaney@caviumnetworks.com>
MIME-Version: 1.0
Subject: Re: FROZEN transitions in hotplug notifier
References: <alpine.DEB.2.11.1603221822560.30089@hypnos> <20160322183350.GC1670@linux-mips.org>
In-Reply-To: <20160322183350.GC1670@linux-mips.org>
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
To: Ralf Baechle <ralf@linux-mips.org>, Anna-Maria Gleixner <anna-maria@linutronix.de>
Cc: linux-mips@linux-mips.org, rt@linutronix.de
Message-ID: <20160322183738.uVgp4Wn3Zckdwjavaalbeizq5sGfGSndWl1Lr039t_U@z>

On 03/22/2016 11:33 AM, Ralf Baechle wrote:
> Hello Anna-Maria :)
>
> On Tue, Mar 22, 2016 at 06:24:20PM +0100, Anna-Maria Gleixner wrote:
>
>> the hotplug notifier in arch/mips/cavium-octeon/smp.c doesn't handle
>> the corresponding FROZEN transitions. Is there a reason for it?
>
> My guess would be bitrot.
>
> David?

That is correct.

We have some updates to the CPU hotplug code that may improve things, 
but its current state is definitely bitrotten.

David.
