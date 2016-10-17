Received: from mail-out.m-online.net ([212.18.0.10]:51602 "EHLO
        mail-out.m-online.net" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23992226AbcJQRkH0T42Z (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 17 Oct 2016 19:40:07 +0200
From: Andreas Schwab <schwab@linux-m68k.org>
Subject: Re: [PATCH v2] console: Don't prefer first registered if DT specifies stdout-path
References: <20160809125010.14150-1-paul.burton@imgtec.com>
        <20160809151937.26118-1-paul.burton@imgtec.com>
        <87bmyk88x5.fsf@linux-m68k.org> <4033254.tBrl4yKcsP@np-p-burton>
Date: Mon, 17 Oct 2016 19:39:57 +0200
In-Reply-To: <4033254.tBrl4yKcsP@np-p-burton> (Paul Burton's message of "Mon,
        17 Oct 2016 11:33:55 +0100")
Message-ID: <87oa2ij2mq.fsf@linux-m68k.org>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <whitebox@nefkom.net>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Paul Burton <paul.burton@imgtec.com>
Cc: linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>, Tejun Heo <tj@kernel.org>, Sergey Senozhatsky <sergey.senozhatsky@gmail.com>, Jiri Slaby <jslaby@suse.cz>, Daniel Vetter <daniel.vetter@ffwll.ch>, Ivan Delalande <colona@arista.com>, Thierry Reding <treding@nvidia.com>, Borislav Petkov <bp@suse.de>, Jan Kara <jack@suse.com>, Petr Mladek <pmladek@suse.com>, linux-kernel@vger.kernel.org, Joe Perches <joe@perches.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Frank Rowand <frowand.list@gmail.com>, linuxppc-dev@lists.ozlabs.org
Message-ID: <20161017173957.g52DecStziN6BRCOdmV6CRCRh0K-15Ec1_N6YHuqpuA@z>

On Okt 17 2016, Paul Burton <paul.burton@imgtec.com> wrote:

> Could you share the device tree from your system?

This is the contents of chosen/linux,stdout-path on the systems I have:

chosen/linux,stdout-path
                 "/pci@f0000000/ATY,SnowyParent@10/ATY,Snowy_A@0"

chosen/linux,stdout-path                                                        
                 "/pci@0,f0000000/NVDA,Parent@10/NVDA,Display-B@1"

Is that what you need?  There is also chosen/stdout, but no
aliases/stdout.

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 4ED5
"And now for something completely different."
