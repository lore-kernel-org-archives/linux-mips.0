Received: from mail-pf0-x241.google.com ([IPv6:2607:f8b0:400e:c00::241]:34348
        "EHLO mail-pf0-x241.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23993867AbdFWWJJgzHQ- (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Sat, 24 Jun 2017 00:09:09 +0200
Received: by mail-pf0-x241.google.com with SMTP id d5so9185435pfe.1
        for <linux-mips@linux-mips.org>; Fri, 23 Jun 2017 15:09:09 -0700 (PDT)
From: Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: [PATCH] pci:  Add and use PCI_GENERIC_SETUP Kconfig entry
Date: Fri, 23 Jun 2017 15:08:56 -0700
Message-ID: <20170623220857.28774-1-palmer@dabbelt.com>
In-Reply-To: <20170623220104.GE31455@jhogan-linux.le.imgtec.org>
References: <20170623220104.GE31455@jhogan-linux.le.imgtec.org>
Return-Path: <palmer@dabbelt.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: rth@twiddle.net, ink@jurassic.park.msu.ru, mattst88@gmail.com, vgupta@synopsys.com, linux@armlinux.org.uk, catalin.marinas@arm.com, will.deacon@arm.com, geert@linux-m68k.org, ralf@linux-mips.org, ysato@users.sourceforge.jp, dalias@libc.org, davem@davemloft.net, cmetcalf@mellanox.com, gxt@mprc.pku.edu.cn, bhelgaas@google.com, viro@zeniv.linux.org.uk, akpm@linux-foundation.org, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-m68k@lists.linux-m68k.org, linux-mips@linux-mips.org, linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, linux-pci@vger.kernel.org, hch@infradead.org
Message-ID: <20170623220856.dpRGZDIdHXX_Oc6j4AlRAd6uv7Xi7lXBxIJ1RcAap1E@z>

On Fri, 23 Jun 2017 15:01:04 PDT (-0700), james.hogan@imgtec.com wrote:
> On Fri, Jun 23, 2017 at 02:45:38PM -0700, Palmer Dabbelt wrote:
>> diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
>> index 4c1a35f15838..86872246951c 100644
>> --- a/arch/arm/Kconfig
>> +++ b/arch/arm/Kconfig
>> @@ -96,6 +96,7 @@ config ARM
>>      select PERF_USE_VMALLOC
>>      select RTC_LIB
>>      select SYS_SUPPORTS_APM_EMULATION
>> +    select PCI_GENERIC_SETUP
>>      # Above selects are sorted alphabetically; please add new ones
>>      # according to that.  Thanks.
>
> This comment seems to suggest PCI_GENERIC_SETUP should be added a few
> lines up to preserve the alphabetical sorting.
>
>> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
>> index b2024db225a9..6c684d8c8816 100644
>> --- a/arch/arm64/Kconfig
>> +++ b/arch/arm64/Kconfig
>> @@ -115,6 +115,7 @@ config ARM64
>>      select SPARSE_IRQ
>>      select SYSCTL_EXCEPTION_TRACE
>>      select THREAD_INFO_IN_TASK
>> +    select PCI_GENERIC_SETUP
>
> Here too.
>
>> diff --git a/arch/tile/Kconfig b/arch/tile/Kconfig
>> index 4583c0320059..6679af85a882 100644
>> --- a/arch/tile/Kconfig
>> +++ b/arch/tile/Kconfig
>> @@ -33,6 +33,7 @@ config TILE
>>      select USER_STACKTRACE_SUPPORT
>>      select USE_PMC if PERF_EVENTS
>>      select VIRT_TO_BUS
>> +    select PCI_GENERIC_SETUP
>
> and here
>
> Otherwise
> Reviewed-by: James Hogan <james.hogan@imgtec.com>

Whoops -- I guess I was just on autopilot after seeing the first one not be
alphabetized.  A fixed patch is in a threaded message.
