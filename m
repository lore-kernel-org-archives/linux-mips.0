Received: from mailapp01.imgtec.com ([195.59.15.196]:24971 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27012507AbcBKMEnjqaPv (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 11 Feb 2016 13:04:43 +0100
Date: Thu, 11 Feb 2016 12:04:35 +0000
From: "Maciej W. Rozycki" <macro@imgtec.com>
Subject: Re: [PATCH v4 2/2] mips: Differentiate between 32 and 64 bit ELF
 header
In-Reply-To: <20160211104903.GD11091@linux-mips.org>
Message-ID: <alpine.DEB.2.00.1602111153320.15885@tp.orcam.me.uk>
References: <56BAD881.9000208@bmw-carit.de> <1455096081-7176-1-git-send-email-daniel.wagner@bmw-carit.de> <1455096081-7176-3-git-send-email-daniel.wagner@bmw-carit.de> <20160211104903.GD11091@linux-mips.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-7"
Content-Transfer-Encoding: 8BIT
Return-Path: <Maciej.Rozycki@imgtec.com>
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
Cc: Daniel Wagner <daniel.wagner@bmw-carit.de>, linux-kernel@vger.kernel.org, linux-mips@linux-mips.org
Message-ID: <20160211120435.ah54hMpQzuh_iXu2eS9NWc0Hd4JlHkpz6w9HTERdTh8@z>

On Thu, 11 Feb 2016, Ralf Baechle wrote:

> > Signed-off-by: Daniel Wagner <daniel.wagner@bmw-carit.de>
> > Suggested-by: Maciej W. Rozycki <macro@imgtec.com>
> > Reviewed-by: Maciej W. Rozycki <macro@imgtec.com>
> > Reported-by: Fengguang Wu <fengguang.wu@intel.com>
> 
> Thanks, applied.
> 
> I'm getting a less spectacular warning from gcc 5.2:
> 
>   CC      fs/proc/vmcore.o
> fs/proc/vmcore.c: In function ¡parse_crash_elf64_headers¢:
> fs/proc/vmcore.c:939:47: warning: initialization from incompatible pointer type [-Wincompatible-pointer-types]

 Yes, the temporaries still need to have their pointed types changed, to 
`Elf32_Ehdr' and `Elf64_Ehdr' respectively, as in the original change.

 I had it mentioned in a WIP version of my review (stating that it would 
verify that the correct type is used by the caller), but then deleted that 
part inadvertently, sigh.

 Daniel, sorry for the extra iteration.

  Maciej
