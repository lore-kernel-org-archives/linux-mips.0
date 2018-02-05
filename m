Received: from 9pmail.ess.barracuda.com ([64.235.150.224]:49193 "EHLO
        9pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23990864AbeBEAORirAJt (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 5 Feb 2018 01:14:17 +0100
Date: Mon, 5 Feb 2018 00:13:02 +0000
From: "Maciej W. Rozycki" <macro@mips.com>
Subject: Re: [PATCH] MIPS: CPS: Fix r1 .set mt assembler warning
In-Reply-To: <8e34deb4-33c3-9bdb-8ffb-b93516f16a84@linux-m68k.org>
Message-ID: <alpine.DEB.2.00.1802050003250.3553@tp.orcam.me.uk>
References: <079ec8f9-d2c2-9e29-278e-48e76bbb8de7@linux-m68k.org> <20180202120658.GA8479@saruman> <8e34deb4-33c3-9bdb-8ffb-b93516f16a84@linux-m68k.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Return-Path: <Maciej.Rozycki@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Greg Ungerer <gerg@linux-m68k.org>
Cc: James Hogan <jhogan@kernel.org>, Paul Burton <paul.burton@mips.com>, Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org
Message-ID: <20180205001302.3abk2p0jqus7Vaq15br0fVmK3cUjZoL3Mrat7RAOXmI@z>

On Sun, 4 Feb 2018, Greg Ungerer wrote:

> A "mips-linux-objdump -d" around that PC gives:
> 
> 80656610:       40090001        mfc0    t1,c0_mvpcontrol
> 80656614:       35290002        ori     t1,t1,0x2
> 80656618:       40890001        mtc0    t1,c0_mvpcontrol
> 8065661c:       000000c0        ehb
> 80656620:       01c0c02d        0x1c0c02d
> 80656624:       240d0000        li      t5,0
> 80656628:       31c80001        andi    t0,t6,0x1
> 8065662c:       1100002b        beqz    t0,806566dc <mips_cps_boot_vpes+0x108>
> 80656630:       00000000        nop
> 
> So it can't decode that "01c0c02d"...

 Well, `objdump -mmips:isa64r2 -d' reveals this:

80000000:	01c0c02d 	move	t8,t6

and then `objdump -mmips:isa64r2 -M no-aliases -d' further shows this:

80000000:	01c0c02d 	daddu	t8,t6,zero

which is a 64-bit instruction, so clearly the temporary `.set' override 
spans too much (we have updated GAS recently to emit machine code for OR 
rather than ADDU/DADDU as the expansion for the MOVE assembly idiom to 
minimise impact from such issues though; ADDU/DADDU would schedule better 
with old superscalar MIPS processors, but that is not an issue with the 
modern ones, I'm told).

 HTH,

  Maciej
