Received: from gv-out-0910.google.com ([216.239.58.185]:25046 "EHLO
        gv-out-0910.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S1493424Ab0AZSks convert rfc822-to-8bit
        (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Tue, 26 Jan 2010 19:40:48 +0100
Received: by gv-out-0910.google.com with SMTP id r4so349419gve.2
        for <linux-mips@linux-mips.org>; Tue, 26 Jan 2010 10:40:47 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <f861ec6f1001260958n5d011155p8dd95346b6e57239@mail.gmail.com>
References: <1264527242-9214-1-git-send-email-manuel.lauss@gmail.com>
         <4B5F29EE.1060906@caviumnetworks.com>
         <f861ec6f1001260958n5d011155p8dd95346b6e57239@mail.gmail.com>
Date: Tue, 26 Jan 2010 19:40:47 +0100
Message-ID: <f861ec6f1001261040k79588f8fy9221ac31cdb3064b@mail.gmail.com>
Subject: Re: [PATCH] MIPS: Alchemy: fix dbdma ring destruction memory
        debugcheck.
From: Manuel Lauss <manuel.lauss@googlemail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
Return-Path: <linux-mips-bounce@linux-mips.org>
To: David Daney <ddaney@caviumnetworks.com>
Cc: Linux-MIPS <linux-mips@linux-mips.org>, Manuel Lauss <manuel.lauss@gmail.com>
Message-ID: <20100126184047.xTXuGYLPhpFKbjqZ5fLxWzXtxoL8D941ESl8blXcQzg@z>

David,

On Tue, Jan 26, 2010 at 6:58 PM, Manuel Lauss
<manuel.lauss@googlemail.com> wrote:
> On Tue, Jan 26, 2010 at 6:44 PM, David Daney <ddaney@caviumnetworks.com> wrote:
>> Manuel Lauss wrote:
>>>
>>> DBDMA descriptors need to be located at 32-byte aligned addresses;
>>> however kmalloc rarely delivers such addresses.  The dbdma code
>>> works around that by allocating 63 bytes and re-aligning the
>>> descriptor base afterwards.  Hoewever when freeing memory it does
>>> not account for this adjustment and trips the kfree debugcheck:
>>>
>>
>> Correct me if I am wrong, but don't kmalloc et al. return blocks aligned
>>  boundaries of the size rounded up the the next power of two?  So if you
>> need 32-byte aligned addresses, just use a size value of 32 or greater.  You
>> wouldn't have to add 63 and do masking and remember the membase value as you
>> do in the patch.
>
> The description is not completely correct (I suck a writing those):
> It allocates a number
> of descriptor entries (64 bytes each) specified by the driver in a single block:
>
>        desc_base = (u32)kmalloc(entries * sizeof(au1x_ddma_desc_t),
>                                 GFP_KERNEL|GFP_DMA);
>        if (desc_base == 0)
>                return 0;
>
>        if (desc_base & 0x1f) {
>
> So far the 3 users I have (mmc, spi, audio) always return true on the above
> check (2 descriptors for audio for instance).

... but only if CONFIG_DEBUG_SLAB is enabled.  You are correct in that
kmalloc() returns aligned blocks with a non-debug slab allocator and this
fix becomes superfluous.   I'll try to confirm this with the other
allocators and
resend with a fixed description.

Thank you for the pointer!
     Manuel Lauss
