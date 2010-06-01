Received: from mail-gy0-f177.google.com ([209.85.160.177]:45961 "EHLO
        mail-gy0-f177.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S1491129Ab0FAQsX convert rfc822-to-8bit
        (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Tue, 1 Jun 2010 18:48:23 +0200
Received: by gyb11 with SMTP id 11so3865343gyb.36
        for <linux-mips@linux-mips.org>; Tue, 01 Jun 2010 09:48:17 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20100601163528.GA5216@merkur.ravnborg.org>
References: <1275405795-9009-1-git-send-email-manuel.lauss@googlemail.com>
        <20100601163528.GA5216@merkur.ravnborg.org>
Date: Tue, 1 Jun 2010 18:47:59 +0200
Message-ID: <AANLkTikIiKmqjhuZKnguhyNeuCXnPeBLHSSeolCTf3d0@mail.gmail.com>
Subject: Re: [PATCH -queue v2] MIPS: Move Alchemy Makefile parts to their own
        Platform file.
From: Manuel Lauss <manuel.lauss@googlemail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
Return-Path: <linux-mips-bounce@linux-mips.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Linux-MIPS <linux-mips@linux-mips.org>
Message-ID: <20100601164759.Tgyu3NAkyszSzbQjua3gr2smQdT-FiEyn09PGqhNuic@z>

On Tue, Jun 1, 2010 at 6:35 PM, Sam Ravnborg <sam@ravnborg.org> wrote:
> On Tue, Jun 01, 2010 at 05:23:15PM +0200, Manuel Lauss wrote:
>> Cc: Sam Ravnborg <sam@ravnborg.org>
>> Signed-off-by: Manuel Lauss <manuel.lauss@googlemail.com>
>> ---
>> On top of latest mips-queue.  The changes to the mtx1/xx1500 Makefiles were
>> necessary to work around vmlinux link failures.
>
> Was this something the platform patches introduced or
> is it needed to fix the build?

Maybe.  Link failures with the "lib-y" parts do crop up occasionally.
Usually, the lib-y parts are built as the last files (along with other
arch/mips/lib code); with your changes they're built with the other
files in a directory:
 CC      arch/mips/alchemy/mtx-1/platform.o
  LD      arch/mips/alchemy/mtx-1/built-in.o
  CC      arch/mips/alchemy/mtx-1/board_setup.o
  CC      arch/mips/alchemy/mtx-1/init.o
  AR      arch/mips/alchemy/mtx-1/lib.a

That lib.a is apparently not picked up by the linker:
  LD      .tmp_vmlinux1
arch/mips/built-in.o: In function `plat_mem_setup':
/mnt/data/_home/mano/db1200/kernel/linux-2.6.git/arch/mips/alchemy/common/setup.c:55:
undefined reference to `board_setup'
/mnt/data/_home/mano/db1200/kernel/linux-2.6.git/arch/mips/alchemy/common/setup.c:55:
relocation truncated to fit: R_MIPS_26 against `board_setup'
arch/mips/built-in.o: In function `setup_arch':
/mnt/data/_home/mano/db1200/kernel/linux-2.6.git/arch/mips/kernel/setup.c:550:
undefined reference to `prom_init'
/mnt/data/_home/mano/db1200/kernel/linux-2.6.git/arch/mips/kernel/setup.c:550:
relocation truncated to fit: R_MIPS_26 against `prom_init'
[...]
make[1]: *** [.tmp_vmlinux1] Error 1
make: *** [sub-make] Error 2

Using obj-y is much more reliable.  I have no idea why some boards have
lib-y code; maybe Ralf knows more.


>> diff --git a/arch/mips/alchemy/Platform b/arch/mips/alchemy/Platform
>> new file mode 100644
>> index 0000000..495cc9a
>> --- /dev/null
>> +++ b/arch/mips/alchemy/Platform
>
> ...
>> +#
>> +# 4G-Systems eval board
>> +#
>> +platform-$(CONFIG_MIPS_MTX1) += alchemy/mtx-1/
>> +load-$(CONFIG_MIPS_MTX1)     += 0xffffffff80100000
>
>> diff --git a/arch/mips/alchemy/mtx-1/Makefile b/arch/mips/alchemy/mtx-1/Makefile
>> index 4a53815..4d1367e 100644
>> --- a/arch/mips/alchemy/mtx-1/Makefile
>> +++ b/arch/mips/alchemy/mtx-1/Makefile
>> @@ -6,7 +6,6 @@
>>  # Makefile for 4G Systems MTX-1 board.
>>  #
>>
>> -lib-y := init.o board_setup.o
>> -obj-y := platform.o
>> +obj-y := init.o board_setup.o platform.o
>>
>>  EXTRA_CFLAGS += -Werror
>
> In the above we added alchemy/mtx-1/ to platform-y
> so mtx-1/ is automatically covered by -Werror by arch/mips/Kbuild
>
> So the above assignment to EXTRA_CFLAGS is now redundant and can be dropped.

Okay, they're gone.

Thank you,
     Manuel Lauss
