Received: from va3ehsobe001.messaging.microsoft.com ([216.32.180.11]:38652
        "EHLO va3outboundpool.messaging.microsoft.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S1903701Ab2FVRyV (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 22 Jun 2012 19:54:21 +0200
Message-ID: <4FE4B13E.10709@caviumnetworks.com>
Date: Fri, 22 Jun 2012 10:54:06 -0700
From: David Daney <ddaney@caviumnetworks.com>
MIME-Version: 1.0
Subject: Re: [PATCH] MIPS: fix bug.h MIPS build regression
References: <1339962373-3224-1-git-send-email-geert@linux-m68k.org> <CAMuHMdVfLjgrtWoPpvbLf12+=ApE6W9dNcweqD-_2Benr-D7NQ@mail.gmail.com> <20120620152759.2caceb8c.yuasa@linux-mips.org> <20120620161249.GB29196@linux-mips.org>
In-Reply-To: <20120620161249.GB29196@linux-mips.org>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
Return-Path: <linux-mips-bounce@linux-mips.org>
To: Ralf Baechle <ralf@linux-mips.org>
Cc: Yoichi Yuasa <yuasa@linux-mips.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Paul Mundt <lethal@linux-sh.org>, linux-kernel@vger.kernel.org, Linuxppc-dev <linuxppc-dev@ozlabs.org>, Linux MIPS Mailing List <linux-mips@linux-mips.org>, Linux-sh list <linux-sh@vger.kernel.org>, Chris Zankel <chris@zankel.net>
Message-ID: <20120622175406.OcqwUGdge4JvwNKJo5X9LVkEICetqDNYyQrfBqzrQ1o@z>

On 06/20/2012 09:12 AM, Ralf Baechle wrote:
> On Wed, Jun 20, 2012 at 03:27:59PM +0900, Yoichi Yuasa wrote:
>
>> Commit: 3777808873b0c49c5cf27e44c948dfb02675d578 breaks all MIPS builds.
>
> Thanks, fix applied.
>

Where was it applied?

It doesn't show up in linux-next for 20120622, which is where it is needed.

David Daney
