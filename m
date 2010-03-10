Received: from mail-fx0-f217.google.com ([209.85.220.217]:44138 "EHLO
        mail-fx0-f217.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S1492620Ab0CJSeH convert rfc822-to-8bit
        (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Wed, 10 Mar 2010 19:34:07 +0100
MIME-Version: 1.0
In-Reply-To: <20100310164824.GC15118@linux-mips.org>
References: <1268076181-29642-1-git-send-email-manuel.lauss@gmail.com>
         <1268076181-29642-3-git-send-email-manuel.lauss@gmail.com>
         <4B963210.7030906@ru.mvista.com>
         <f861ec6f1003090345n53570102je68aef14e8b3f3fb@mail.gmail.com>
         <4B96364E.5050202@mvista.com>
         <f861ec6f1003090403j190d0ddbp7e245d0990a62a51@mail.gmail.com>
         <20100310164824.GC15118@linux-mips.org>
Date: Wed, 10 Mar 2010 19:34:00 +0100
Message-ID: <f861ec6f1003101034u25d2acdcjd6dedc4c2221037e@mail.gmail.com>
Subject: Re: [PATCH] MIPS: Alchemy: move MMC driver registration to board
        code.
From: Manuel Lauss <manuel.lauss@googlemail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT
Return-Path: <manuel.lauss@googlemail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Ralf Baechle <ralf@linux-mips.org>
Cc: Sergei Shtylyov <sshtylyov@mvista.com>, Linux-MIPS <linux-mips@linux-mips.org>, Manuel Lauss <manuel.lauss@gmail.com>
Message-ID: <20100310183400.r3s94nd4acBc24RhKQhvZUIUAdQoeSC6Dp0UF0hLTLY@z>

On Wed, Mar 10, 2010 at 5:48 PM, Ralf Baechle <ralf@linux-mips.org> wrote:
> On Tue, Mar 09, 2010 at 01:03:51PM +0100, Manuel Lauss wrote:
>
>> And on a personal note, that file just bothers me.  It's messy, can
>> cause merge conflicts,
>
> Eye cancer.
>
>> it references structures defined inside board-specific code. In short,
>> it just plain annoys
>> my sense of aesthetics.
>
> Indeed - and I don't think Sergej disagrees with that.  I agree with him
> that device registration code should primarily be done in the SOC code -

For things like fixed internal interrupts, sure.  But for pieces that depend
on where the (and which) chip is used, not so much.

By this logic there should be tons of ifdefs in the interrupt tables for every
in-tree board.


> but you'll need to somehow get that code to communicate with the platform
> code about what really needs to be done then register the remainder of
> the truely platform-specific platform devices.  Something like that.

I prefer a simpler solution.

Manuel
