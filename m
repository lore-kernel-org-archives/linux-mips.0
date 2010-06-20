Received: from bamako.nerim.net ([62.4.17.28]:53768 "EHLO bamako.nerim.net"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S1490958Ab0FTGc2 (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Sun, 20 Jun 2010 08:32:28 +0200
Date: Sun, 20 Jun 2010 08:32:21 +0200
From: Jean Delvare <khali@linux-fr.org>
Subject: Re: [lm-sensors] [PATCH v4] hwmon: Add JZ4740 ADC driver
Message-ID: <20100620083221.6738211e@hyperion.delvare>
In-Reply-To: <1276975978-25778-1-git-send-email-lars@metafoo.de>
References: <1276958820-8862-1-git-send-email-lars@metafoo.de>
        <1276975978-25778-1-git-send-email-lars@metafoo.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
Return-Path: <linux-mips-bounce@linux-mips.org>
To: Lars-Peter Clausen <lars@metafoo.de>
Cc: Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org, lm-sensors@lm-sensors.org
Message-ID: <20100620063221.xPfrUG1RGID5k7MT6wLVhmGSknQTyu2Bo98JRv529CU@z>

On Sat, 19 Jun 2010 21:32:58 +0200, Lars-Peter Clausen wrote:
> This patch adds support for reading the ADCIN pin of ADC unit on JZ4740 SoCs.
> 
> Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>
> Cc: lm-sensors@lm-sensors.org
> 
> --
> Changes since v1
> - Move ADC core access synchronizing from the HWMON driver to a MFD driver. The
>   ADC driver now only reads the adcin value.
> 
> Changes since v2
>   - Add name sysfs attribute
>   - Report adcin in value in millivolts
> 
> Changes since v3
>   - Fix Kconfig entry
>   - Add include to completion.h
>   - Break overlong lines
>   - Use DEVICE_ATTR instead of SENSOR_DEVICE_ATTR for the adcin sys file.
> ---
>  drivers/hwmon/Kconfig        |   10 ++
>  drivers/hwmon/Makefile       |    1 +
>  drivers/hwmon/jz4740-hwmon.c |  226 ++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 237 insertions(+), 0 deletions(-)
>  create mode 100644 drivers/hwmon/jz4740-hwmon.c
> (...)

Acked-by: Jean Delvare <khali@linux-fr.org>

-- 
Jean Delvare
