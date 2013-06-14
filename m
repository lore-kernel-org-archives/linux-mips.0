Received: from mail-bl2lp0206.outbound.protection.outlook.com ([207.46.163.206]:9668
        "EHLO na01-bl2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S6825866Ab3FNRvIDAl2C (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Fri, 14 Jun 2013 19:51:08 +0200
Message-ID: <51BB57F4.9000106@caviumnetworks.com>
Date: Fri, 14 Jun 2013 10:50:44 -0700
From: David Daney <ddaney@caviumnetworks.com>
MIME-Version: 1.0
Subject: Re: [PATCH] MIPS/OCTEON: Override default address space layout.
References: <1371157847-17066-1-git-send-email-ddaney.cavm@gmail.com> <20130614084125.GA11911@linux-mips.org>
In-Reply-To: <20130614084125.GA11911@linux-mips.org>
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
Cc: David Daney <ddaney.cavm@gmail.com>, linux-mips@linux-mips.org, David Daney <david.daney@cavium.com>
Message-ID: <20130614175044.id88CHf__DaWKtBFX0rtwqPliCISjJlekgeo5_D569g@z>

On 06/14/2013 01:41 AM, Ralf Baechle wrote:
> On Thu, Jun 13, 2013 at 02:10:47PM -0700, David Daney wrote:
>
>> From: David Daney <david.daney@cavium.com>
>>
>> OCTEON II cannot execute code in the default CAC_BASE space, so we
>> supply a value (0x8000000000000000) that does work.
>>
>> Signed-off-by: David Daney <david.daney@cavium.com>
>
> Thanks, applied.
>
> I assume this also should be applied to all -stable branches?
>

It is really only needed in conjunction with kexec, and that is somewhat 
broken at the moment

David.
