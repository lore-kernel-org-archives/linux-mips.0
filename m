Received: from mail-fx0-f49.google.com ([209.85.161.49]:55049 "EHLO
        mail-fx0-f49.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S1492641Ab0FCMET (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 3 Jun 2010 14:04:19 +0200
MIME-Version: 1.0
In-Reply-To: <20100603113952.GA23033@linux-mips.org>
References: <95654e45e2f02133c6334fb147d3e28ef94f2bb0.1275439768.git.wuzhangjin@gmail.com>
        <AANLkTikKBasnKuS2Ym6fS8Wr17obMnFWSmA2mJxDIrjU@mail.gmail.com>
        <20100603113952.GA23033@linux-mips.org>
Date: Thu, 3 Jun 2010 15:04:13 +0300
Message-ID: <AANLkTikEgVmUmumoKA8NtdclqqGgtqiD-I55JZEgtpZd@mail.gmail.com>
Subject: Re: [PATCH -queue] MIPS: Move Loongson Makefile parts to their own
        Platform file (cont.)
From: Dmitri Vorobiev <dmitri.vorobiev@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
Return-Path: <linux-mips-bounce@linux-mips.org>
To: Ralf Baechle <ralf@linux-mips.org>
Cc: Wu Zhangjin <wuzhangjin@gmail.com>, linux-mips <linux-mips@linux-mips.org>
Message-ID: <20100603120413.KDzRyx6FyO4niXeX-UhwnuScrOKBGsxJmxJaYNPFgVg@z>

On Thu, Jun 3, 2010 at 2:39 PM, Ralf Baechle <ralf@linux-mips.org> wrote:
> On Thu, Jun 03, 2010 at 02:10:26PM +0300, Dmitri Vorobiev wrote:
>
>> > Hi, Ralf
>> >
>> > I have fogotten to remove the -Werror in the Makefiles under loongson/
>>
>> I'm just curious: why would anyone want to remove -Werror? It's very
>> useful in most cases, IMO.
>
> arch/mips/Kbuild enables -Werror for all platforms.

Looks like I'm failing to keep pace with life :)

Dmitri
