Received: from mout.kundenserver.de ([212.227.126.131]:61240 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27007342AbaK0OeLFhC3v (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 27 Nov 2014 15:34:11 +0100
From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH V2 01/10] tty: Fallback to use dynamic major number
Date: Thu, 27 Nov 2014 15:33:58 +0100
Message-ID: <4316435.J1BtEYnd6C@wuerfel>
In-Reply-To: <CACxGe6uLWZav=AfaK2w17PW6vtxF8S0=OUvCMB-uFSvhs2cLtw@mail.gmail.com>
References: <1415825647-6024-1-git-send-email-cernekee@gmail.com> <5475E4EC.7090309@hurleysoftware.com> <CACxGe6uLWZav=AfaK2w17PW6vtxF8S0=OUvCMB-uFSvhs2cLtw@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Return-Path: <arnd@arndb.de>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Grant Likely <grant.likely@linaro.org>
Cc: Peter Hurley <peter@hurleysoftware.com>, Kevin Cernekee <cernekee@gmail.com>, Greg KH <gregkh@linuxfoundation.org>, Jiri Slaby <jslaby@suse.cz>, Rob Herring <robh@kernel.org>, Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, Florian Fainelli <f.fainelli@gmail.com>, Maxime Bizon <mbizon@freebox.fr>, Jonas Gorski <jogo@openwrt.org>, Linux MIPS Mailing List <linux-mips@linux-mips.org>, "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, tushar.b@samsung.com
Message-ID: <20141127143358.HrL9BJoHGloIFWm3VZHuZX4P4UTR4idyTFpezo8sdsg@z>

On Thursday 27 November 2014 13:50:01 Grant Likely wrote:
> 
> Should be sufficient. Basically, if the hardware doesn't exist, the
> driver shouldn't be trying to grab the minor numbers.
> 
> Also, on hardware where both exists, there should be some sane
> fallback so that all UARTs get assigned numbers. On DT systems we can
> also use /aliases to ensure consistent assignment of numbers.
