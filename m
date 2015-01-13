Received: from mailapp01.imgtec.com ([195.59.15.196]:40111 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27011490AbbAMPEWt2aAL (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 13 Jan 2015 16:04:22 +0100
Message-ID: <54B533EF.1090201@imgtec.com>
Date: Tue, 13 Jan 2015 15:04:15 +0000
From: Markos Chandras <Markos.Chandras@imgtec.com>
MIME-Version: 1.0
Subject: Re: [PATCH RFC 12/67] MIPS: asm: asmmacro: Replace add instructions
 with "addui"
References: <1418915416-3196-1-git-send-email-markos.chandras@imgtec.com> <1418915416-3196-13-git-send-email-markos.chandras@imgtec.com> <54932370.605@gmail.com> <5493E97A.1070608@imgtec.com> <alpine.LFD.2.11.1501112322130.27458@eddie.linux-mips.org> <54B519DE.4010708@imgtec.com> <alpine.LFD.2.11.1501131455530.23937@eddie.linux-mips.org>
In-Reply-To: <alpine.LFD.2.11.1501131455530.23937@eddie.linux-mips.org>
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
To: "Maciej W. Rozycki" <macro@linux-mips.org>
Cc: David Daney <ddaney.cavm@gmail.com>, Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org
Message-ID: <20150113150415.KsYXF5BdHWG9eFVJ6C4et5oD_OytHJeRXkvU88zUgYs@z>

On 01/13/2015 02:58 PM, Maciej W. Rozycki wrote:
> On Tue, 13 Jan 2015, Markos Chandras wrote:
> 
>>>  I think using the ADDU macro is preferred here as it allows arbitrary 
>>> 32-bit values for `off', just like with memory references in MIPS assembly 
>>> instructions.
>>
>> What ADDU macro?
> 
>  This:
> 
> {"addu",		"t,r,I",	0,    (int) M_ADDU_I,	INSN_MACRO,		0,		I1,		0,	0 },
> 
> (from opcodes/mips-opc.c).
> 
>   Maciej
> 
I see your point about having 32-bit offsets supported here but it's not
obvious that addu would simply accept this format without looking at the
binutils sources.

in any case, it does not make a difference in this particular example,
so I will fix it. Thanks

-- 
markos
