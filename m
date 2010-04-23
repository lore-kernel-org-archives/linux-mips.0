Received: from mail-ww0-f49.google.com ([74.125.82.49]:35585 "EHLO
        mail-ww0-f49.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S1492105Ab0DWJ0q convert rfc822-to-8bit
        (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Fri, 23 Apr 2010 11:26:46 +0200
Received: by wwi17 with SMTP id 17so411229wwi.36
        for <linux-mips@linux-mips.org>; Fri, 23 Apr 2010 02:26:40 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <h2hdf5e30c51004230142q21184429pffcaa9351510bc2d@mail.gmail.com>
References: <j2sdf5e30c51004172251z9fd01867h562b99c1f1044c26@mail.gmail.com>
         <q2odf5e30c51004220901l8bfa979ftc9c6a7b633569460@mail.gmail.com>
         <4BD08329.80804@adax.com>
         <h2hdf5e30c51004230142q21184429pffcaa9351510bc2d@mail.gmail.com>
Date: Fri, 23 Apr 2010 11:26:40 +0200
Message-ID: <o2m10f740e81004230226n62d514a7z4f131815d4882b1d@mail.gmail.com>
Subject: Re: Ask help:why my 64-bit ELF file could not run at the 64-bit mips
        cpu
From: Geert Uytterhoeven <geert@linux-m68k.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-Path: <geert.uytterhoeven@gmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Dominic <dominicwj@gmail.com>
Cc: Jan Rovins <janr@adax.com>, linux-mips@linux-mips.org
Message-ID: <20100423092640.PQS1ktPrMtEdib621R11wkjPtZy4tlcvaP8xq2tBiFs@z>

On Fri, Apr 23, 2010 at 10:42, Dominic <dominicwj@gmail.com> wrote:
> Thanks a lot for your precious reply! I try to use -static to compile
> the program, then the 64-bit program can run, so it should be the
> library related other than 64-bit instruction or addressing related.
> Then I stored the 64-bit libraries in nfs, and mount it on the target
> board, after adding the path to ld.so.conf and 'ldconfig', the program
> compiled without -static still does not run. Shall I miss something?

`ldd <your_program>' may tell you...

> On Fri, Apr 23, 2010 at 1:11 AM, Jan Rovins <janr@adax.com> wrote:
>> Jian Wang wrote:
>>>
>>> Hi,
>>>
>>>  I have a 64-bit mips cpu, and compiled a 64-bit application, but this
>>>  application could not run. (the target is running Linux)
>>>  The details is:
>>>  1)if I compile the application with -mabi=n64, this program could not
>>>  run, when I run it in the shell, it prompts "command not found"
>>>  2)but if I compile the application with -mabi=n32, it runs well and
>>>  gives the correct result.
>>>
>>>  I am wondering why with "-mabi=n64", this program could not run? I
>>>  checked the CP0(status register), Bit px=0b0, KX=0b1, SX=0b1, UX=0b1,
>>>  it seems that in User Mode, it accepts 64-bit operation.
>>>
>>>  Anybody could give me some help? Any comments is much appreciated!!
>>>
>>>  BR/Dominic
>>>
>>>
>>
>> Perhaps you do not have the "n64" system libraries set up correctly in
>> userspace.
>> I have seen the "command not found" error when some fundamental libraries or
>> the loader was missing.
>>
>> Do you have a /lib64 & /user/lib64?
>> Run the file command on some of those libraries & see if they are n64 or n32
>> libs.
>>
>> double check your ld.so.conf to make sure it points to every thing you need.
>> re run ldconfig if you change something.

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
