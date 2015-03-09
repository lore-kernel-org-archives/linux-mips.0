Received: from mailapp01.imgtec.com ([195.59.15.196]:56877 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27006157AbbCIInitiWWx (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 9 Mar 2015 09:43:38 +0100
Message-ID: <54FD5D34.7060201@imgtec.com>
Date: Mon, 9 Mar 2015 08:43:32 +0000
From: Markos Chandras <Markos.Chandras@imgtec.com>
MIME-Version: 1.0
Subject: Re: [PATCH 1/4] MIPS: asm: r4kcache: Use correct base register for
 MIPS R6 cache flushes
References: <1425408530-21613-1-git-send-email-markos.chandras@imgtec.com> <1425408530-21613-2-git-send-email-markos.chandras@imgtec.com> <alpine.LFD.2.11.1503050245540.18344@eddie.linux-mips.org>
In-Reply-To: <alpine.LFD.2.11.1503050245540.18344@eddie.linux-mips.org>
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
Cc: linux-mips@linux-mips.org
Message-ID: <20150309084332.LDEpTvskEOd5Oyl4QwtIx9ZdJJ-sUU-KIim56Kghp3w@z>

On 03/05/2015 01:46 PM, Maciej W. Rozycki wrote:
> On Tue, 3 Mar 2015, Markos Chandras wrote:
> 
>> Commit 934c79231c1b("MIPS: asm: r4kcache: Add MIPS R6 cache unroll
>> functions") added support for MIPS R6 cache flushes but it used the
>> wrong base address register to perform the flushes so the same lines
>> were flushed over and over. Moreover, replace the "addiu" instructions
>> with LONG_ADDIU so the correct base address is calculated for 64-bit
>> cores.
> 
>  Since this operates on addresses shouldn't PTR_ADDIU be used instead?
> 
>   Maciej
> 

I don't know. I thought PTR_ADDIU should be used for pointers but the
arguments in these macros are "unsigned long".

-- 
markos
