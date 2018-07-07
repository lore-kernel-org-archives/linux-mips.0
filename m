Received: from mail-pf0-x243.google.com ([IPv6:2607:f8b0:400e:c00::243]:33878
        "EHLO mail-pf0-x243.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23992571AbeGGH2DUWFgM (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Sat, 7 Jul 2018 09:28:03 +0200
MIME-Version: 1.0
In-Reply-To: <1530827112.6642.2@smtp.crapouillou.net>
References: <20180703123214.23090-1-paul@crapouillou.net> <20180703123214.23090-3-paul@crapouillou.net>
 <CANc+2y4dVDQoPP4zJkous=p-HYL+nu1Cxcrv0nqEMABN_4uyZw@mail.gmail.com> <1530827112.6642.2@smtp.crapouillou.net>
From: PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>
Date: Sat, 7 Jul 2018 12:57:56 +0530
Message-ID: <CANc+2y70=hp7_p3ojyWMddm42VKFHDqUbKGMz97+xakADp9PNQ@mail.gmail.com>
Subject: Re: [PATCH 02/14] dmaengine: dma-jz4780: Separate chan/ctrl registers
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
To: Paul Cercueil <paul@crapouillou.net>
Cc: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>, James Hogan <jhogan@kernel.org>, Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>, Mathieu Malaterre <malat@debian.org>, Daniel Silsby <dansilsby@gmail.com>, dmaengine@vger.kernel.org, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, Linux-MIPS <linux-mips@linux-mips.org>
Message-ID: <20180707072756.Jly7koBspyTHGwQxs9XoTb2BVbmTsepSuVeR6eMPla0@z>

On 6 July 2018 at 03:15, Paul Cercueil <paul@crapouillou.net> wrote:
>
>
>> Paul,
>>
>> On 3 July 2018 at 18:02, Paul Cercueil <paul@crapouillou.net> wrote:
>>>
>>>  The register area of the JZ4780 DMA core can be split into different
>>>  sections for different purposes:
>>>
>>>  * one set of registers is used to perform actions at the DMA core level,
>>>  that will generally affect all channels;
>>>
>>>  * one set of registers per DMA channel, to perform actions at the DMA
>>>  channel level, that will only affect the channel in question.
>>>
>>>  The problem rises when trying to support new versions of the JZ47xx
>>>  Ingenic SoC. For instance, the JZ4770 has two DMA cores, each one
>>>  with six DMA channels, and the register sets are interleaved:
>>>  <DMA0 chan regs> <DMA1 chan regs> <DMA0 ctrl regs> <DMA1 ctrl regs>
>>>
>>>  By using one memory resource for the channel-specific registers and
>>>  one memory resource for the core-specific registers, we can support
>>>  the JZ4770, by initializing the driver once per DMA core with different
>>>  addresses.
>>
>>
>> As per my understanding device tree should be modified only when
>> hardware changes. This looks the other way around. It must be possible
>> to achieve what you are trying to do in this patch without changing
>> the device tree.
>
>
> I would agree that devicetree has an ABI that we shouldn't break if
> possible.
>
> However DTS support for all the Ingenic SoCs/boards is far from being
> complete, and more importantly, all Ingenic-based boards compile the DTS
> file within the kernel; so breaking the ABI is not (yet) a problem, and
> we should push the big changes right now while it's still possible.

Completely agree with you in this. Let's wait and see what DT maintainer's view.
