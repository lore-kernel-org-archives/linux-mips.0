Received: from mail-bn1on0072.outbound.protection.outlook.com ([157.56.110.72]:3716
        "EHLO na01-bn1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S27011278AbbALRaxdS8El (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Mon, 12 Jan 2015 18:30:53 +0100
Message-ID: <54B404C1.7020409@caviumnetworks.com>
Date: Mon, 12 Jan 2015 09:30:41 -0800
From: David Daney <ddaney@caviumnetworks.com>
MIME-Version: 1.0
Subject: Re: [PATCH 2/9] MIPS OCTEON Enable use of FPU
References: <1421046385-2535-1-git-send-email-abhishek.paliwal@aricent.com> <1421046385-2535-3-git-send-email-abhishek.paliwal@aricent.com>
In-Reply-To: <1421046385-2535-3-git-send-email-abhishek.paliwal@aricent.com>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-Path: <David.Daney@caviumnetworks.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Abhishek Paliwal <abhishek.paliwal@aricent.com>
Cc: kexin.hao@windriver.com, bo.liu@windriver.com, Chandrakala.Chavva@caviumnetworks.com, rakesh.garg@aricent.com, David Daney <david.daney@cavium.com>, Andreas Herrmann <andreas.herrmann@caviumnetworks.com>, linux-mips@linux-mips.org, James Hogan <james.hogan@imgtec.com>, kvm@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>
Message-ID: <20150112173041.-yFs203a2IdHH-LqRr5fkwVBNXdbp5QT4IHMX4e1pDY@z>

On 01/11/2015 11:06 PM, Abhishek Paliwal wrote:
> commit  a36d8225bceba4b7be47ade34d175945f85cffbc upstream

Why are you spamming us with this?  We don't need to know what you are 
cherry-picking.


>
> Some versions of the assembler will not assemble CFC1 for OCTEON, so override the ISA for these.
>
> Add r4k_fpu.o to handle low level FPU initialization.
>
> Modify octeon_switch.S to save the FPU registers. And include r4k_switch.S to pick up more FPU support.
>
> Get rid of "#define cpu_has_fpu 0"
>
> Signed-off-by: David Daney <david.daney@cavium.com>
> Signed-off-by: Andreas Herrmann <andreas.herrmann@caviumnetworks.com>
> Cc: linux-mips@linux-mips.org
> Cc: James Hogan <james.hogan@imgtec.com>
> Cc: kvm@vger.kernel.org
> Patchwork: https://patchwork.linux-mips.org/patch/7006/
> Signed-off-by: Ralf Baechle <ralf@linux-mips.org>
> Signed-off-by: Abhishek Paliwal <abhishek.paliwal@aricent.com>
> ---
>   .../asm/mach-cavium-octeon/cpu-feature-overrides.h |  1 -
>   arch/mips/kernel/Makefile                          |  2 +-
>   arch/mips/kernel/branch.c                          |  6 +-
>   arch/mips/kernel/octeon_switch.S                   | 85 ++++++++++++++++------
>   arch/mips/kernel/r4k_switch.S                      |  3 +
>   arch/mips/math-emu/cp1emu.c                        | 12 ++-
>   6 files changed, 80 insertions(+), 29 deletions(-)
>
[...]
>
> "DISCLAIMER: This message is proprietary to Aricent and is intended solely for the use of the individual to whom it is addressed. It may contain privileged or confidential information and should not be circulated or used for any purpose other than for what it is intended. If you have received this message in error, please notify the originator immediately. If you are not the intended recipient, you are notified that you are strictly prohibited from using, copying, altering, or disclosing the contents of this message. Aricent accepts no responsibility for loss or damage arising from the use of the information transmitted by this email including damage from virus."

I wrote the patch, what gives you the right to say that it is "... 
proprietary to Aricent ..."?   Nothing.  We really must insist that you 
quit making this type of misrepresentation.

David Daney

>
