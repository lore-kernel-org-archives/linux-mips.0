Received: from mailapp01.imgtec.com ([195.59.15.196]:55622 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27012580AbbLDIOrMUwnY (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 4 Dec 2015 09:14:47 +0100
Subject: Re: [PATCH 0/9] MIPS Relocatable kernel & KASLR
References: <1449137297-30464-1-git-send-email-matt.redfearn@imgtec.com>
 <5660C0D5.208@gentoo.org>
From: Matt Redfearn <matt.redfearn@imgtec.com>
Message-ID: <56614B70.9090700@imgtec.com>
Date: Fri, 4 Dec 2015 08:14:40 +0000
MIME-Version: 1.0
In-Reply-To: <5660C0D5.208@gentoo.org>
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
To: Joshua Kinard <kumba@gentoo.org>
Cc: linux-mips@linux-mips.org
Message-ID: <20151204081440.uLExvjQ4Er2qQJDBOR2T2182BglRD0yEFqcQ8MxLLyU@z>

Hi Joshua,
The patch as it stands uses a couple of MIPS R2 additional instructions 
to deal with synchronizing icache. Firstly, the synci instruction to 
ensure that icache is in sync with the dcache after the relocated kernel 
has been written, and the jr.hb instruction to resolve any hazards 
created by writing the new kernel before jumping to it.

Thanks,
Matt

On 03/12/15 22:23, Joshua Kinard wrote:
> On 12/03/2015 05:08, Matt Redfearn wrote:
>> This series adds the ability for the MIPS kernel to relocate itself at
>> runtime, optionally to an address determined at random each boot. This
>> series is based on v4.3 and has been tested on the Malta platform.
> [snip]
>
>> * Relocation is currently supported on R2 of the MIPS architecture,
>>    32bit and 64bit.
> Out of curiosity, why is this capability restricted to MIPS R2 and higher?
> IRIX kernels and the 'sash' tool were both relocatable on the older SGI
> platforms.  Does the feature, as implemented, rely on R2-specific
> instructions/capabilities, or only due to lack of testing on pre-R2 hardware?
>
> --J
>
