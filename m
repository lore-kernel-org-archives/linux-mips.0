Received: from mailapp01.imgtec.com ([195.59.15.196]:41462 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27012313AbbA3Pp23glWi (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 30 Jan 2015 16:45:28 +0100
Message-ID: <54CBA710.3040504@imgtec.com>
Date: Fri, 30 Jan 2015 15:45:20 +0000
From: Markos Chandras <Markos.Chandras@imgtec.com>
MIME-Version: 1.0
Subject: Re: [PATCH 0/2] MIPS: Fix build errors with binutils 2.24.51+
References: <1422632420-4973-1-git-send-email-james.hogan@imgtec.com>
In-Reply-To: <1422632420-4973-1-git-send-email-james.hogan@imgtec.com>
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
To: James Hogan <james.hogan@imgtec.com>, Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org
Cc: Paul Burton <paul.burton@imgtec.com>, David Daney <david.daney@cavium.com>
Message-ID: <20150130154520.vhkBNh7UixpxUw0HkF_itZvKT44axVrWb6siVHYS7T0@z>

On 01/30/2015 03:40 PM, James Hogan wrote:
> Fix the following build error with binutils 2.24.51+ since v3.18-rc4:
> 
> {standard input}: Assembler messages:
> {standard input}:2913: Error: opcode not supported on this processor: mips32r2 (mips32r2) `ctc1 $2,$31'
> scripts/Makefile.build:257: recipe for target 'arch/mips/kernel/traps.o' failed
> 
> Cc: Ralf Baechle <ralf@linux-mips.org>
> Cc: Paul Burton <paul.burton@imgtec.com>
> Cc: David Daney <david.daney@cavium.com>
> Cc: linux-mips@linux-mips.org
> 
> James Hogan (2):
>   MIPS: mipsregs.h: Add write_32bit_cp1_register()
>   MIPS: traps: Fix inline asm ctc1 missing .set hardfloat
> 
>  arch/mips/include/asm/mipsregs.h | 15 +++++++++++++++
>  arch/mips/kernel/traps.c         |  3 ++-
>  2 files changed, 17 insertions(+), 1 deletion(-)
> 

both look good to me. Thanks!

Reviewed-by: Markos Chandras <markos.chandras@imgtec.com>

-- 
markos
