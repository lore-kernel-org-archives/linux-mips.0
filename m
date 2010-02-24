Received: from mail-fx0-f217.google.com ([209.85.220.217]:55671 "EHLO
        mail-fx0-f217.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S1491081Ab0BXH5d convert rfc822-to-8bit
        (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Wed, 24 Feb 2010 08:57:33 +0100
MIME-Version: 1.0
In-Reply-To: <20100223230618.GD21949@linux-mips.org>
References: <1266956534-24753-1-git-send-email-manuel.lauss@gmail.com>
         <20100223230618.GD21949@linux-mips.org>
Date: Wed, 24 Feb 2010 08:57:27 +0100
Message-ID: <f861ec6f1002232357l112e2396qd063fd1c1bbdb46@mail.gmail.com>
Subject: Re: [PATCH -queue v2] MIPS: Alchemy: use 36bit addresses for PCMCIA
        resources.
From: Manuel Lauss <manuel.lauss@googlemail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT
Return-Path: <manuel.lauss@googlemail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Ralf Baechle <ralf@linux-mips.org>
Cc: Linux-MIPS <linux-mips@linux-mips.org>, Manuel Lauss <manuel.lauss@gmail.com>
Message-ID: <20100224075727.0UT0In1HLnzXqF8YoaGSaLK44A6pmauEs-LlT_nhvo0@z>

On Wed, Feb 24, 2010 at 12:06 AM, Ralf Baechle <ralf@linux-mips.org> wrote:
> On Tue, Feb 23, 2010 at 09:22:14PM +0100, Manuel Lauss wrote:
>
>> On Alchemy the PCMCIA area lies at the end of the chips 36bit system
>> bus area.  Currently, addresses at the far end of the 32bit area
>> are assumed to belong to the PCMCIA area and fixed up to the real
>> 36bit address before being passed to ioremap().
>>
>> A previous commit enabled 64 bit physical size for the resource
>> datatype on Alchemy and this allows to use the correct
>> 36bit addresses when registering the PCMCIA sockets.
>>
>> This patch removes the 32-to-36bit address fixup and registers the
>> Alchemy demoboard pcmcia socket with the correct 36bit physical
>> addresses.
>>
>> Tested on DB1200, with a CF card (ide-cs driver) and a 3c589 pcmcia
>> ethernet card.
>>
>> Signed-off-by: Manuel Lauss <manuel.lauss@gmail.com>
>
> Thanks, queued for 2.6.34.

Please drop this one for now, I forgot to change the XXS1500 board
and driver code.  I'll resend an updated version.

Thanks,
     Manuel Lauss
