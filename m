Received: from mail-vw0-f49.google.com ([209.85.212.49]:43610 "EHLO
        mail-vw0-f49.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S1492338Ab0DVPbo (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 22 Apr 2010 17:31:44 +0200
Received: by vws3 with SMTP id 3so1913486vws.36
        for <linux-mips@linux-mips.org>; Thu, 22 Apr 2010 08:31:36 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <j2sdf5e30c51004172251z9fd01867h562b99c1f1044c26@mail.gmail.com>
References: <j2sdf5e30c51004172251z9fd01867h562b99c1f1044c26@mail.gmail.com>
Date: Thu, 22 Apr 2010 23:31:34 +0800
Message-ID: <m2qdf5e30c51004220831n66ff859fxd71f6bd14a5af56f@mail.gmail.com>
Subject: Re: Ask help:why my 64-bit ELF file could not run at the 64-bit mips
        cpu
From: Jian Wang <dominicwj@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Return-Path: <dominicwj@gmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org
Message-ID: <20100422153134.u_IFZdPEBjAcsLMXLtE8VkDojrhUPZc49P86i3J9HDQ@z>

Hi,

 I have a 64-bit mips cpu, and compiled a 64-bit application, but this
 application could not run. (the target is running Linux)
 The details is:
 1)if I compile the application with -mabi=n64, this program could not
 run, when I run it in the shell, it prompts "command not found"
 2)but if I compile the application with -mabi=n32, it runs well and
 gives the correct result.

 I am wondering why with "-mabi=n64", this program could not run? I
 checked the CP0(status register), Bit px=0b0, KX=0b1, SX=0b1, UX=0b1,
 it seems that in User Mode, it accepts 64-bit operation.

 Anybody could give me some help? Any comments is much appreciated!!

 BR/Dominic
