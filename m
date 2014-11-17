Received: from mailapp01.imgtec.com ([195.59.15.196]:16737 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27013859AbaKQUNMsnz9J (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 17 Nov 2014 21:13:12 +0100
Message-ID: <546A56C9.4060608@imgtec.com>
Date: Mon, 17 Nov 2014 12:12:57 -0800
From: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>
MIME-Version: 1.0
Subject: Re:  MIPS: c-r4k.c: Fix the 74K D-cache alias erratum workaround
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
To: "Maciej W. Rozycki" <macro@codesourcery.com>
Cc: Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org
Message-ID: <20141117201257.bf0xLm_9z_aV3zi7sy1cEW5EfNTlsUqwK97kNUqzBsk@z>

 > Fix the 74K D-cache alias erratum workaround so that it actually works.
 > Our current code sets MIPS_CACHE_VTAG for the D-cache, but that flag
 > only has any effect for the I-cache.  Additionally MIPS_CACHE_PINDEX is
 > set for the D-cache if CP0.Config7.AR is also set for an affected
 > processor, leading to confusing information in the bootstrap log (the
 > flag isn't used beyond that).

 > So delete the setting of MIPS_CACHE_VTAG and rely on MIPS_CACHE_ALIASES,
 > set in a common place, removing I-cache coherency issues seen in GDB
 > testing with software breakpoints, gdbserver and ptrace(2), on affected
 > systems.

 > While at it add a little piece of explanation of what CP0.Config6.SYND
 > is so that people do not have to chase documentation.

This shift to MIPS_CACHE_ALIASES is not needed, a use of MIPS_CACHE_VTAG 
in dcache is actually a way how to prevent some very specific situations 
in 74K(E77)/1074K(E17) cache handling. It is not a case of cache 
aliasing and name VTAG is used because it is related with virtual 
address conversion tagging. I reused MIPS_CACHE_VTAG just to save some 
spare bits in cpu_info.options and because D-cache never had virtual 
tagging like I-cache.

The setting d-cache aliases then CPU hasn't it is a significant 
performance loss and should be avoided.

Please don't use this patch.

- Leonid.
