Received: from mail-yw0-f177.google.com ([209.85.211.177]:36113 "EHLO
	mail-yw0-f177.google.com" rhost-flags-OK-OK-OK-OK)
	by ftp.linux-mips.org with ESMTP id S1492355AbZIJH4D (ORCPT
	<rfc822;linux-mips@linux-mips.org>); Thu, 10 Sep 2009 09:56:03 +0200
Received: by ywh7 with SMTP id 7so7443847ywh.21
        for <linux-mips@linux-mips.org>; Thu, 10 Sep 2009 00:55:56 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20090910062609.GA26454@pengutronix.de>
References: <1252531371-14866-1-git-send-email-w.sang@pengutronix.de>
	<8bd0f97a0909091654h290180e5ob79178583aca143f@mail.gmail.com>
	<20090910062609.GA26454@pengutronix.de>
From: Mike Frysinger <vapier.adi@gmail.com>
Date: Thu, 10 Sep 2009 03:55:36 -0400
Message-ID: <8bd0f97a0909100055n3192deeka93dc853f0139bfc@mail.gmail.com>
Subject: Re: [Uclinux-dist-devel] Removing deprecated drivers from
	drivers/i2c/chips
Content-Type: text/plain; charset=UTF-8
Return-Path: <vapier.adi@gmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Wolfram Sang <w.sang@pengutronix.de>
Cc: linux-i2c@vger.kernel.org, linuxppc-dev@ozlabs.org, uclinux-dist-devel@blackfin.uclinux.org, linux-arm-kernel@lists.infradead.org, linux-mips@linux-mips.org
Message-ID: <20090910075536.Frke2Cvw_cHc-_iuz-5COZUI2FEhqKfIPjeASzECAWI@z>

On Thu, Sep 10, 2009 at 02:26, Wolfram Sang wrote:
>> the Blackfin defconfigs refer to an input driver for the PCF8574, not
>> the I2C client driver
>
> Yup, I am aware of that. With the exception of:
>
> blackfin/configs/PNAV-10_defconfig:773:CONFIG_SENSORS_PCF8574=m

thanks for double checking.  i'm not sure this board even has this
device.  i'll review the hardware.
-mike
