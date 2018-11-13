Received: from mail-eopbgr770092.outbound.protection.outlook.com ([40.107.77.92]:10368
        "EHLO NAM02-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S23993052AbeKMWWKbpV8u convert rfc822-to-8bit (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 13 Nov 2018 23:22:10 +0100
From: Paul Burton <paul.burton@mips.com>
Subject: Re: [PATCH 00/20] MIPS: Allow FP support to be disabled
Date: Tue, 13 Nov 2018 22:22:08 +0000
Message-ID: <CY4PR2201MB12728176D284715C96B56452C1C20@CY4PR2201MB1272.namprd22.prod.outlook.com>
References: <20181107231341.4614-1-paul.burton@mips.com>
In-Reply-To: <20181107231341.4614-1-paul.burton@mips.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
Return-Path: <pburton@wavecomp.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Paul Burton <pburton@wavecomp.com>
Cc: "linux-mips@linux-mips.org" <linux-mips@linux-mips.org>"linux-mips@linux-mips.org" <linux-mips@linux-mips.org>
Message-ID: <20181113222208.yE-K00G1uGEaPXcYtssdMcP3LNZArVuIM4LQFFWe2Fg@z>

Hello,

Paul Burton wrote:
> This series allows the kernel to be built without any support for
> floating point. There are 2 main motivations for this:
> 
> - The specification for nanoMIPS floating point support has not yet
> been finalized, so building the kernel without floating point will
> be useful for initial nanoMIPS support. Current nanoMIPS hardware,
> the MIPS I7200 CPU, has no FPU.
> 
> - If userland is known not to use floating point instructions then
> omiting the kernel's support for it can produce respectable code
> size savings - around 112KB for 64r6el_defconfig.
> 
> Applies cleanly atop v4.20-rc1.
> 
> Thanks,
> Paul
> 
> Paul Burton (20):
> MIPS: Hide CONFIG_MIPS_O32_FP64_SUPPORT prompt for >= MIPSr6
> MIPS: BCM5xxx: Remove dead init_fpu code
> MIPS: Simplify FP context initialization
> MIPS: Ensure emulated FP sets PF_USED_MATH
> MIPS: Drop forward declarations of sigcontext in asm/fpu.h
> MIPS: Better abstract R2300 FPU usage in Kconfig
> MIPS: Introduce CONFIG_MIPS_FP_SUPPORT
> MIPS: Hardcode cpu_has_fpu=0 when CONFIG_MIPS_FP_SUPPORT=n
> MIPS: Stub asm/fpu.h functions
> MIPS: cpu-probe: Avoid probing FPU when CONFIG_MIPS_FP_SUPPORT=n
> MIPS: traps: Never enable FPU when CONFIG_MIPS_FP_SUPPORT=n
> MIPS: branch: Remove FP branch handling when CONFIG_MIPS_FP_SUPPORT=n
> MIPS: unaligned: Remove FP & MSA code when unsupported
> MIPS: ptrace: Remove FP support when CONFIG_MIPS_FP_SUPPORT=n
> MIPS: signal: Remove FP context support when CONFIG_MIPS_FP_SUPPORT=n
> MIPS: Avoid FP ELF checks when CONFIG_MIPS_FP_SUPPORT=n
> MIPS: Avoid FCSR sanitization when CONFIG_MIPS_FP_SUPPORT=n
> MIPS: Don't compile math-emu when CONFIG_MIPS_FP_SUPPORT=n
> MIPS: Remove struct task_struct fpu state when
> CONFIG_MIPS_FP_SUPPORT=n
> MIPS: Allow FP support to be disabled
> 
> arch/mips/Kconfig                     |  29 ++-
> arch/mips/Makefile                    |   2 +-
> arch/mips/include/asm/cpu-features.h  |  11 +-
> arch/mips/include/asm/dsemul.h        |  29 ++-
> arch/mips/include/asm/elf.h           |  26 ++-
> arch/mips/include/asm/fpu.h           | 145 +++++++++---
> arch/mips/include/asm/fpu_emulator.h  |  11 -
> arch/mips/include/asm/processor.h     |  19 +-
> arch/mips/include/asm/switch_to.h     |   6 +-
> arch/mips/kernel/Makefile             |   3 +-
> arch/mips/kernel/asm-offsets.c        |   7 +-
> arch/mips/kernel/bmips_5xxx_init.S    |   6 -
> arch/mips/kernel/branch.c             |  34 +--
> arch/mips/kernel/cpu-probe.c          |  54 +++--
> arch/mips/kernel/elf.c                |   4 +
> arch/mips/kernel/genex.S              |   2 +
> arch/mips/kernel/mips-r2-to-r6-emul.c |   7 -
> arch/mips/kernel/ptrace.c             | 319 +++++++++++++-------------
> arch/mips/kernel/ptrace32.c           |  33 +--
> arch/mips/kernel/r2300_fpu.S          |  58 -----
> arch/mips/kernel/r4k_fpu.S            | 144 ------------
> arch/mips/kernel/signal.c             |  39 +++-
> arch/mips/kernel/traps.c              | 117 ++++++----
> arch/mips/kernel/unaligned.c          |  38 +--
> arch/mips/kvm/Kconfig                 |   1 +
> arch/mips/math-emu/cp1emu.c           |   7 +
> 26 files changed, 600 insertions(+), 551 deletions(-)

Series applied to mips-next.

Thanks,
    Paul

[ This message was auto-generated; if you believe anything is incorrect
  then please email paul.burton@mips.com to report it. ]
