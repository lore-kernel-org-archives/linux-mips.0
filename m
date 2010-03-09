Received: from mail-fx0-f227.google.com ([209.85.220.227]:49284 "EHLO
        mail-fx0-f227.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S1492507Ab0CILpq convert rfc822-to-8bit
        (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Tue, 9 Mar 2010 12:45:46 +0100
Received: by fxm27 with SMTP id 27so2641296fxm.28
        for <linux-mips@linux-mips.org>; Tue, 09 Mar 2010 03:45:40 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <4B963210.7030906@ru.mvista.com>
References: <1268076181-29642-1-git-send-email-manuel.lauss@gmail.com>
         <1268076181-29642-3-git-send-email-manuel.lauss@gmail.com>
         <4B963210.7030906@ru.mvista.com>
Date: Tue, 9 Mar 2010 12:45:39 +0100
Message-ID: <f861ec6f1003090345n53570102je68aef14e8b3f3fb@mail.gmail.com>
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
Message-ID: <20100309114539.TmLe-snCJCIH3clzYs22yTZCfnDzrYN9Dc0MEaceNgc@z>

On Tue, Mar 9, 2010 at 12:33 PM, Sergei Shtylyov <sshtylyov@mvista.com> wrote:
> Hello.
>
> Manuel Lauss wrote:
>
>> Where it really belongs to.
>>
>
>  I disagree (again). SoC platform devices dont belong with the board code.

Figured as much.  However with additional boards the #ifdef mess in
common/platform.c
is only going to get worse. MUCH worse. Just look at the au1000-eth
platform data situation!
I have these platform devices on Au1200/Au1300 even thought they don't have
a built-in MAC.

The board which uses the device should register it.  The UARTs are
kind of a special
case since they need to be fixed up with the correct busclock, but
that too could be
exported to an initialization wrapper.

But, consider the patch withdrawn.

Manuel
