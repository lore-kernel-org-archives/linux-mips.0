Received: from mail-ie0-f171.google.com ([209.85.223.171]:33723 "EHLO
        mail-ie0-f171.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S27006583AbaHYAgWu5MHe (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 25 Aug 2014 02:36:22 +0200
Received: by mail-ie0-f171.google.com with SMTP id at1so9000538iec.30
        for <linux-mips@linux-mips.org>; Sun, 24 Aug 2014 17:36:16 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1408915485-8078-4-git-send-email-hauke@hauke-m.de>
References: <1408915485-8078-1-git-send-email-hauke@hauke-m.de>
        <1408915485-8078-4-git-send-email-hauke@hauke-m.de>
Date: Sun, 24 Aug 2014 21:45:38 +0000
Message-ID: <CACna6rx_V46wAAkRFA+XnZNX80tAdWkaYrTUV5VHxLwbC6GvfQ@mail.gmail.com>
Subject: Re: [RFC 2/7] bcm47xx-nvram: add new broadcom nvram driver with dt support
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Content-Type: text/plain; charset=UTF-8
Return-Path: <zajec5@gmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Hauke Mehrtens <hauke@hauke-m.de>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, devicetree@vger.kernel.org, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-mips@linux-mips.org" <linux-mips@linux-mips.org>
Message-ID: <20140824214538.iGXxvcrEL9kPEehOA5aAK2arGEuFAI2FUKa9CcSxoqE@z>

On 24 August 2014 21:24, Hauke Mehrtens <hauke@hauke-m.de> wrote:
> This was copied from arch/mips/bcm47xx/nvram.c and modified to interact
> with device tree. My plan is to make the MIPS bcm47xx also use this new
> driver some time later.

I don't like this.

First, you change API (_getenv call), without explanation why/if we
really need this. We decided we're very unlikely to ever find devices
with multiple (separated) NVRAMs. So what's the point of having nvram
per device?

Secondly, don't duplicate the code. If you're going to switch bcm47xx
to this new code, handle it smarter. Modify bcm47xx mode, move it to
the "misc" and re-use in bcm53xx.
