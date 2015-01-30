Received: from mailapp01.imgtec.com ([195.59.15.196]:61391 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27011201AbbA3Q1IIKVsg (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 30 Jan 2015 17:27:08 +0100
Message-ID: <54CBB0D4.1040506@imgtec.com>
Date: Fri, 30 Jan 2015 16:27:00 +0000
From: Markos Chandras <Markos.Chandras@imgtec.com>
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] MIPS: Makefile: Set correct ISA level for MIPS ASEs
References: <1422629056-27715-1-git-send-email-markos.chandras@imgtec.com> <alpine.LFD.2.11.1501301606470.28301@eddie.linux-mips.org>
In-Reply-To: <alpine.LFD.2.11.1501301606470.28301@eddie.linux-mips.org>
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
To: "Maciej W. Rozycki" <macro@linux-mips.org>
Cc: linux-mips@linux-mips.org
Message-ID: <20150130162700.5wvUDd_L6gVF8mmoiOrlDtpw0a0-DAcUwsPdc-Rdx8c@z>

On 01/30/2015 04:20 PM, Maciej W. Rozycki wrote:
> On Fri, 30 Jan 2015, Markos Chandras wrote:
> 
>> @@ -131,14 +131,14 @@ cflags-$(CONFIG_CPU_LITTLE_ENDIAN)	+= $(shell $(CC) -dumpmachine |grep -q 'mips.
>>  # Warning: the 64-bit MIPS architecture does not support the `smartmips' extension
>>  # Pass -Wa,--no-warn to disable all assembler warnings until the kernel code has
>>  # been fixed properly.
>> -cflags-$(CONFIG_CPU_HAS_SMARTMIPS)	+= $(call cc-option,-msmartmips) -Wa,--no-warn
>> -cflags-$(CONFIG_CPU_MICROMIPS) += $(call cc-option,-mmicromips)
>> +cflags-$(CONFIG_CPU_HAS_SMARTMIPS)	+= $(call cc-option,-march=mips32r2 -msmartmips) -Wa,--no-warn
>> +cflags-$(CONFIG_CPU_MICROMIPS) += $(call cc-option,-march=mips32r2 -mmicromips)
> 
>  The SmartMIPS ASE has been there since r1, e.g. the 4KSd core so you want 
> to allow `-march=mips32', but also `-march=mips32r2' if running on earlier 
> processors is not needed.
> 
>  I think to ensure the right ISA option has been selected it will be the 
> best to make it happen in Kconfig, by making CPU_HAS_SMARTMIPS and 
> CPU_MICROMIPS depend on the right CPU selection option.  Have you 
> considered such an approach (and disregarded it for some reason)?

I considered it but i thought passing something sane to $(call
cc-option) might be preferred. What I am trying to do here is to ensure
the $(call cc-option) will not fail in case your toolchain really
supports micromips or smartmips but when combined with a bad default it
simply fails

> 
>>  
>>  cflags-$(CONFIG_SB1XXX_CORELIS)	+= $(call cc-option,-mno-sched-prolog) \
>>  				   -fno-omit-frame-pointer
>>  
>>  ifeq ($(CONFIG_CPU_HAS_MSA),y)
>> -toolchain-msa	:= $(call cc-option-yn,-mhard-float -mfp64 -Wa$(comma)-mmsa)
>> +toolchain-msa	:= $(call cc-option-yn,-march=mips32r2 -mhard-float -mfp64 -Wa$(comma)-mmsa)
>>  cflags-$(toolchain-msa)		+= -DTOOLCHAIN_SUPPORTS_MSA
>>  endif
> 
>  Similarly here, is CPU_HAS_MSA incompatible with `-march=mips64r2'?
I am not sure but like I explained above, it does not have to be 100%
accurate. Just something to keep your toolchain happy and really enable
MSA support even if you happen and old ISA level as the default one for
your toolchain.

for example, if your toolchain has -march=mips2 as default then

-mhard-float -mfp64 will fail

but

-march=mips32r2 -mhard-float -mfp64

will pass. Your toolchain does support MSA, but because you combined the
check with incompatible flags, then the end result is not what you want.

I am open to suggestions if you want to solve this in a better way.

-- 
markos
