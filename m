Received: from mailapp01.imgtec.com ([195.59.15.196]:48663 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27010619AbbAPPn7DYm1u (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 16 Jan 2015 16:43:59 +0100
Message-ID: <54B931B8.5050903@imgtec.com>
Date: Fri, 16 Jan 2015 15:43:52 +0000
From: Markos Chandras <Markos.Chandras@imgtec.com>
MIME-Version: 1.0
Subject: Re: [PATCH] MIPS,prctl: add PR_[GS]ET_FP_MODE prctl options for MIPS
References: <1420719457-690-1-git-send-email-paul.burton@imgtec.com> <54B519B6.5040604@imgtec.com>
In-Reply-To: <54B519B6.5040604@imgtec.com>
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
To: Paul Burton <paul.burton@imgtec.com>, linux-mips@linux-mips.org
Cc: Matthew Fortune <matthew.fortune@imgtec.com>, LKML <linux-kernel@vger.kernel.org>, linux-api@vger.kernel.org
Message-ID: <20150116154352.Q9yydCbUGSceQDHPq7oAizf8Hb393PPGhKKVL5OjwCc@z>

On 01/13/2015 01:12 PM, Markos Chandras wrote:
> On 01/08/2015 12:17 PM, Paul Burton wrote:
>> Userland code may be built using an ABI which permits linking to objects
>> that have more restrictive floating point requirements. For example,
>> userland code may be built to target the O32 FPXX ABI. Such code may be
>> linked with other FPXX code, or code built for either one of the more
>> restrictive FP32 or FP64. When linking with more restrictive code, the
>> overall requirement of the process becomes that of the more restrictive
>> code. The kernel has no way to know in advance which mode the process
>> will need to be executed in, and indeed it may need to change during
>> execution. The dynamic loader is the only code which will know the
>> overall required mode, and so it needs to have a means to instruct the
>> kernel to switch the FP mode of the process.
>>
>> This patch introduces 2 new options to the prctl syscall which provide
>> such a capability. The FP mode of the process is represented as a
>> simple bitmask combining a number of mode bits mirroring those present
>> in the hardware. Userland can either retrieve the current FP mode of
>> the process:
>>
>>   mode = prctl(PR_GET_FP_MODE);
>> [...]
>> +int mips_set_process_fp_mode(struct task_struct *task, unsigned int value)
>> +{
>> +	const unsigned int known_bits = PR_FP_MODE_FR | PR_FP_MODE_FRE;
>> +	unsigned long switch_count;
>> +	struct task_struct *t;
>> +
>> +	/* Check the value is valid */
>> +	if (value & ~known_bits)
>> +		return -EOPNOTSUPP;
>> +
>> +	/* Avoid inadvertently triggering emulation */
>> +	if ((value & PR_FP_MODE_FR) && cpu_has_fpu &&
>> +	    !(current_cpu_data.fpu_id & MIPS_FPIR_F64))
>> +		return -EOPNOTSUPP;
>> +	if ((value & PR_FP_MODE_FRE) && !cpu_has_fre)
>> +		return -EOPNOTSUPP;
>> +

Hi Paul,

Do you think you can address this[1] suggestion by Matthew in this patch
since this hasn't been merged yet? Thanks

[1] http://www.linux-mips.org/archives/linux-mips/2015-01/msg00265.html

-- 
markos
