Received: from mail-gy0-f177.google.com ([209.85.160.177]:55993 "EHLO
        mail-gy0-f177.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S1492272Ab0FAGXa convert rfc822-to-8bit
        (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Tue, 1 Jun 2010 08:23:30 +0200
Received: by gyb11 with SMTP id 11so3401178gyb.36
        for <linux-mips@linux-mips.org>; Mon, 31 May 2010 23:23:23 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20100531211842.GA795@merkur.ravnborg.org>
References: <1275332878-19762-1-git-send-email-manuel.lauss@googlemail.com>
        <20100531211842.GA795@merkur.ravnborg.org>
Date: Tue, 1 Jun 2010 08:23:21 +0200
Message-ID: <AANLkTilUtwCpTjAdUxLJSjnwUe3i2aKlIrdnQ_ZBH6j5@mail.gmail.com>
Subject: Re: [PATCH -queue] MIPS: Move Alchemy Makefile parts to their own
        Platform file.
From: Manuel Lauss <manuel.lauss@googlemail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
Return-Path: <linux-mips-bounce@linux-mips.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Linux-MIPS <linux-mips@linux-mips.org>
Message-ID: <20100601062321.3YbylAgw8sEmUQxDzoT1ch0Ewd1Y5qGnP0jIVLXdgik@z>

Hi Sam,
On Mon, May 31, 2010 at 11:18 PM, Sam Ravnborg <sam@ravnborg.org> wrote:

>> --- a/arch/mips/Kbuild.platforms
>> +++ b/arch/mips/Kbuild.platforms
>> @@ -1,6 +1,6 @@
>>  # All platforms listed in alphabetic order
>>
>> -platforms += ar7
>> +platforms += alchemy ar7
>
> One line per paltform is better.
> Then the risk for conflicts are less and merging in easier.
> Like this:
>
> platforms += ar7
> platforms += alchemy

Done,


>> diff --git a/arch/mips/alchemy/Platform b/arch/mips/alchemy/Platform
>> new file mode 100644
>> index 0000000..1994fdc
>> --- /dev/null
>> +++ b/arch/mips/alchemy/Platform
>> @@ -0,0 +1,103 @@
>> +#
>> +# Common Alchemy Au1x00 stuff
>> +#
>> +core-$(CONFIG_SOC_AU1X00)    += arch/mips/alchemy/common/
>
> The above is actually wrong - despite that it works.
> You are supposed to use:
>
> platform-$(CONFIG_SOC_AU1X00) += alchemy/common/
>
> Then arch/mips/Kbuild will pick it up.
> And then subdirs-ccflags-y := -Werror will also take effect.

Ah, interesting.  I shall look at the full commandline in the future.

I'll do a build of all alchemy boards and resend when there are
no breakages.

Thank you!
     Manuel Lauss
