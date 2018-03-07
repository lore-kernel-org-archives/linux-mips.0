Received: from mail-io0-x242.google.com ([IPv6:2607:f8b0:4001:c06::242]:44088
        "EHLO mail-io0-x242.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23994721AbeCGPWeMpmGt (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 7 Mar 2018 16:22:34 +0100
MIME-Version: 1.0
In-Reply-To: <20180307151025.GP4197@saruman>
References: <20170927151527.25570-1-prasannatsmkumar@gmail.com>
 <20170927151527.25570-4-prasannatsmkumar@gmail.com> <20180306000832.GL4197@saruman>
 <CANc+2y5_R5xYQuLbW7NAjO4mcW5RNn3Da77tAhYU5zj=0rkBDQ@mail.gmail.com>
 <20180307143541.GN4197@saruman> <CANc+2y5wsvGWszu3pePYhs2wb1_AgPdjG+ugfOCzbZVfVHDMvw@mail.gmail.com>
 <20180307151025.GP4197@saruman>
From: PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>
Date: Wed, 7 Mar 2018 20:52:27 +0530
Message-ID: <CANc+2y6yNkgrJnM64D-JyL3jyWwk_Tes4MZfMw0NRmsf5v7=4w@mail.gmail.com>
Subject: Re: [RFC 3/4] MIPS: Ingenic: Initial X1000 SoC support
Content-Type: text/plain; charset="UTF-8"
Return-Path: <prasannatsmkumar@gmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: James Hogan <jhogan@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ralf Baechle <ralf@linux-mips.org>, Michael Turquette <mturquette@baylibre.com>, sboyd@codeaurora.org, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux-MIPS <linux-mips@linux-mips.org>, linux-clk@vger.kernel.org, open list <linux-kernel@vger.kernel.org>, Paul Cercueil <paul@crapouillou.net>, Mathieu Malaterre <malat@debian.org>, Dominik Peklo <dom.peklo@gmail.com>
Message-ID: <20180307152227.gwbh-ZxZ3euSpF8hbZeL7OFSSERpD2AiEXq9gYPHNF0@z>

On 7 March 2018 at 20:40, James Hogan <jhogan@kernel.org> wrote:
> On Wed, Mar 07, 2018 at 08:35:00PM +0530, PrasannaKumar Muralidharan wrote:
>> On 7 March 2018 at 20:05, James Hogan <jhogan@kernel.org> wrote:
>> > On Wed, Mar 07, 2018 at 07:14:49PM +0530, PrasannaKumar Muralidharan wrote:
>> >> > Does X1000 use a different PRID, or is it basically just a JZ4780 core
>> >> > with different SoC peripherals?
>> >>
>> >> Yes X1000 does have a different PRID (PRID = 0x2ed1024f). X1000 has
>> >
>> > Right, so thats 0x2e000000 | PRID_COMP_INGENIC_D1 | PRID_IMP_JZRISC |
>> > 0x4f, which cpu-probe.c already handles (apparently the D1 company code
>> > is used for JZ4770 & JZ4775 too).
>>
>> Okay. Does this mean I need not modify get_board_mach_type() and
>> get_system_type()?
>
> You still need to modify them, otherwise it won't understand
> "ingenic,x1000" compatible string, and will call it a JZ4740 in
> /proc/cpuinfo.

Oh okay. Will make the changes.

>> >> I used to get my code tested from Domink but I could not reach him for
>> >> quite some time. Before buying the development board myself I would
>> >> like to see if anyone can help me in testing. Do you have any contact
>> >> with Ingenic who can help in testing this?
>> >
>> > Not personally, but I'll ask around. Of course if nobody much cares
>> > about it in practice and nobody has the hardware, there may be little
>> > value in supporting it upstream.
>>
>> Seems Jiaxun is interested in the board and is willing to help.
>
> Okay, cool.
>
> Cheers
> James
