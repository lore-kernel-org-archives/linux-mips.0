Received: from mailapp01.imgtec.com ([195.59.15.196]:62462 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27011002AbbASJsYp2ZQs (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 19 Jan 2015 10:48:24 +0100
Message-ID: <54BCD2E2.7090602@imgtec.com>
Date: Mon, 19 Jan 2015 09:48:18 +0000
From: Markos Chandras <Markos.Chandras@imgtec.com>
MIME-Version: 1.0
Subject: Re: [PATCH RFC v2 57/70] MIPS: Emulate the new MIPS R6 BOVC, BEQC
 and BEQZALC instructions
References: <1421405389-15512-1-git-send-email-markos.chandras@imgtec.com> <1421405389-15512-58-git-send-email-markos.chandras@imgtec.com> <54BA627C.7070105@cogentembedded.com>
In-Reply-To: <54BA627C.7070105@cogentembedded.com>
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
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, linux-mips@linux-mips.org
Message-ID: <20150119094818.NXSizMd5xv-j8LvHp5ZvArDWUqrq4IBpKfzbXmlf634@z>

On 01/17/2015 01:24 PM, Sergei Shtylyov wrote:
> Hello.
> 
> On 1/16/2015 1:49 PM, Markos Chandras wrote:
> 
>> MIPS R6 uses the <R6 ADDI opcode for the new BOVC, BEQC and
>> BEQZALC instructions.
> 
>> Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
> 
> [...]
> 
>> diff --git a/arch/mips/kernel/branch.c b/arch/mips/kernel/branch.c
>> index bf82ec302cff..c084b38e727b 100644
>> --- a/arch/mips/kernel/branch.c
>> +++ b/arch/mips/kernel/branch.c
>> @@ -808,6 +808,17 @@ int __compute_return_epc_for_insn(struct pt_regs
>> *regs,
>>           }
>>           regs->cp0_epc += 8;
>>           break;
>> +    case cbcond0_op:
>> +        /* Only valid for MIPS R6 */
>> +        if (!cpu_has_mips_r6) {
>> +            ret = -SIGILL;
>> +            break;
>> +        }
>> +        /* Compact branches: bovc, beqc, beqzalc */
>> +        if (insn.i_format.rt && !insn.i_format.rs)
>> +            regs->regs[31] = epc + 4;
> 
>    Hm, so this instruction doesn't have delay slot?

All 3 of them have a forbidden slot. An instruction in a forbidden slot
is only executed if the branch *is not taken*.

The "if" condition above is aimed to handle the BEQZALC instruction. The
BEQZALC instruction will store the return address to the 31 register.

According to the R6 ISA this is what happens in that instruction:

GPR[31] <- PC+4
target_offset <- ...
BLTZALC: cond <- GPR[rt] < 0
if cond then
PC <- ( PC+4+ sign_extend( target_offset ) )
endif

So GPR[31] will contain the address for the forbidden slot instruction.
So in this type of branches (where the link register is used), the
forbidden slot will be executed after the branch.

However, the only way for us to be emulating a branch, is an instruction
in a forbidden slot or delay slot to have caused an exception. In case
of compact branches, when the instruction in a forbidden slot is
executed, we know we are done with the branch, because in any case, the
branch was already executed. An exception in the forbidden slot sets the
EPC back to the branch itself. So we simply handle the forbidden slot
exception, and then we do PC+8 so go past the forbidden slot instruction
that we already handled.

See

http://git.linux-mips.org/cgit/mchandras/linux.git/tree/arch/mips/kernel/branch.c?h=3.19-r6-rfc-1#n404

does that make sense?

-- 
markos
