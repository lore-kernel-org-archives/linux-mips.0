Received: from mail.windriver.com ([147.11.1.11]:60150 "EHLO
        mail.windriver.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S6816886AbaDGN6ixcEQ9 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 7 Apr 2014 15:58:38 +0200
Message-ID: <5342AEEF.4080503@windriver.com>
Date: Mon, 7 Apr 2014 09:58:07 -0400
From: Paul Gortmaker <paul.gortmaker@windriver.com>
MIME-Version: 1.0
Subject: Re: [PATCH] mips: export icache_flush_range
References: <20140322154720.GA23863@www.outflux.net> <CAGXu5jL+o4dG+ruUDh-+5LY=iD0veWaimBUq3cJBtuCiNbYt1A@mail.gmail.com>
In-Reply-To: <CAGXu5jL+o4dG+ruUDh-+5LY=iD0veWaimBUq3cJBtuCiNbYt1A@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-Path: <Paul.Gortmaker@windriver.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Kees Cook <keescook@chromium.org>
Cc: Ralf Baechle <ralf@linux-mips.org>, Sanjay Lal <sanjayl@kymasys.com>, John Crispin <blogic@openwrt.org>, linux-mips@linux-mips.org, LKML <linux-kernel@vger.kernel.org>
Message-ID: <20140407135807.0RVeVPTIjCcogOaW6UgEZi_MCrc8tNaX6OvfNyH6hK4@z>

On 14-03-22 03:05 PM, Kees Cook wrote:
> On Sat, Mar 22, 2014 at 9:47 AM, Kees Cook <keescook@chromium.org> wrote:
>> The lkdtm module performs tests against executable memory ranges, so
>> it needs to flush the icache for proper behaviors. Other architectures
>> already export this, so do the same for MIPS.
>>
>> Signed-off-by: Kees Cook <keescook@chromium.org>
>> ---
>> This is currently untested! I'm building a MIPS cross-compiler now...
>> If someone can validate this fixes the build when lkdtm is a module,
>> that would be appreciated. :)
> 
> Okay, now tested. I reproduced the failure and this patch fixes it. :)

Just checking if this happened to fall through the cracks.
The most recent (Apr4) linux-next build for mips still fails
with this error.

http://kisskb.ellerman.id.au/kisskb/buildresult/10877159/

Paul.
--

> 
> -Kees
> 
>> ---
>>  arch/mips/mm/cache.c |    1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/arch/mips/mm/cache.c b/arch/mips/mm/cache.c
>> index fde7e56d13fe..b3f1df13d9f6 100644
>> --- a/arch/mips/mm/cache.c
>> +++ b/arch/mips/mm/cache.c
>> @@ -38,6 +38,7 @@ void (*__flush_kernel_vmap_range)(unsigned long vaddr, int size);
>>  void (*__invalidate_kernel_vmap_range)(unsigned long vaddr, int size);
>>
>>  EXPORT_SYMBOL_GPL(__flush_kernel_vmap_range);
>> +EXPORT_SYMBOL_GPL(flush_icache_range);
>>
>>  /* MIPS specific cache operations */
>>  void (*flush_cache_sigtramp)(unsigned long addr);
>> --
>> 1.7.9.5
>>
>>
>> --
>> Kees Cook
>> Chrome OS Security
> 
> 
> 
