Received: from mailapp01.imgtec.com ([195.59.15.196]:41684 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23990509AbcKDIqwZBpwt (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 4 Nov 2016 09:46:52 +0100
Subject: Re: [PATCH 5/6] MIPS: Ensure bss section ends on a long-aligned
 address
References: <20161020202705.3783-1-paul.burton@imgtec.com>
 <20161020202705.3783-6-paul.burton@imgtec.com>
From: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
Message-ID: <99627bd7-3dc7-9b9b-0e34-bc4fc251de1a@imgtec.com>
Date: Fri, 4 Nov 2016 09:46:45 +0100
MIME-Version: 1.0
In-Reply-To: <20161020202705.3783-6-paul.burton@imgtec.com>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-Path: <Marcin.Nowakowski@imgtec.com>
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
Cc: Ralf Baechle <ralf@linux-mips.org>
Message-ID: <20161104084645.avDtX3vCaE9pWA6-5ZpUkPClffFlSjV7l1g4CK5xhNQ@z>

Hi Paul,

On 20.10.2016 22:27, Paul Burton wrote:
> diff --git a/arch/mips/kernel/vmlinux.lds.S b/arch/mips/kernel/vmlinux.lds.S
> index d5de675..d1f5401 100644
> --- a/arch/mips/kernel/vmlinux.lds.S
> +++ b/arch/mips/kernel/vmlinux.lds.S
> @@ -1,3 +1,4 @@
> +#include <asm/asm.h>
>  #include <asm/asm-offsets.h>
>  #include <asm/thread_info.h>

This patch (and specifically including asm/asm.h) causes a build error 
when CONFIG_RELOCATABLE=y as there's a LONG() linker command that gets 
converted to '.[d]word' as a result of including the assembly macros ...

Marcin
