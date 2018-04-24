Received: from 9pmail.ess.barracuda.com ([64.235.150.225]:54068 "EHLO
        9pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23993885AbeDXNQD2R1qw (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 24 Apr 2018 15:16:03 +0200
Subject: Re: [RFC PATCH] MIPS: Oprofile: Drop support
References: <1524574554-7451-1-git-send-email-matt.redfearn@mips.com>
 <20180424130511.GB28813@saruman>
From: Matt Redfearn <matt.redfearn@mips.com>
Message-ID: <5e464a40-4e4d-dde4-b5b5-ceb637dc5f38@mips.com>
Date: Tue, 24 Apr 2018 14:15:58 +0100
MIME-Version: 1.0
In-Reply-To: <20180424130511.GB28813@saruman>
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
To: James Hogan <jhogan@kernel.org>
Cc: Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org, Huacai Chen <chenhc@lemote.com>, linux-kernel@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>, Krzysztof Kozlowski <krzk@kernel.org>, Robert Richter <rric@kernel.org>, oprofile-list@lists.sf.net
Message-ID: <20180424131558.3OkH3cgQj1PmHaguj0bdReOfUTlKHpKXlacUxv8OV70@z>



On 24/04/18 14:05, James Hogan wrote:
> On Tue, Apr 24, 2018 at 01:55:54PM +0100, Matt Redfearn wrote:
>> Since it appears that MIPS oprofile support is currently broken, core
>> oprofile is not getting many updates and not as many architectures
>> implement support for it compared to perf, remove the MIPS support.
> 
> That sounds reasonable to me. Any idea how long its been broken?

Sorry, not yet. I haven't yet looked into where/how it's broken that 
would narrow that down...

The other thing to bear in mind is that the userspace tools have not 
seen any MIPS additions since 2010, the last commit being to add 1004K 
and 34K support:
https://sourceforge.net/p/oprofile/oprofile/ci/master/tree/events/mips/

Though I'm not sure if anyone is maintaining a vendor specific fork 
containing further support.

> 
> I'll let it sit on the list for a bit in case anybody does object and
> wants to fix it instead.

Cool, sounds good.

Thanks,
Matt

> 
> Thanks
> James
> 
