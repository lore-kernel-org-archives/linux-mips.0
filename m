Received: from mail-fx0-f227.google.com ([209.85.220.227]:43812 "EHLO
        mail-fx0-f227.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S1492509Ab0CIMD7 convert rfc822-to-8bit
        (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Tue, 9 Mar 2010 13:03:59 +0100
Received: by fxm27 with SMTP id 27so2658572fxm.28
        for <linux-mips@linux-mips.org>; Tue, 09 Mar 2010 04:03:52 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <4B96364E.5050202@mvista.com>
References: <1268076181-29642-1-git-send-email-manuel.lauss@gmail.com>
         <1268076181-29642-3-git-send-email-manuel.lauss@gmail.com>
         <4B963210.7030906@ru.mvista.com>
         <f861ec6f1003090345n53570102je68aef14e8b3f3fb@mail.gmail.com>
         <4B96364E.5050202@mvista.com>
Date: Tue, 9 Mar 2010 13:03:51 +0100
Message-ID: <f861ec6f1003090403j190d0ddbp7e245d0990a62a51@mail.gmail.com>
Subject: Re: [PATCH] MIPS: Alchemy: move MMC driver registration to board
        code.
From: Manuel Lauss <manuel.lauss@googlemail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT
Return-Path: <manuel.lauss@googlemail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Sergei Shtylyov <sshtylyov@mvista.com>
Cc: Linux-MIPS <linux-mips@linux-mips.org>, Manuel Lauss <manuel.lauss@gmail.com>
Message-ID: <20100309120351.s67YReueKkJLTRhXSHvB8TXSHnERBCvzdMcyUVAh5Bg@z>

On Tue, Mar 9, 2010 at 12:51 PM, Sergei Shtylyov <sshtylyov@mvista.com> wrote:
> Manuel Lauss wrote:
>
>>>> Where it really belongs to.
>>>
>>> I disagree (again). SoC platform devices dont belong with the board code.
>>>
>>
>> Figured as much.  However with additional boards the #ifdef mess in
>> common/platform.c
>> is only going to get worse. MUCH worse.
>
>  We could probably eliminate the board #ifdef in platfrom.c by not supplying
> the platfrom data for MMC1.

What if I wanted to build a kernel which supports multiple different
Au1200-based systems, like the SH-port does with its mach vector?


>> Just look at the au1000-eth platform data situation!
>> I have these platform devices on Au1200/Au1300 even thought they don't
>> have
>> a built-in MAC.
>>
>
>  Need to add the SoC type checks then when registering the devices. Or at
> least the #ifdef's. :-)

I'd like to get rid of the ifdefs, not encourage them to mate and multiply ;-)


>> The board which uses the device should register it.
>
>  Contrarywise, the SoC that has the devices, should register them.

My point is that most drivers require additional information from the board, and
maybe due to hardware design the ids may need to be swapped.  Rather than
#ifdeffing these cases for every board in a central file I'd let the board using
the devices sort this out.

In my case, I don't need UART0 of the Au1200, but need UART1 to be ttyS0.

And on a personal note, that file just bothers me.  It's messy, can
cause merge conflicts,
it references structures defined inside board-specific code. In short,
it just plain annoys
my sense of aesthetics.

Manuel
