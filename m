Received: from mail-co1nam03on0089.outbound.protection.outlook.com ([104.47.40.89]:19648
        "EHLO NAM03-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S23991172AbcJDBTMzDmmD (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Tue, 4 Oct 2016 03:19:12 +0200
Subject: Re: [PATCH v9] mmc: OCTEON: Add host driver for OCTEON MMC
 controller.
References: <836c0ca9-18f0-f6b5-bb79-8d0301d54154@cavium.com>
From: "Steven J. Hill" <Steven.Hill@cavium.com>
Message-ID: <c1d0ccad-10e2-9d5d-8192-2bbd7d7357b3@cavium.com>
Date: Mon, 3 Oct 2016 20:18:59 -0500
MIME-Version: 1.0
In-Reply-To: <836c0ca9-18f0-f6b5-bb79-8d0301d54154@cavium.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-Path: <Steven.Hill@cavium.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: linux-mips@linux-mips.org, linux-mmc@vger.kernel.org
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Mark Rutland <mark.rutland@arm.com>, David Daney <david.daney@cavium.com>
Message-ID: <20161004011859.3npZu9BZdqJGhSNXxUBwANdtDE8cZytC7e5hTsKASaI@z>

On 09/19/2016 03:24 PM, Steven J. Hill wrote:
> The OCTEON MMC controller is currently found on cn61XX and cn71XX
> devices. Device parameters are configured from device tree data.
> eMMC, MMC and SD devices are supported. Tested on Cavium CN7130.
> 
> Signed-off-by: Steven J. Hill <steven.hill@cavium.com>
> Acked-by: David Daney <david.daney@cavium.com>
> 
Hello.

Have any MMC maintainers gotten a chance to review our driver now
that v4.8 is out? Thanks.

Steve
