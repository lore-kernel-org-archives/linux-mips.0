Received: from mailapp01.imgtec.com ([195.59.15.196]:41908 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27008691AbbCMPlwKo5RU (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 13 Mar 2015 16:41:52 +0100
Message-ID: <55030539.6070803@imgtec.com>
Date: Fri, 13 Mar 2015 15:41:45 +0000
From: Markos Chandras <Markos.Chandras@imgtec.com>
MIME-Version: 1.0
Subject: Re: [PATCH] MIPS: mm: tlbex: Replace cpu_has_mips_r2_exec_hazard
 with cpu_has_mips_r2_r6
References: <1424731974-27926-1-git-send-email-ddaney.cavm@gmail.com> <1426238288-15560-1-git-send-email-markos.chandras@imgtec.com> <20150313144443.GA12977@linux-mips.org>
In-Reply-To: <20150313144443.GA12977@linux-mips.org>
Content-Type: text/plain; charset="windows-1252"
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
To: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org, David Daney <david.daney@cavium.com>
Message-ID: <20150313154145.muNbAGsaci2nESH5QV1f7CRAxbI08-UckyFotGfhxmQ@z>

Hi,

On 03/13/2015 02:44 PM, Ralf Baechle wrote:
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

Indeed that looks an old regression. Thanks for spotting that.

> 
> #define cpu_has_mips_r2_exec_hazard					\
> ({									\
> 	int __res;							\
> 									\
> 	switch (current_cpu_type()) {					\
> 	case CPU_M14KC:							\
> 	case CPU74K:							\

More MIPS/IMG cores need to be added here but ok

> 	case CPU_CAVIUM_OCTEON:						\
> 	case CPU_CAVIUM_OCTEON_PLUS:					\
>         case CPU_CAVIUM_OCTEON2:					\
> 	case CPU_CAVIUM_OCTEON3:					\
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

Overall, that looks like a good solution to me

-- 
markos
