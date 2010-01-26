Received: from gv-out-0910.google.com ([216.239.58.185]:63606 "EHLO
        gv-out-0910.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S1492063Ab0AZQak convert rfc822-to-8bit
        (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Tue, 26 Jan 2010 17:30:40 +0100
MIME-Version: 1.0
In-Reply-To: <1264521494.24895.28.camel@falcon>
References: <8c337354c30ac911207df81abd13197c897b2380.1264517495.git.wuzhangjin@gmail.com>
         <f861ec6f1001260728x64c54ec7m65bc6ebc0ee64a80@mail.gmail.com>
         <1264521494.24895.28.camel@falcon>
Date: Tue, 26 Jan 2010 17:30:39 +0100
Message-ID: <f861ec6f1001260830x6facb42fi37074dcc1c2afade@mail.gmail.com>
Subject: Re: [PATCH -queue v2] MIPS: Cleanup the debugging of compressed
        kernel support
From: Manuel Lauss <manuel.lauss@googlemail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
Return-Path: <linux-mips-bounce@linux-mips.org>
To: wuzhangjin@gmail.com
Cc: Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org
Message-ID: <20100126163039.vfiMMDPIl8eqLlGF_ca64GaSlLv2biSGN06bb2lnxXs@z>

On Tue, Jan 26, 2010 at 4:58 PM, Wu Zhangjin <wuzhangjin@gmail.com> wrote:
> On Tue, 2010-01-26 at 16:28 +0100, Manuel Lauss wrote:
>> Hi,
>>
>> On Tue, Jan 26, 2010 at 4:02 PM, Wu Zhangjin <wuzhangjin@gmail.com> wrote:
>> > Changes from v1 (feedbacks from Ralf):
>> >
>> >  o make DEBUG_ZBOOT also depend on DEBUG_KERNEL
>> >
>> >  o DEBUG_ZBOOT already depends on SYS_SUPPORTS_ZBOOT_UART16550 so simplify the
>>
>> Not every chip has a standard 16550, unfortunately.  I liked your
>> first iteration better:
>> DEBUG_ZBOOT visible at all times (or depend on DEBUG_KERNEL)  another
>> (invisible)
>> config symbol selecting the code to build (i.e. SYS_SUPPORTS_ZBOOT_UART16550
>> for your loongson boxes, MACH_ALCHEMY for alchemy, and nothing for unsupported
>> chips).
>>
>
> Yes, It will be not convenient for a new serial port debugging support
> with the current modification, for example, if you add UARTXXXX, we need
> to select it for the new board and also add it under the "depends" of
> DEBUG_ZBOOT. how about this?

[...]

Fine with me.  I'll resend an updated Alchemy zboot debug patch once
this has been applied.

Thank you!
     Manuel Lauss
