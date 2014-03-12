Received: from mailapp01.imgtec.com ([195.89.28.115]:55208 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S6817179AbaCLLWine24S (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 12 Mar 2014 12:22:38 +0100
Message-ID: <53204372.1000400@imgtec.com>
Date: Wed, 12 Mar 2014 11:22:26 +0000
From: Markos Chandras <Markos.Chandras@imgtec.com>
MIME-Version: 1.0
Subject: Re: [PATCH v2] samples/seccomp/Makefile: Do not build tests if cross-compiling
 for MIPS
References: <52FD0131.9040304@imgtec.com> <1392804917-29789-1-git-send-email-markos.chandras@imgtec.com>
In-Reply-To: <1392804917-29789-1-git-send-email-markos.chandras@imgtec.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
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
To: linux-mips@linux-mips.org
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, akpm@linux-foundation.org
Message-ID: <20140312112226.BjbCYG1JaaMHsdchdmoAJvCa6iRzC0F7V7UjSCGXJ9o@z>

On 02/19/2014 10:15 AM, Markos Chandras wrote:
> The Makefile is designed to use the host toolchain so it may be
> unsafe to build the tests if the kernel has been configured and built
> for another architecture. This fixes a build problem when the kernel has
> been configured and built for the MIPS architecture but the host is
> not MIPS (cross-compiled). The MIPS syscalls are only defined
> if one of the following is true:
>
> 1) _MIPS_SIM == _MIPS_SIM_ABI64
> 2) _MIPS_SIM == _MIPS_SIM_ABI32
> 3) _MIPS_SIM == _MIPS_SIM_NABI32
>
> Of course, none of these make sense on a non-MIPS toolchain and the
> following build problem occurs when building on a non-MIPS host.
>
> linux/usr/include/linux/kexec.h:50:
> userspace cannot reference function or variable defined in the kernel
> samples/seccomp/bpf-direct.c: In function ‘emulator’:
> samples/seccomp/bpf-direct.c:76:17: error:
> ‘__NR_write’ undeclared (first use in this function)
>
> Cc: linux-next@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Reported-by: Paul Gortmaker <paul.gortmaker@windriver.com>
> Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
> ---
> This build problem is only reproducible on the linux-next tree at the moment
>
> Changes since v1:
> - Rework code so native builds are allowed on MIPS
> ---
>   samples/seccomp/Makefile | 14 ++++++++++----
>   1 file changed, 10 insertions(+), 4 deletions(-)
>
> diff --git a/samples/seccomp/Makefile b/samples/seccomp/Makefile
> index 7203e66..855051b 100644
> --- a/samples/seccomp/Makefile
> +++ b/samples/seccomp/Makefile
> @@ -18,8 +18,8 @@ HOSTCFLAGS_bpf-direct.o += -idirafter $(objtree)/include
>   bpf-direct-objs := bpf-direct.o
>
>   # Try to match the kernel target.
> -ifndef CONFIG_64BIT
>   ifndef CROSS_COMPILE
> +ifndef CONFIG_64BIT
>
>   # s390 has -m31 flag to build 31 bit binaries
>   ifndef CONFIG_S390
> @@ -36,7 +36,13 @@ HOSTLOADLIBES_bpf-direct += $(MFLAG)
>   HOSTLOADLIBES_bpf-fancy += $(MFLAG)
>   HOSTLOADLIBES_dropper += $(MFLAG)
>   endif
> -endif
> -
> -# Tell kbuild to always build the programs
>   always := $(hostprogs-y)
> +else
> +# MIPS system calls are defined based on the -mabi that is passed
> +# to the toolchain which may or may not be a valid option
> +# for the host toolchain. So disable tests if target architecture
> +# is MIPS but the host isn't.
> +ifndef CONFIG_MIPS
> +always := $(hostprogs-y)
> +endif
> +endif
>

CC'ing Andrew Morton as well

Ping? Is anyone willing to take this patch in his tree so we can restore 
the build for allyes/allmod configs for MIPS on linux-next?

-- 
markos
