Received: from mailapp01.imgtec.com ([195.59.15.196]:38223 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27008868AbaIXNAyX2RvC (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 24 Sep 2014 15:00:54 +0200
Received: from KLMAIL01.kl.imgtec.org (unknown [192.168.5.35])
        by Websense Email Security Gateway with ESMTPS id 19126D8E4CDC
        for <linux-mips@linux-mips.org>; Wed, 24 Sep 2014 14:00:45 +0100 (IST)
Message-ID: <5422C07E.6080300@imgtec.com>
Date: Wed, 24 Sep 2014 14:00:46 +0100
From: James Hogan <james.hogan@imgtec.com>
MIME-Version: 1.0
Subject: Re: [PATCH 00/11] FP/MSA fixes
References: <1411551942-11153-1-git-send-email-paul.burton@imgtec.com>
In-Reply-To: <1411551942-11153-1-git-send-email-paul.burton@imgtec.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-Path: <James.Hogan@imgtec.com>
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
Message-ID: <20140924130046.TM2Klle5G3aCo5hRpU9-bPxoeGnp5Rv17zOEdYp9kvs@z>

On 24/09/14 10:45, Paul Burton wrote:
> This series fixes a bunch of bugs, both build & runtime, with FP & MSA
> support. Most of them only affect systems with the new FP modes & MSA
> support enabled but patch 6 in particular is more general, fixing
> problems for mips64 systems.

I don't claim to be particularly familiar with much of this code, but
FWIW I've read it through and haven't spotted anything wrong aside from
what has already been mentioned.

Thanks
James

> 
> James Hogan (2):
>   Revert "MIPS: Don't assume 64-bit FP registers for context switch"
>   MIPS: MSA: Fix big-endian FPR_IDX implementation
> 
> Paul Burton (9):
>   MIPS: push .set arch=r4000 into the functions needing it
>   MIPS: assume at as source/dest of MSA copy/insert instructions
>   MIPS: remove MSA macro recursion
>   MIPS: wrap cfcmsa & ctcmsa accesses for toolchains with MSA support
>   MIPS: clear MSACSR cause bits when handling MSA FP exception
>   MIPS: fix mfc1 & mfhc1 emulation for mips64 systems
>   MIPS: ensure FCSR cause bits are clear after invoking FPU emulator
>   MIPS: prevent FP context set via ptrace being discarded
>   MIPS: disable FPU if the mode is unsupported
> 
>  arch/mips/include/asm/asmmacro-32.h | 128 ++++++++++-----------
>  arch/mips/include/asm/asmmacro.h    | 218 +++++++++++++++++++++---------------
>  arch/mips/include/asm/fpu.h         |  19 ++--
>  arch/mips/include/asm/processor.h   |   2 +-
>  arch/mips/kernel/asm-offsets.c      |  66 -----------
>  arch/mips/kernel/genex.S            |  11 +-
>  arch/mips/kernel/ptrace.c           |  30 ++++-
>  arch/mips/kernel/r4k_fpu.S          |  13 ++-
>  arch/mips/kernel/traps.c            |  17 +--
>  arch/mips/math-emu/cp1emu.c         |   6 +-
>  10 files changed, 262 insertions(+), 248 deletions(-)
> 
