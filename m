Received: from mail-dm3nam03on0083.outbound.protection.outlook.com ([104.47.41.83]:10450
        "EHLO NAM03-DM3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S23990432AbdJKKhTF2fAv convert rfc822-to-8bit (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 11 Oct 2017 12:37:19 +0200
From: "Wu, Aaron" <Aaron.Wu@analog.com>
Subject: RE: [Adi-buildroot-devel] [PATCH 4/7] i2c: gpio: Augment all
 boardfiles to use open drain
Date: Wed, 11 Oct 2017 10:37:03 +0000
Message-ID: <649EF91064D35D40B9C93A225BF41674ADD7CEFD@NWD2MBX6.ad.analog.com>
References: <20170917093906.16325-1-linus.walleij@linaro.org>
 <20170917093906.16325-5-linus.walleij@linaro.org>
 <20171009142824.GB17971@linux-mips.org>
In-Reply-To: <20171009142824.GB17971@linux-mips.org>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
Return-Path: <Aaron.Wu@analog.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Ralf Baechle <ralf@linux-mips.org>, Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-mips@linux-mips.org" <linux-mips@linux-mips.org>, Steven Miao <realmz6@gmail.com>, "adi-buildroot-devel@lists.sourceforge.net" <adi-buildroot-devel@lists.sourceforge.net>, Geert Uytterhoeven <geert@linux-m68k.org>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Message-ID: <20171011103703.zQP4BqwGcHgaxs71WQZRxjjkK3VuGsmmW3xXdN8b4JY@z>

Hi all,

Steven is no longer working on this for ADI. Acked by me if this works. Thanks.

Best regards,
Aaron Wu
Analog Devices Inc.

-----Original Message-----
From: Ralf Baechle [mailto:ralf@linux-mips.org] 
Sent: Monday, October 09, 2017 10:28 PM
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-mips@linux-mips.org; Steven Miao <realmz6@gmail.com>; adi-buildroot-devel@lists.sourceforge.net; Geert Uytterhoeven <geert@linux-m68k.org>; linux-i2c@vger.kernel.org; linux-arm-kernel@lists.infradead.org
Subject: Re: [Adi-buildroot-devel] [PATCH 4/7] i2c: gpio: Augment all boardfiles to use open drain

On Sun, Sep 17, 2017 at 11:39:03AM +0200, Linus Walleij wrote:

> Steven (Blackfin): requesting ACK for Wolfram to take this patch.
> Ralf (MIPS): requesting ACK for Wolfram to take this patch.

Acked-by: Ralf Baechle <ralf@linux-mips.org>

  Ralf

------------------------------------------------------------------------------
Check out the vibrant tech community on one of the world's most engaging tech sites, Slashdot.org! http://sdm.link/slashdot _______________________________________________
Adi-buildroot-devel mailing list
Adi-buildroot-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/adi-buildroot-devel
