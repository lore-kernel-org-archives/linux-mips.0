Received: from mail.bmw-carit.de ([62.245.222.98]:54844 "EHLO
        mail.bmw-carit.de" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27011791AbcBKMOkhK2Mv (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 11 Feb 2016 13:14:40 +0100
Subject: Re: [PATCH v4 2/2] mips: Differentiate between 32 and 64 bit ELF
 header
References: <56BAD881.9000208@bmw-carit.de>
 <1455096081-7176-1-git-send-email-daniel.wagner@bmw-carit.de>
 <1455096081-7176-3-git-send-email-daniel.wagner@bmw-carit.de>
 <20160211104903.GD11091@linux-mips.org>
 <alpine.DEB.2.00.1602111153320.15885@tp.orcam.me.uk>
From: Daniel Wagner <daniel.wagner@bmw-carit.de>
Message-ID: <56BC7B2B.9010605@bmw-carit.de>
Date: Thu, 11 Feb 2016 13:14:35 +0100
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.00.1602111153320.15885@tp.orcam.me.uk>
Content-Type: text/plain; charset="iso-8859-7"
Content-Transfer-Encoding: 8bit
Return-Path: <daniel.wagner@bmw-carit.de>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: "Maciej W. Rozycki" <macro@imgtec.com>, Ralf Baechle <ralf@linux-mips.org>
Cc: linux-kernel@vger.kernel.org, linux-mips@linux-mips.org
Message-ID: <20160211121435.A-tX6aoBydT3Jt7-pWGofaIrNjkalZqBv9oOxY-MbP0@z>

On 02/11/2016 01:04 PM, Maciej W. Rozycki wrote:
> On Thu, 11 Feb 2016, Ralf Baechle wrote:
>> Thanks, applied.
>>
>> I'm getting a less spectacular warning from gcc 5.2:
>>
>>   CC      fs/proc/vmcore.o
>> fs/proc/vmcore.c: In function ¡parse_crash_elf64_headers¢:
>> fs/proc/vmcore.c:939:47: warning: initialization from incompatible pointer type [-Wincompatible-pointer-types]
> 
>  Yes, the temporaries still need to have their pointed types changed, to 
> `Elf32_Ehdr' and `Elf64_Ehdr' respectively, as in the original change.
> 
>  I had it mentioned in a WIP version of my review (stating that it would 
> verify that the correct type is used by the caller), but then deleted that 
> part inadvertently, sigh.

Yeah, that part fall through the cracks.

>  Daniel, sorry for the extra iteration.

No problem. Just a sec.

cheers,
daniel
