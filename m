Received: from mail-qg0-f49.google.com ([209.85.192.49]:36640 "EHLO
        mail-qg0-f49.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S27026561AbbEHQk1zjMAV (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 8 May 2015 18:40:27 +0200
MIME-Version: 1.0
In-Reply-To: <10776752.kPn2ooXz5Z@wuerfel>
References: <1431089958-2626-1-git-send-email-jaedon.shin@gmail.com>
 <1431089958-2626-2-git-send-email-jaedon.shin@gmail.com> <CAJiQ=7CQshXhGJ7ftWQSu_UxgKVaRprZPEPXWNP6ci_1bLrJrw@mail.gmail.com>
 <10776752.kPn2ooXz5Z@wuerfel>
From: Kevin Cernekee <cernekee@gmail.com>
Date: Fri, 8 May 2015 09:40:03 -0700
Message-ID: <CAJiQ=7Ajkae60eKfzr=mjPDov=bzoq7jBVDdQhGO37G8GGKK3w@mail.gmail.com>
Subject: Re: [PATCH 1/2] MIPS: BMIPS: dts: remove unsupported entry for bcm7362
Content-Type: text/plain; charset=UTF-8
Return-Path: <cernekee@gmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Jaedon Shin <jaedon.shin@gmail.com>, Ralf Baechle <ralf@linux-mips.org>, Florian Fainelli <f.fainelli@gmail.com>, Linux MIPS Mailing List <linux-mips@linux-mips.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>

On Fri, May 8, 2015 at 8:32 AM, Arnd Bergmann <arnd@arndb.de> wrote:
> On Friday 08 May 2015 07:40:44 Kevin Cernekee wrote:
>> On Fri, May 8, 2015 at 5:59 AM, Jaedon Shin <jaedon.shin@gmail.com> wrote:
>> > Remove unsupported memory entry for the bcm7362 platform. The BMIPS4380
>> > processor only supports ZONE_NORMAL is not available for HIGHMEM.
>> >
>> > Signed-off-by: Jaedon Shin <jaedon.shin@gmail.com>
>> > ---
>> >  arch/mips/boot/dts/brcm/bcm97362svmb.dts | 2 +-
>> >  1 file changed, 1 insertion(+), 1 deletion(-)
>> >
>> > diff --git a/arch/mips/boot/dts/brcm/bcm97362svmb.dts b/arch/mips/boot/dts/brcm/bcm97362svmb.dts
>> > index b7b88e5dc9e7..ab8b01fa7dcf 100644
>> > --- a/arch/mips/boot/dts/brcm/bcm97362svmb.dts
>> > +++ b/arch/mips/boot/dts/brcm/bcm97362svmb.dts
>> > @@ -8,7 +8,7 @@
>> >
>> >         memory@0 {
>> >                 device_type = "memory";
>> > -               reg = <0x00000000 0x10000000>, <0x20000000 0x30000000>;
>> > +               reg = <0x00000000 0x10000000>;
>>
>> Hmm, this is more of a kernel limitation than a hardware limitation,
>> though.  The board physically has 1GB of memory, right?  It is best if
>> the DT entry reflects the actual hardware configuration.
>>
>> The Broadcom kernels enable the CPU's special "XKS01" feature to put
>> 1GB of memory in ZONE_NORMAL:
>>
>> https://github.com/Broadcom/stblinux-3.3/tree/master/linux
>>
>
> What exactly is the kernel limitation here?

If we can't enable HIGHMEM, e.g. because the MIPS CPU has D$ aliases,
then Linux is supposed to ignore any RAM above the highmem/lowmem
boundary.

There is code in paging_init() that tries to do this.  Several years
ago it used to work, but the last time I tried it (~Oct 2014) it was
broken due to some other changes in MIPS early memory init, so Linux
hangs on boot unless you take the excess RAM out of DT.  Jaedon may be
running into the same issue.
