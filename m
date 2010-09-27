Received: from mxout1.idt.com ([157.165.5.25]:42601 "EHLO mxout1.idt.com"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S1491919Ab0I0OAn convert rfc822-to-8bit (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 27 Sep 2010 16:00:43 +0200
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
        charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Subject: RE: Does Linux MIPS use scratch pad ram?
Date: Mon, 27 Sep 2010 07:00:30 -0700
Message-ID: <AEA634773855ED4CAD999FBB1A66D07601159E63@CORPEXCH1.na.ads.idt.com>
In-Reply-To: <4C9D3153.8020901@paralogos.com>
References: <AEA634773855ED4CAD999FBB1A66D07601159CB4@CORPEXCH1.na.ads.idt.com> <4C9D3153.8020901@paralogos.com>
From: "Ardelean, Andrei" <Andrei.Ardelean@idt.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
Return-Path: <linux-mips-bounce@linux-mips.org>
To: "Kevin D. Kissell" <kevink@paralogos.com>
Cc: linux-mips@linux-mips.org
Message-ID: <20100927140030.62j77iaSVppD2LhzYIvFxNYSsbfMg5KjdRujRdLXIB8@z>

Hi Kevin,

I don't have the new h/w yet so I don't know how the Flash will react.
In the mem map of the new board I see Flash at 0x1c000000 where MALTA
Linux probes for spram and my job so far is to port Linux for the new
board. So, I understand from your email that spram probing will not mess
up with my Flash and I should ignore it.

Thanks,
Andrei


-----Original Message-----
From: Kevin D. Kissell [mailto:kevink@paralogos.com] 
Sent: Friday, September 24, 2010 7:17 PM
To: Ardelean, Andrei
Cc: linux-mips@linux-mips.org
Subject: Re: Does Linux MIPS use scratch pad ram?

I find it hard to believe that you've got Flash responding in place of 
the CP0 cache tag registers.

On 09/24/10 14:45, Ardelean, Andrei wrote:
> Hi,
>
> I am using MALTA platform and try to port Linux on a new platform.
> It seems to me that in spram.c the sprams are probed  if they are
> available or not but I cannot see Linux really using those afterwards.
> My platform has no spram so I am trying to avoid this probing. The
> problem is that spram.c is not MALTA specific but as the comment says
in
> spram.c there are some MALTA specific addresses. Unfortunately I have
> some Flash at those addresses.
> How to fix this issue?
>
> Thanks,
> Andrei
>
>
>    
