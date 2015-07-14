Received: from mailapp01.imgtec.com ([195.59.15.196]:53341 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27009498AbbGNNHnQSjDh (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 14 Jul 2015 15:07:43 +0200
Subject: Re: [PATCH 6/7] MIPS: kernel: cps-vec: Use macros for various
 arithmetics and memory operations
References: <1435738414-30944-1-git-send-email-markos.chandras@imgtec.com>
 <1435738414-30944-7-git-send-email-markos.chandras@imgtec.com>
 <20150714124011.GH2519@NP-P-BURTON>
From: Markos Chandras <Markos.Chandras@imgtec.com>
Message-ID: <55A50998.4030308@imgtec.com>
Date: Tue, 14 Jul 2015 14:07:36 +0100
MIME-Version: 1.0
In-Reply-To: <20150714124011.GH2519@NP-P-BURTON>
Content-Type: text/plain; charset="utf-8"
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
To: Paul Burton <paul.burton@imgtec.com>
Cc: linux-mips@linux-mips.org, stable@vger.kernel.org
Message-ID: <20150714130736.UjDJ-PbBcGJ0gdo4rZGC-BFiXZWZuULyzQoktKntRLM@z>

On 07/14/2015 01:40 PM, Paul Burton wrote:
>> @@ -152,7 +152,7 @@ dcache_done:
>>  
>>  	/* Enter the coherent domain */
>>  	li	t0, 0xff
>> -	sw	t0, GCR_CL_COHERENCE_OFS(v1)
>> +	PTR_S	t0, GCR_CL_COHERENCE_OFS(v1)
> 
> Hi Markos,
> 
> I don't believe this is correct where accessing GCRs. Since you've
> pushed elsewhere to perform 32 bit accesses when running a 32 bit kernel
> on a MIPS64 core with CM3, can we just keep doing 32 bit accesses here?
> 

Hi Paul,

Yes. This patch is already upstream though. I will wait for the
'mips_cm_is64' to make it upstream as well and then I will submit a fix
for this one. It should not break anything at the moment. Thanks

-- 
markos
