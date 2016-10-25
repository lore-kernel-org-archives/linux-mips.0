Received: from mailapp01.imgtec.com ([195.59.15.196]:19720 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23991977AbcJYKrw2Z0w5 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 25 Oct 2016 12:47:52 +0200
Date: Tue, 25 Oct 2016 11:47:36 +0100
From: "Maciej W. Rozycki" <macro@imgtec.com>
Subject: Re: [PATCH 1/2] mfd: syscon: Support native-endian regmaps
In-Reply-To: <20161014091732.27536-1-paul.burton@imgtec.com>
Message-ID: <alpine.DEB.2.00.1610251147060.31859@tp.orcam.me.uk>
References: <e50cd48c-e0c4-9bfc-b265-383a33eac569@roeck-us.net> <20161014091732.27536-1-paul.burton@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Return-Path: <Maciej.Rozycki@imgtec.com>
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
Cc: linux-mips@linux-mips.org, Lee Jones <lee.jones@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Guenter Roeck <linux@roeck-us.net>, Ralf Baechle <ralf@linux-mips.org>
Message-ID: <20161025104736.K0Rv3dM4TJ8Davfvf8sCtH9zssCpmO9uKiH_RxGJBLA@z>

On Fri, 14 Oct 2016, Paul Burton wrote:

> The regmap devicetree binding documentation states that a native-endian
> property should be supported as well as big-endian & little-endian,
> however syscon in its duplication of the parsing of these properties
> omits support for native-endian. Fix this by setting
> REGMAP_ENDIAN_NATIVE when a native-endian property is found.
> 
> Signed-off-by: Paul Burton <paul.burton@imgtec.com>
> Cc: Lee Jones <lee.jones@linaro.org>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: Ralf Baechle <ralf@linux-mips.org>
> Cc: linux-mips@linux-mips.org
> ---

Tested-by: Maciej W. Rozycki <macro@imgtec.com>

  Maciej
