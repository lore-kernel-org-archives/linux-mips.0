Received: from mailapp01.imgtec.com ([195.59.15.196]:4843 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27012309AbbA3QwbgNh0G (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 30 Jan 2015 17:52:31 +0100
Message-ID: <54CBB6C5.6020806@imgtec.com>
Date: Fri, 30 Jan 2015 16:52:21 +0000
From: Markos Chandras <Markos.Chandras@imgtec.com>
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] MIPS: Makefile: Set default ISA level
References: <1422629056-27715-1-git-send-email-markos.chandras@imgtec.com> <1422629056-27715-2-git-send-email-markos.chandras@imgtec.com> <alpine.LFD.2.11.1501301621090.28301@eddie.linux-mips.org>
In-Reply-To: <alpine.LFD.2.11.1501301621090.28301@eddie.linux-mips.org>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 8bit
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
Cc: linux-mips@linux-mips.org, Matthew Fortune <Matthew.Fortune@imgtec.com>
Message-ID: <20150130165221.fhI6kQsBo8nnLY5JAEVFhxo6Pb3hSEPJAjE3q9zF8bw@z>

On 01/30/2015 04:37 PM, Maciej W. Rozycki wrote:
> On Fri, 30 Jan 2015, Markos Chandras wrote:
> 
>> When we configure the toolchain, we can set the default
>> ISA level to be used when none is set in the command line.
>> This, however, has some undesired consequences when the parameters
>> used in the command line are incompatible with the built-in ISA
>> level of the toolchain. In order to minimize such problems, we set
>> a good default ISA level if the Makefile hasn't set one for the
>> selected processor.
> 
>  Agreed, but does it happen for any actual configuration?  If so, then the 
> configuration is broken and your proposal papers over it, an explicit 
> `-march=' option is supposed to be there for all the possible CPU_foo 
> settings.  At first look it seems to be the case in arch/mips/Makefile, 
> but maybe I'm missing something.  Besides, a default of `-march=mips32' or 
> whatever may not really be adequate for the CPU selected.

We do have some tools around which default on -march=mips32r6. Then a
loongson3_defconfig build gives this

kernel/bounds.c:1:0: error: ‘-march=mips32r6’ is not compatible with the
selected ABI

and that's because in the command line you have no -march=XXXX because
there is none set for CPU_LOONGSON3

this is the case I've spotted so far, but if you say that *every* CPU_
symbol needs to set good cflags then this needs to be addressed in a
different way I suppose.

> 
>> diff --git a/arch/mips/Makefile b/arch/mips/Makefile
>> index 0608ec524d3d..a244fb311a37 100644
>> --- a/arch/mips/Makefile
>> +++ b/arch/mips/Makefile
>> @@ -226,6 +226,15 @@ cflags-y			+= -I$(srctree)/arch/mips/include/asm/mach-generic
>>  drivers-$(CONFIG_PCI)		+= arch/mips/pci/
>>  
>>  #
>> +# Don't trust the toolchain defaults. Use a sensible -march
>> +# option but only if we don't have one already.
>> +#
>> +ifeq (,$(findstring march=, $(cflags-y)))
>> +cflags-$(CONFIG_32BIT)			+= -march=mips32
>> +cflags-$(CONFIG_64BIT)			+= -march=mips64
>> +endif
> 
>  So I'd rather see some form of diagnostics instead, e.g.:
> 
> ifeq (,$(filter -march=% -mips%, $(cflags-y)))
> $(error Configuration bug, no `-march=' option set for the CPU selected!)
> endif
> 

That looks good to me. I have no strong preference. If that's preferred
I will create a new patch


-- 
markos
