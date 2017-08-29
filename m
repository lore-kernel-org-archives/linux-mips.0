Received: from mailapp01.imgtec.com ([195.59.15.196]:2781 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23994922AbdH2KHlURBOB (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 29 Aug 2017 12:07:41 +0200
Subject: Re: [PATCH 11/11] MIPS: Declare various variables & functions static
References: <20170823181754.24044-1-paul.burton@imgtec.com>
 <20170823181754.24044-12-paul.burton@imgtec.com>
From: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
Message-ID: <b4d64ecd-c3f5-dcf8-8ecb-3d59d15cda89@imgtec.com>
Date: Tue, 29 Aug 2017 12:07:33 +0200
MIME-Version: 1.0
In-Reply-To: <20170823181754.24044-12-paul.burton@imgtec.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
To: Paul Burton <paul.burton@imgtec.com>, linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>, trivial@kernel.org
Message-ID: <20170829100733.uikx0erLh8mr4UilW2MwrmVFUfM-Q8W3mX7gXkY0Amo@z>

Hi Paul,

On 23.08.2017 20:17, Paul Burton wrote:
> We currently have various variables & functions which are only used
> within a single translation unit, but which we don't declare static.
> This causes various sparse warnings of the form:
> 
>    arch/mips/kernel/mips-r2-to-r6-emul.c:49:1: warning: symbol
>      'mipsr2emustats' was not declared. Should it be static?
> 
>    arch/mips/kernel/unaligned.c:1381:11: warning: symbol 'reg16to32st'
>      was not declared. Should it be static?
> 
>    arch/mips/mm/mmap.c:146:15: warning: symbol 'arch_mmap_rnd' was not
>      declared. Should it be static?
> 
> Fix these & others by declaring various affected variables & functions
> static, avoiding the sparse warnings & redundant symbols.
> 
> Signed-off-by: Paul Burton <paul.burton@imgtec.com>
> Cc: Ralf Baechle <ralf@linux-mips.org>
> Cc: linux-mips@linux-mips.org
> 
> ---
> 
>   arch/mips/kernel/cpu-probe.c          | 2 +-
>   arch/mips/kernel/mips-r2-to-r6-emul.c | 6 +++---
>   arch/mips/kernel/pm-cps.c             | 2 +-
>   arch/mips/kernel/unaligned.c          | 2 +-
>   arch/mips/mm/dma-default.c            | 4 ++--
>   5 files changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/mips/kernel/cpu-probe.c b/arch/mips/kernel/cpu-probe.c
> index d08afc7dc507..17df18b87b9d 100644
> --- a/arch/mips/kernel/cpu-probe.c
> +++ b/arch/mips/kernel/cpu-probe.c
> @@ -326,7 +326,7 @@ static int __init fpu_disable(char *s)
>   
>   __setup("nofpu", fpu_disable);
>   
> -int mips_dsp_disabled;
> +static int mips_dsp_disabled;
>   
>   static int __init dsp_disable(char *s)
>   {
> diff --git a/arch/mips/kernel/mips-r2-to-r6-emul.c b/arch/mips/kernel/mips-r2-to-r6-emul.c
> index ae64c8f56a8c..ac23b4f09f02 100644
> --- a/arch/mips/kernel/mips-r2-to-r6-emul.c
> +++ b/arch/mips/kernel/mips-r2-to-r6-emul.c
> @@ -46,9 +46,9 @@
>   #define LL	"ll "
>   #define SC	"sc "
>   
> -DEFINE_PER_CPU(struct mips_r2_emulator_stats, mipsr2emustats);
> -DEFINE_PER_CPU(struct mips_r2_emulator_stats, mipsr2bdemustats);
> -DEFINE_PER_CPU(struct mips_r2br_emulator_stats, mipsr2bremustats);
> +static DEFINE_PER_CPU(struct mips_r2_emulator_stats, mipsr2emustats);
> +static DEFINE_PER_CPU(struct mips_r2_emulator_stats, mipsr2bdemustats);
> +static DEFINE_PER_CPU(struct mips_r2br_emulator_stats, mipsr2bremustats);
>   

This leads to the following:

../arch/mips/kernel/mips-r2-to-r6-emul.c:51:56: error: 
‘mipsr2bremustats’ defined but not used [-Werror=unused-variable]
  static DEFINE_PER_CPU(struct mips_r2br_emulator_stats, mipsr2bremustats);
                                                         ^
../include/linux/percpu-defs.h:105:19: note: in definition of macro 
‘DEFINE_PER_CPU_SECTION’
   __typeof__(type) name
                    ^~~~
../arch/mips/kernel/mips-r2-to-r6-emul.c:51:8: note: in expansion of 
macro ‘DEFINE_PER_CPU’
  static DEFINE_PER_CPU(struct mips_r2br_emulator_stats, mipsr2bremustats);
         ^~~~~~~~~~~~~~
../arch/mips/kernel/mips-r2-to-r6-emul.c:50:54: error: 
‘mipsr2bdemustats’ defined but not used [-Werror=unused-variable]
  static DEFINE_PER_CPU(struct mips_r2_emulator_stats, mipsr2bdemustats);
                                                       ^
../include/linux/percpu-defs.h:105:19: note: in definition of macro 
‘DEFINE_PER_CPU_SECTION’
   __typeof__(type) name
                    ^~~~
../arch/mips/kernel/mips-r2-to-r6-emul.c:50:8: note: in expansion of 
macro ‘DEFINE_PER_CPU’
  static DEFINE_PER_CPU(struct mips_r2_emulator_stats, mipsr2bdemustats);
         ^~~~~~~~~~~~~~
../arch/mips/kernel/mips-r2-to-r6-emul.c:49:54: error: ‘mipsr2emustats’ 
defined but not used [-Werror=unused-variable]
  static DEFINE_PER_CPU(struct mips_r2_emulator_stats, mipsr2emustats);
                                                       ^
../include/linux/percpu-defs.h:105:19: note: in definition of macro 
‘DEFINE_PER_CPU_SECTION’
   __typeof__(type) name
                    ^~~~
../arch/mips/kernel/mips-r2-to-r6-emul.c:49:8: note: in expansion of 
macro ‘DEFINE_PER_CPU’
  static DEFINE_PER_CPU(struct mips_r2_emulator_stats, mipsr2emustats);


when CONFIG_DEBUG_FS=n (eg. malta_qemu_32r6_defconfig)

Since these are not used without DEBUG_FS then I guess the following 
patch should be ok:

diff --git a/arch/mips/kernel/mips-r2-to-r6-emul.c 
b/arch/mips/kernel/mips-r2-to-r6-emul.c
index 3bd721c..eb18b18 100644
--- a/arch/mips/kernel/mips-r2-to-r6-emul.c
+++ b/arch/mips/kernel/mips-r2-to-r6-emul.c
@@ -46,9 +46,11 @@
  #define LL     "ll "
  #define SC     "sc "

+#ifdef CONFIG_DEBUG_FS
  static DEFINE_PER_CPU(struct mips_r2_emulator_stats, mipsr2emustats);
  static DEFINE_PER_CPU(struct mips_r2_emulator_stats, mipsr2bdemustats);
  static DEFINE_PER_CPU(struct mips_r2br_emulator_stats, mipsr2bremustats);
+#endif

if you're OK with it then I guess it may be best for Ralf to fold this 
change into your patch?

Marcin
