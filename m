Received: from mail-eopbgr780105.outbound.protection.outlook.com ([40.107.78.105]:30829
        "EHLO NAM03-BY2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S23993083AbeKZSWmWp8pw convert rfc822-to-8bit (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 26 Nov 2018 19:22:42 +0100
From: Paul Burton <paul.burton@mips.com>
Subject: Re: [PATCH] MIPS: ralink: Fix mt7620 nd_sd pinmux
Date: Mon, 26 Nov 2018 18:22:39 +0000
Message-ID: <MWHPR2201MB12777328641375E40D6F11BFC1D70@MWHPR2201MB1277.namprd22.prod.outlook.com>
References: <20181126102540.5304-1-dev@kresin.me>
In-Reply-To: <20181126102540.5304-1-dev@kresin.me>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
Return-Path: <pburton@wavecomp.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Mathias Kresin <dev@kresin.me>
Cc: John Crispin <john@phrozen.org>, Ralf Baechle <ralf@linux-mips.org>, Paul Burton <pburton@wavecomp.com>, James Hogan <jhogan@kernel.org>, "linux-mips@linux-mips.org" <linux-mips@linux-mips.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "stable@vger.kernel.org" <stable@vger.kernel.org>"linux-mips@linux-mips.org" <linux-mips@linux-mips.org>
Message-ID: <20181126182239.uf5SqW3KDuRNvyXR-8x7gYbZEnBSKpjtWUc5KY3smx8@z>

Hello,

Mathias Kresin wrote:
> In case the nd_sd group is set to the sd-card function, Pins 45 + 46 are
> configured as GPIOs. If they are blocked by the sd function, they can't
> be used as GPIOs.
> 
> Signed-off-by: Mathias Kresin <dev@kresin.me>
> Reported-by: Kristian Evensen <kristian.evensen@gmail.com>
> Fixes: f576fb6a0700 ("MIPS: ralink: cleanup the soc specific pinmux
> data")
> Cc: stable@vger.kernel.org # v3.18+

Applied to mips-fixes.

Thanks,
    Paul

[ This message was auto-generated; if you believe anything is incorrect
  then please email paul.burton@mips.com to report it. ]
