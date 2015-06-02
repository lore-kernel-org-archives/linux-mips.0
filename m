Received: from mailapp01.imgtec.com ([195.59.15.196]:2893 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27007056AbbFBSVK17Nh4 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 2 Jun 2015 20:21:10 +0200
Message-ID: <556DF408.2040003@imgtec.com>
Date: Tue, 2 Jun 2015 11:20:56 -0700
From: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>
MIME-Version: 1.0
Subject: Re: [PATCH 1/3] MIPS: R6: Use lightweight SYNC instruction in smp_*
 memory barriers
References: <20150602000818.6668.76632.stgit@ubuntu-yegoshin> <20150602000934.6668.43645.stgit@ubuntu-yegoshin> <20150602100835.GG24014@NP-P-BURTON> <20150602121227.GA1474@macpro.local>
In-Reply-To: <20150602121227.GA1474@macpro.local>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-Path: <Leonid.Yegoshin@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>, Paul Burton <paul.burton@imgtec.com>
Cc: linux-mips@linux-mips.org, benh@kernel.crashing.org, will.deacon@arm.com, linux-kernel@vger.kernel.org, ralf@linux-mips.org, markos.chandras@imgtec.com, macro@linux-mips.org, Steven.Hill@imgtec.com, alexander.h.duyck@redhat.com, davem@davemloft.net
Message-ID: <20150602182056.ldvMbsIcszjJEFjKje_GwHv5BOJKEIx13JfrHlyAU8I@z>

On 06/02/2015 05:12 AM, Luc Van Oostenryck wrote:
> On Tue, Jun 02, 2015 at 11:08:35AM +0100, Paul Burton wrote:
>
>> I think this would read better as something like:
>>
>>    If a processor does not implement the lightweight sync operations then
>>    the architecture requires that they interpret the corresponding sync
>>    instructions as the typical heavyweight "sync 0". Therefore this
>>    should be safe to enable on all CPUs implementing release 2 or
>>    later of the MIPS architecture.
>>
> Is it really the case for release 2?
>
> I'm asking because recently I needed to do something similar and I couldn't
> find this garantee in the revision 2.00 of the manual.
Yes. MD00086/MD00084/MD00087 Rev 2.60 are technically MIPS R2. And this 
revision explicitly lists optional codes and it has a clear statement:

> Implementations that do not use any of the non-zero values of stype to 
> define different barriers, such as ordering bar-
> riers, must make those stype values act the same as stype zero.

(don't blame me that Rev 2.60 is 5 years after initial 2.00, it is still 
MIPS R2).

- Leonid.
