Received: from mailapp01.imgtec.com ([195.59.15.196]:22594 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27007599AbbLDPpVS9uA7 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 4 Dec 2015 16:45:21 +0100
Subject: Re: [PATCH 6/9] MIPS: Call relocate_kernel if CONFIG_RELOCATABLE=y
References: <1449137297-30464-1-git-send-email-matt.redfearn@imgtec.com>
 <1449137297-30464-7-git-send-email-matt.redfearn@imgtec.com>
 <56605081.5050307@cogentembedded.com> <5660577F.2020401@imgtec.com>
 <56607FE6.7040001@cogentembedded.com>
 <BA73413A-D335-4692-85A4-9330D7ACAC03@albanarts.com>
 <56614CB5.9020002@imgtec.com> <20151204153716.GA16238@linux-mips.org>
From: Matt Redfearn <matt.redfearn@imgtec.com>
Message-ID: <5661B50A.6040703@imgtec.com>
Date: Fri, 4 Dec 2015 15:45:14 +0000
MIME-Version: 1.0
In-Reply-To: <20151204153716.GA16238@linux-mips.org>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-Path: <Matt.Redfearn@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Ralf Baechle <ralf@linux-mips.org>
Cc: James Hogan <james@albanarts.com>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, linux-mips@linux-mips.org
Message-ID: <20151204154514.golGhrWc5pVSaW1mE5xWV5rM8cknBkHSY0qRs3nCC3U@z>

On 04/12/15 15:37, Ralf Baechle wrote:
> On Fri, Dec 04, 2015 at 08:20:05AM +0000, Matt Redfearn wrote:
>
>>> Although, it could still be reduced:
>>> PTR_ADDU sp, gp, _THREAD_SIZE - 32 - PT_SIZE
>>>
>>> Assuming the immediate is in range of signed 16bit.
>> The immediate would be 32552, so in range of signed 16bit, but that would be
>> brittle if either _THREAD_SIZE or PT_SIZE were to change in future....
> The maximum value possible for _THREAD_SIZE would be with 64k pages for
> which the expression will exceed the signed 16 bit range.  The good news
> is that GAS is smart enough to cope with the situation by suitably
> expanding the instruction into a macro unless ".set noat" or ".set nomacro"
> mode are enabled:
>
> $ cat s.s
> 	addu	$sp, $gp, 65536
> [ralf@h7 tmp]$ mips-linux-as -O2 -als -o s.o s.s
> GAS LISTING s.s 			page 1
>
>
>     1 0000 3C010001 		addu	$sp, $gp, 65536
>     1      0381E821
>     1      00000000
>     1      00000000
>
> GAS LISTING s.s 			page 2
>
>
> NO DEFINED SYMBOLS
>
> NO UNDEFINED SYMBOLS
> [ralf@h7 tmp]$ mips-linux-objdump -d s.o
> s.o:     file format elf32-tradbigmips
>
>
> Disassembly of section .text:
>
> 00000000 <.text>:
>     0:	3c010001 	lui	at,0x1
>     4:	0381e821 	addu	sp,gp,at
> 	...
>
> And of course that macro should better not be expanded in a branch
> delay slot ...
>
>    Ralf
Cool, then it would be neater to do this (and perhaps the other instance 
of this for setting the original kernel stack pointer up). Would you 
prefer to see that in this series?

Thanks,
Matt
