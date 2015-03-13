Received: from mail-bn1on0071.outbound.protection.outlook.com ([157.56.110.71]:60623
        "EHLO na01-bn1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S27006887AbbCMPqPhkwxK (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Fri, 13 Mar 2015 16:46:15 +0100
Message-ID: <5503063B.5000104@caviumnetworks.com>
Date: Fri, 13 Mar 2015 08:46:03 -0700
From: David Daney <ddaney@caviumnetworks.com>
MIME-Version: 1.0
Subject: Re: [PATCH] MIPS: mm: tlbex: Replace cpu_has_mips_r2_exec_hazard
 with cpu_has_mips_r2_r6
References: <1424731974-27926-1-git-send-email-ddaney.cavm@gmail.com> <1426238288-15560-1-git-send-email-markos.chandras@imgtec.com> <20150313144443.GA12977@linux-mips.org>
In-Reply-To: <20150313144443.GA12977@linux-mips.org>
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
Cc: Markos Chandras <markos.chandras@imgtec.com>, linux-mips@linux-mips.org, David Daney <david.daney@cavium.com>
Message-ID: <20150313154603.QB8yz0IngJFnoMf_scZn6eP8cnEQTdFTO9jSMpE1SpA@z>

On 03/13/2015 07:44 AM, Ralf Baechle wrote:
> On Fri, Mar 13, 2015 at 09:18:08AM +0000, Markos Chandras wrote:
>
>> Commit 77f3ee59ee7cf ("MIPS: mm: tlbex: Use cpu_has_mips_r2_exec_hazard
>> for the EHB instruction") replaced cpu_has_mips_r2 with
>> cpu_has_mips_r2_exec_hazard to indicate whether the ISA has the EHB
>> instruction. However, the meaning of the cpu_has_mips_r2_exec_hazard
>> is different. It was meant to be used as an indication on whether the
>> running processor needs to run the EHB instruction instead of checking
>> whether the EHB is available on the ISA. This broke processors that do
>> not define cpu_has_mips_r2_exec_hazard. We fix this by replacing the
>> said macro with cpu_has_mips_r2_r6 which covers R2 and R6 processors.
>>
>> Fixes: 77f3ee59ee7cf ("MIPS: mm: tlbex: Use cpu_has_mips_r2_exec_hazard for the EHB instruction")
>> Cc: David Daney <david.daney@cavium.com>
>> Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
>
> Either of this David's revert or this patch applied will leave
> cpu_has_mips_r2_exec_hazard unused which at a glance doesn't seem to
> be right and defeats David's old patches 9e290a19 / 41f0e4d0 from working.
>
> cpu_has_mips_r2_exec_hazard was made unused by 625c0a21 which I think
> should be reverted and cpu_has_mips_r2_exec_hazard be defined to be something
> like
>
> #define cpu_has_mips_r2_exec_hazard					\
> ({									\
> 	int __res;							\
> 									\
> 	switch (current_cpu_type()) {					\
> 	case CPU_M14KC:							\
> 	case CPU74K:							\
> 	case CPU_CAVIUM_OCTEON:						\
> 	case CPU_CAVIUM_OCTEON_PLUS:					\
>          case CPU_CAVIUM_OCTEON2:					\
> 	case CPU_CAVIUM_OCTEON3:					\

The four octeon models are already covered in 
arch/mips/include/asm/mach-cavium-octeon/cpu-feature-overrides.h

> 		__res = 0;						\
> 		break;							\
> 									\
> 	default:							\
> 		__res = 1;						\
> 	}								\
> 									\
> 	__res;								\
> })
>
> ?
>

Something like that is needed somewhere

I would suggest having the default definition contain some 
generalizations about where it should return true, and 
arch/mips/include/asm/mach-*/cpu-feature-overrides.h isolate the 
specific models for each sub-architecture.

David Daney

>    Ralf
>
