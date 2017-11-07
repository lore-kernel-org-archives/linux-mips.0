Received: from mail-ot0-x234.google.com ([IPv6:2607:f8b0:4003:c0f::234]:52091
        "EHLO mail-ot0-x234.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23992143AbdKGQGSchK2y (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 7 Nov 2017 17:06:18 +0100
MIME-Version: 1.0
In-Reply-To: <CACRpkdZLggJA_qcRSJv4tndHDU4SG6HhP1U8uJpiKn=gBpAneA@mail.gmail.com>
References: <5a0159b6.08bc500a.ebe4b.25c6@mx.google.com> <CAK8P3a3QKkGv6eSjX7wH6LpOY0-1XUPFoX0ntog5-ZSHPab6iA@mail.gmail.com>
 <CACRpkdZLggJA_qcRSJv4tndHDU4SG6HhP1U8uJpiKn=gBpAneA@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 7 Nov 2017 17:06:11 +0100
Message-ID: <CAK8P3a2ROugscy=WzxsND+fN-g+MX2znXdxLXxG06bH1uST93A@mail.gmail.com>
Subject: Re: next/master build: 214 builds: 26 failed, 188 passed, 28 errors,
 6333 warnings (next-20171107)
Content-Type: text/plain; charset="UTF-8"
Return-Path: <arndbergmann@gmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "kernelci.org bot" <bot@kernelci.org>, Kernel Build Reports Mailman List <kernel-build-reports@lists.linaro.org>, "open list:RALINK MIPS ARCHITECTURE" <linux-mips@linux-mips.org>, Ralf Baechle <ralf@linux-mips.org>, David Daney <david.daney@cavium.com>, Masami Hiramatsu <mhiramat@kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, DTML <devicetree@vger.kernel.org>
Message-ID: <20171107160611.Pw7294nKbVN0e-ucEgsEad1hSHSYfYydAKn6dmmDZuM@z>

On Tue, Nov 7, 2017 at 4:21 PM, Linus Walleij <linus.walleij@linaro.org> wrote:
> On Tue, Nov 7, 2017 at 1:15 PM, Arnd Bergmann <arnd@arndb.de> wrote:
>
>>> 2 arch/arm/mach-footbridge/dc21285.c:145:2: error: expected ';' before 'else'
>>
>> A harmless rework that Linus Walleij did apparently uncovered an
>> ancient bug. I'm
>> waiting for Linus to suggest a fix.
>
> In footbridge? Oh my. I just sent a fix for an ancient bug in the
> mach-sa1100 simpad.c
> boardfile. Isn't that what you're referring to?
>
> (I intended to CC you but git send-email doesn't pick up Reported-by..
> I'll forward.)

My mistake, I confused the two output lines. This one is one that I
already fixed,
it came from Kees' timer conversion.

      Arnd
