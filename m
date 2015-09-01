Received: from mailapp01.imgtec.com ([195.59.15.196]:3864 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27007213AbbIAOLnf1fbe (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 1 Sep 2015 16:11:43 +0200
Subject: Re: [PATCH v2] MIPS: Fix console output for Fulong2e system
References: <1440994798-14032-1-git-send-email-linux@roeck-us.net>
From: Markos Chandras <Markos.Chandras@imgtec.com>
Message-ID: <55E5B218.2050506@imgtec.com>
Date: Tue, 1 Sep 2015 15:11:36 +0100
MIME-Version: 1.0
In-Reply-To: <1440994798-14032-1-git-send-email-linux@roeck-us.net>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-Path: <Markos.Chandras@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Guenter Roeck <linux@roeck-us.net>, Ralf Baechle <ralf@linux-mips.org>
Cc: Huacai Chen <chenhc@lemote.com>, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org
Message-ID: <20150901141136.2Wnczgn0jnIEgKZ26hyBfzasXAclFZi35uot7aANuuY@z>

On 08/31/2015 05:19 AM, Guenter Roeck wrote:
> Commit 3adeb2566b9b ("MIPS: Loongson: Improve LEFI firmware interface")
> made the number of UARTs dynamic if LEFI_FIRMWARE_INTERFACE is configured.
> Unfortunately, it did not initialize the number of UARTs if
> LEFI_FIRMWARE_INTERFACE is not configured. As a result, the Fulong2e
> system has no console.
> 
> Fixes: 3adeb2566b9b ("MIPS: Loongson: Improve LEFI firmware interface")
> Acked-by: Huacai Chen <chenhc@lemote.com>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---

Tested-by: Markos Chandras <markos.chandras@imgtec.com>

-- 
markos
