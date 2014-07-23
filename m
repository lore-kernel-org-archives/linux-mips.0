Received: from mailapp01.imgtec.com ([195.59.15.196]:49070 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S6842444AbaGWJGqLNqmi (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 23 Jul 2014 11:06:46 +0200
Message-ID: <53CF7B1E.9040903@imgtec.com>
Date: Wed, 23 Jul 2014 10:06:38 +0100
From: Markos Chandras <Markos.Chandras@imgtec.com>
MIME-Version: 1.0
Subject: Re: EdgeRouter Pro supported?  Strange FP problems
References: <20140722130616.GJ30723@humdrum> <53CE736E.1060009@imgtec.com> <20140722143311.GK30723@humdrum> <53CE8570.8020404@imgtec.com> <20140723090357.GN30723@humdrum>
In-Reply-To: <20140723090357.GN30723@humdrum>
Content-Type: text/plain; charset="ISO-8859-1"
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
To: Rob Kendrick <rob.kendrick@codethink.co.uk>
Cc: linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>
Message-ID: <20140723090638.FGVftKG8_LqOVZoneEhsNrN2czjTFPSRLBSWBwyJZA0@z>

On 07/23/2014 10:03 AM, Rob Kendrick wrote:
> On Tue, Jul 22, 2014 at 04:38:24PM +0100, Markos Chandras wrote:
>> a quick bisect between v3.15 and v3.16-rc1, which is the first tag with
>> all the new FPU changes, leads to the following bad commit:
>>
>> 08a07904e182895e1205f399465a3d622c0115b8
>> MIPS: math-emu: Remove most ifdefery.
> 
> This appears to fix the problem:
> 
> diff --git a/arch/mips/math-emu/cp1emu.c b/arch/mips/math-emu/cp1emu.c
> index 736c17a..bf0fc6b 100644
> --- a/arch/mips/math-emu/cp1emu.c
> +++ b/arch/mips/math-emu/cp1emu.c
> @@ -1827,7 +1827,7 @@ dcopuop:
>         case -1:
>  
>                 if (cpu_has_mips_4_5_r)
> -                       cbit = fpucondbit[MIPSInst_RT(ir) >> 2];
> +                       cbit = fpucondbit[MIPSInst_FD(ir) >> 2];
>                 else
>                         cbit = FPU_CSR_COND;
>                 if (rv.w)
> 
> Sadly I am totally ignorant of kernel patch processes.  What would be
> approach to having this properly submitted?
> 
Hi Rob,

The patch looks correct. See this document for the process

https://www.kernel.org/doc/Documentation/SubmittingPatches

So in general, you need to create a patch using git-format-patch
and use git-send-email to send it to this mailing list.

-- 
markos
