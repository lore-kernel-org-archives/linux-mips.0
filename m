Received: (from localhost user: 'macro', uid#1010) by eddie.linux-mips.org
        with ESMTP id S27006864AbbBXCYmGbyH3 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 24 Feb 2015 03:24:42 +0100
Date: Tue, 24 Feb 2015 02:24:42 +0000 (GMT)
From: "Maciej W. Rozycki" <macro@linux-mips.org>
Subject: Re: [PATCH V2 1/3] MIPS: Fix cache flushing for swap pages with
 non-DMA I/O.
In-Reply-To: <54EBCC38.7000702@imgtec.com>
Message-ID: <alpine.LFD.2.11.1502240217360.17311@eddie.linux-mips.org>
References: <1424362664-30303-1-git-send-email-Steven.Hill@imgtec.com> <1424362664-30303-2-git-send-email-Steven.Hill@imgtec.com> <CAJiQ=7DMBznB5Ths0sAZORf2hgSQRuBoPF-7HGHhcHn0EajnWg@mail.gmail.com> <54EBCC38.7000702@imgtec.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-Path: <macro@linux-mips.org>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>
Cc: Kevin Cernekee <cernekee@chromium.org>, "Steven J. Hill" <Steven.Hill@imgtec.com>, IMG - MIPS Linux Kernel developers <IMG-MIPSLinuxKerneldevelopers@imgtec.com>, Linux MIPS Mailing List <linux-mips@linux-mips.org>
Message-ID: <20150224022442.64UqlQ50ebayr5dFTHpsHqWZad_D2uHd0FyEZwQVQg8@z>

On Mon, 23 Feb 2015, Leonid Yegoshin wrote:

> The same is basically for transfer D$ --> I$ because in MIPS it is done via L2
> or memory.

 The original issue aside (I don't want to dive into it) this I believe is 
left to an implementer's discretion and there are MIPS implementations 
indeed that fill I$ directly from D$; IIRC Alchemy silicon and its 
descendants.

  Maciej
