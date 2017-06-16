Received: from mailapp01.imgtec.com ([195.59.15.196]:56545 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23993859AbdFPCznPpmgY (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 16 Jun 2017 04:55:43 +0200
Date: Fri, 16 Jun 2017 03:55:26 +0100
From: "Maciej W. Rozycki" <macro@imgtec.com>
Subject: Re: [PATCH 0/5] MIPS: FP cleanup & no-FP support
In-Reply-To: <20170605182131.16853-1-paul.burton@imgtec.com>
Message-ID: <alpine.DEB.2.00.1706160348450.23046@tp.orcam.me.uk>
References: <20170605182131.16853-1-paul.burton@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Return-Path: <Maciej.Rozycki@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Paul Burton <paul.burton@imgtec.com>
Cc: linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>
Message-ID: <20170616025526.KprdH_32tYmrmR3P-6_ZOm_pqopKYuGWdmq5oi1R8fQ@z>

On Mon, 5 Jun 2017, Paul Burton wrote:

> This series tidies up support for floating point a little, then
> introduces support for disabling it via Kconfig. The end result is that
> it becomes possible to compile a kernel which does not include any
> support for userland which makes use of floating point instructions -
> meaning that it never enables an FPU & does not include the FPU
> emulator. The benefit of this is that if you know your userland code
> will not use FP instructions then you can shrink the kernel by around
> 65KiB.
> 
> Applies atop v4.12-rc4.
> 
> Paul Burton (5):
>   MIPS: Remove unused R6000 support
>   MIPS: Move r4k FP code from r4k_switch.S to r4k_fpu.S
>   MIPS: Move r2300 FP code from r2300_switch.S to r2300_fpu.S
>   MIPS: Remove unused ST_OFF from r2300_switch.S
>   MIPS: Allow floating point support to be disabled

 Doesn't ptrace(2) require suitable updates for requests that deal with 
the FP context?  Preferably along with the last change (or maybe ahead of 
it) so that we don't have a kernel revision that presents rubbish to the 
userland (of course tools like GDB will have to be updated accordingly to 
cope, but that's out of scope for Linux itself).

 Also how about those prctl(2) calls that also operate on FP state?

  Maciej
