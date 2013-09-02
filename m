Received: from Smtp1.Lantiq.com ([195.219.66.200]:57217 "EHLO smtp1.lantiq.com"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S6817237Ab3IBJvbwe5yl convert rfc822-to-8bit (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 2 Sep 2013 11:51:31 +0200
From: <thomas.langer@lantiq.com>
Subject: RE: [PATCH] MIPS: lantiq: add defconfig for xway SoC
Date: Mon, 2 Sep 2013 09:51:24 +0000
Message-ID: <593AEF6C47F46446852B067021A273D6D983C8C9@MUCSE039.lantiq.com>
References: <1378054268-4722-1-git-send-email-blogic@openwrt.org>
In-Reply-To: <1378054268-4722-1-git-send-email-blogic@openwrt.org>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
Return-Path: <thomas.langer@lantiq.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: blogic@openwrt.org, ralf@linux-mips.org
Cc: linux-mips@linux-mips.org
Message-ID: <20130902095124.0j--kHFsi5GpWkqiZC2bRSvDP_8iJEWHqcmD9ei_00w@z>

Hello John,

> +CONFIG_SERIAL_8250=y
> +CONFIG_SERIAL_8250_CONSOLE=y
> +CONFIG_SERIAL_8250_RUNTIME_UARTS=2

I think this is wrong. Instead I would expect CONFIG_SERIAL_LANTIQ=y somewhere.


Best Regards,
Thomas
