Received: from mailapp01.imgtec.com ([195.59.15.196]:39922 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27006713AbbIGJdyucJaz (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 7 Sep 2015 11:33:54 +0200
Subject: Re: [PATCH 2/2 for-4.3] MIPS: BPF: Fix build on pre-R2 little endian
 CPUs
References: <1441471618-5613-1-git-send-email-aurelien@aurel32.net>
 <1441471618-5613-2-git-send-email-aurelien@aurel32.net>
From: Markos Chandras <Markos.Chandras@imgtec.com>
Message-ID: <55ED59FC.4070505@imgtec.com>
Date: Mon, 7 Sep 2015 10:33:48 +0100
MIME-Version: 1.0
In-Reply-To: <1441471618-5613-2-git-send-email-aurelien@aurel32.net>
Content-Type: text/plain; charset="windows-1252"
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
To: Aurelien Jarno <aurelien@aurel32.net>, linux-mips@linux-mips.org
Cc: Ralf Baechle <ralf@linux-mips.org>
Message-ID: <20150907093348.YdchXvbdNUYKPqE4S9Jl9O47PtEOrCDErXuCvNKTut0@z>

On 09/05/2015 05:46 PM, Aurelien Jarno wrote:
> The rotr, seh and wsbh instructions have been introduced with the R2
> ISA. Thus the current BPF code fails to build on pre-R2 little endian
> CPUs:
> 
>     CC      arch/mips/net/bpf_jit.o
>     AS      arch/mips/net/bpf_jit_asm.o
>   /home/aurel32/linux-4.2/arch/mips/net/bpf_jit_asm.S: Assembler messages:
>   /home/aurel32/linux-4.2/arch/mips/net/bpf_jit_asm.S:67: Error: opcode not supported on this processor: mips32 (mips32) `wsbh $8,$19'
>   /home/aurel32/linux-4.2/arch/mips/net/bpf_jit_asm.S:68: Error: opcode not supported on this processor: mips32 (mips32) `rotr $19,$8,16'
>   /home/aurel32/linux-4.2/arch/mips/net/bpf_jit_asm.S:83: Error: opcode not supported on this processor: mips32 (mips32) `wsbh $8,$19'
>   /home/aurel32/linux-4.2/arch/mips/net/bpf_jit_asm.S:84: Error: opcode not supported on this processor: mips32 (mips32) `seh $19,$8'
>   /home/aurel32/linux-4.2/arch/mips/net/bpf_jit_asm.S:151: Error: opcode not supported on this processor: mips32 (mips32) `wsbh $8,$12'
>   /home/aurel32/linux-4.2/arch/mips/net/bpf_jit_asm.S:153: Error: opcode not supported on this processor: mips32 (mips32) `rotr $19,$8,16'
>   /home/aurel32/linux-4.2/arch/mips/net/bpf_jit_asm.S:164: Error: opcode not supported on this processor: mips32 (mips32) `wsbh $19,$12'
>   /home/aurel32/linux-4.2/scripts/Makefile.build:294: recipe for target 'arch/mips/net/bpf_jit_asm.o' failed
> 
> Fix that by providing equivalent code for these CPUs.
> 
> Cc: Ralf Baechle <ralf@linux-mips.org>
> Cc: Markos Chandras <markos.chandras@imgtec.com>
> Cc: stable@vger.kernel.org # v4.2+
> Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
> ---

Reviewed-by: Markos Chandras <markos.chandras@imgtec.com>

-- 
markos
