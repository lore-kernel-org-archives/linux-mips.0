Received: from mail-fx0-f214.google.com ([209.85.220.214]:32927 "EHLO
        mail-fx0-f214.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S1491839Ab0A1IYD convert rfc822-to-8bit
        (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Thu, 28 Jan 2010 09:24:03 +0100
MIME-Version: 1.0
In-Reply-To: <20100127221818.GB26426@linux-mips.org>
References: <1264534773-24909-1-git-send-email-manuel.lauss@gmail.com>
         <20100127221818.GB26426@linux-mips.org>
Date: Thu, 28 Jan 2010 09:23:56 +0100
Message-ID: <f861ec6f1001280023n7753c77wfd626d731ddc690a@mail.gmail.com>
Subject: Re: [PATCH v2] MIPS: Alchemy: fix dbdma ring destruction memory
        debugcheck.
From: Manuel Lauss <manuel.lauss@googlemail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
Return-Path: <linux-mips-bounce@linux-mips.org>
To: Ralf Baechle <ralf@linux-mips.org>
Cc: Linux-MIPS <linux-mips@linux-mips.org>, Manuel Lauss <manuel.lauss@gmail.com>
Message-ID: <20100128082356._73EQXVTTAR8WUtzRolbST4sxYWsCp699hJE4R9Ge5k@z>

>> This fix is only necessary with the SLAB allocator and CONFIG_DEBUG_SLAB
>> enabled;  non-debug SLAB, SLUB do return nicely aligned addresses,
>> debug-enabled SLUB currently panics early in the boot process.
>
> Queued for 2.6.34 - should this also go into 2.6.33?

2.6.33 and .32 at least.  That code has been in there since the dawn of 2.6;
the fact that nobody has tripped over this so far means that noone build kernels
with slab debugging (I tripped over this while looking for something else) or
the slab allocator behaviour changed recently.


> Have you considered increasing the value ARCH_KMALLOC_MINALIGN which
> defaults to 8?  Or your own slab cache of suitable alignment?  The latter
> is more something for frequent allocations.

I have to admit I know nothing about Linux' memory management.  Are slab
caches not affected by the what I presume are "guard bytes" inserted into
the memory areas when slab debug is on?

Manuel
