Received: from mail-by2nam03on0087.outbound.protection.outlook.com ([104.47.42.87]:34334
        "EHLO NAM03-BY2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S23993890AbdAQR6ZVvVl0 (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Tue, 17 Jan 2017 18:58:25 +0100
Subject: Re: [PATCH] octeon: prom_putchar() must be void
References: <20170117173644.27984-1-alexander.sverdlin@nokia.com>
From: David Daney <ddaney@caviumnetworks.com>
Message-ID: <3cdd9280-1ef1-78a4-ea75-290b9c91cf93@caviumnetworks.com>
Date: Tue, 17 Jan 2017 09:58:13 -0800
MIME-Version: 1.0
In-Reply-To: <20170117173644.27984-1-alexander.sverdlin@nokia.com>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-Path: <David.Daney@cavium.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Alexander Sverdlin <alexander.sverdlin@nokia.com>
Cc: Ralf Baechle <ralf@linux-mips.org>, David Daney <david.daney@cavium.com>, Aaro Koskinen <aaro.koskinen@nokia.com>, "Steven J. Hill" <steven.hill@cavium.com>, linux-mips@linux-mips.org
Message-ID: <20170117175813.AkWLI7DI2xaC8XwJSk4tTa8V5Cooy2Kb7KGjSJrZZ4I@z>

On 01/17/2017 09:36 AM, Alexander Sverdlin wrote:
> From: Alexander Sverdlin <alexander.sverdlin@nsn.com>
>
> Correct the function return type.
>
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@nokia.com>

This will make it conflict with the declaration in
drivers/watchdog/octeon-wdt-main.c

*Iff* you also fix the watchdog site, you can add Acked-by: David Daney 
<david.daney@cavium.com>


> Cc: Ralf Baechle <ralf@linux-mips.org>
> Cc: David Daney <david.daney@cavium.com>
> Cc: Aaro Koskinen <aaro.koskinen@nokia.com>
> Cc: "Steven J. Hill" <steven.hill@cavium.com>
> Cc: linux-mips@linux-mips.org
> ---
>  arch/mips/cavium-octeon/setup.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/arch/mips/cavium-octeon/setup.c b/arch/mips/cavium-octeon/setup.c
> index 9a2db1c013d9..bb613d3e5246 100644
> --- a/arch/mips/cavium-octeon/setup.c
> +++ b/arch/mips/cavium-octeon/setup.c
> @@ -1095,7 +1095,7 @@ void __init plat_mem_setup(void)
>   * Emit one character to the boot UART.	 Exported for use by the
>   * watchdog timer.
>   */
> -int prom_putchar(char c)
> +void prom_putchar(char c)
>  {
>  	uint64_t lsrval;
>
> @@ -1106,7 +1106,6 @@ int prom_putchar(char c)
>
>  	/* Write the byte */
>  	cvmx_write_csr(CVMX_MIO_UARTX_THR(octeon_uart), c & 0xffull);
> -	return 1;
>  }
>  EXPORT_SYMBOL(prom_putchar);
>
>
