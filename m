Received: from mail-oi0-f66.google.com ([209.85.218.66]:36060 "EHLO
        mail-oi0-f66.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23994585AbeGCTcbv6QQt (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 3 Jul 2018 21:32:31 +0200
MIME-Version: 1.0
References: <20180703123214.23090-1-paul@crapouillou.net>
In-Reply-To: <20180703123214.23090-1-paul@crapouillou.net>
From: Mathieu Malaterre <malat@debian.org>
Date: Tue, 3 Jul 2018 21:32:13 +0200
Message-ID: <CA+7wUsykjQkSHshNNVJaZJ4d_U9Q4fhaoRaNOTHhjoj43xRPLg@mail.gmail.com>
Subject: Re: [PATCH 00/14] dma-jz4780 improvements
Content-Type: text/plain; charset="UTF-8"
Return-Path: <mathieu.malaterre@gmail.com>
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
Cc: vkoul@kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>, James Hogan <jhogan@kernel.org>, Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>, dansilsby@gmail.com, dmaengine@vger.kernel.org, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Linux-MIPS <linux-mips@linux-mips.org>
Message-ID: <20180703193213.vhp26fjWAmc2SrYkAIip8s58OmFQqemB_LADYmQQU7g@z>

On Tue, Jul 3, 2018 at 2:32 PM Paul Cercueil <paul@crapouillou.net> wrote:
>
> Hi,
>
> This set of patches by myself and Daniel extends the dma-jz4780 driver
> to support other SoCs (JZ4770, JZ4740, JZ4725B).
>
> Some fixes are also included, for proper residue reporting, which fixes
> errors with ALSA.
>
> Finally, the last two patches update the devicetree bindings for the
> JZ4780 SoC and add a binding for the JZ4770 SoC.
>
> This patchset was tested on JZ4780, JZ4770 and JZ4725B, but was not tested
> on the JZ4740, so it would be fantastic if somebody could test it there.

For the entire series, everything works as expected on JZ4780 (Creator
CI20), including reading from sdcard.

Tested-by: Mathieu Malaterre <malat@debian.org>

> Regards,
> -Paul
>
