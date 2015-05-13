Received: from mailapp01.imgtec.com ([195.59.15.196]:20280 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27012138AbbEMW6sJxOv- (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 14 May 2015 00:58:48 +0200
Message-ID: <5553D722.1030205@imgtec.com>
Date: Wed, 13 May 2015 15:58:42 -0700
From: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>
MIME-Version: 1.0
Subject: Re: [PATCH] MIPS64: 48 bit physaddr support in memory maps
References: <20150513185519.27601.4253.stgit@ubuntu-yegoshin> <5553C68C.6000000@gmail.com>
In-Reply-To: <5553C68C.6000000@gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-Path: <Leonid.Yegoshin@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: David Daney <ddaney.cavm@gmail.com>
Cc: linux-mips@linux-mips.org, linux-kernel@vger.kernel.org, ralf@linux-mips.org
Message-ID: <20150513225842.nNFeIcKWTZjldIFvbWFxN6Qjrb0hpBeMe4jGT6694v0@z>

On 05/13/2015 02:47 PM, David Daney wrote:
> On 05/13/2015 11:55 AM, Leonid Yegoshin wrote:
>> Originally, it was set to 40bits only but I6400 has 48bits of physaddr.
>>
>
> Why not go to the architectural limit of 59 bits?
>

Because any physaddr should fit PTE and EntryLo register and we also 
need 5 or 7 SW bits in PTE.

Even with fixed PTE bits layout from

     http://patchwork.linux-mips.org/patch/7613/

we need 5 or 7 additional bits, so the real limit is 54. And 54 is 
actually specified as a limit in EntryLo starting from MIPS R2.
