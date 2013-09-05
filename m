Received: from mail-bl2lp0211.outbound.protection.outlook.com ([207.46.163.211]:56824
        "EHLO na01-bl2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S6837145Ab3IETAt6nCcK (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Thu, 5 Sep 2013 21:00:49 +0200
Message-ID: <5228D4D7.4010206@caviumnetworks.com>
Date: Thu, 5 Sep 2013 12:00:39 -0700
From: David Daney <ddaney@caviumnetworks.com>
MIME-Version: 1.0
Subject: Re: [PATCH 3/3] staging: octeon-ethernet: rgmii: enable interrupts
 that we can handle
References: <1378406641-16530-1-git-send-email-aaro.koskinen@iki.fi> <1378406641-16530-4-git-send-email-aaro.koskinen@iki.fi>
In-Reply-To: <1378406641-16530-4-git-send-email-aaro.koskinen@iki.fi>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-Path: <David.Daney@caviumnetworks.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Aaro Koskinen <aaro.koskinen@iki.fi>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devel@driverdev.osuosl.org, linux-mips@linux-mips.org, David Daney <david.daney@cavium.com>, "Jason A. Donenfeld" <Jason@zx2c4.com>, richard@nod.at
Message-ID: <20130905190039.SSX0aLFqH_WvuEXz3rofeKKLWIqxW4PglsLHnCJkfyk@z>

On 09/05/2013 11:44 AM, Aaro Koskinen wrote:
> Enable only those interrupts that we can handle & acknowledge in the
> interrupt handler.
>
> At least on EdgeRouter Lite, the hardware may occasionally interrupt with
> some error condition when the physical link status changes frequently.
> Since the interrupt condition is not acked properly, this leads to the
> following warning and the IRQ gets disabled completely:
>
> [   41.324700] eth0: Link down
> [   44.324721] eth0: 1000 Mbps Full duplex, port  0, queue  0
> [   44.885590] irq 117: nobody cared (try booting with the "irqpoll" option)
> [   44.892397] CPU: 0 PID: 0 Comm: swapper/0 Not tainted 3.11.0-rc5-edge-los.git-27d042f-dirty-00950-gaa42f2d-dirty #8
> [   44.902825] Stack : ffffffff815c0000 0000000000000004 0000000000000003 0000000000000000
> 	  ffffffff81fd0000 ffffffff815c0000 0000000000000004 ffffffff8118530c
> 	  ffffffff815c0000 ffffffff811858d8 0000000000000000 0000000000000000
> 	  ffffffff81fd0000 ffffffff81fc0000 ffffffff8152f3a0 ffffffff815b7bf7
> 	  ffffffff81fc6688 ffffffff815b8060 0000000000000000 0000000000000000
> 	  0000000000000000 ffffffff815346c8 ffffffff815346b0 ffffffff814a6a18
> 	  ffffffff8158b848 ffffffff81145614 ffffffff81593800 ffffffff81187174
> 	  ffffffff815b7d00 ffffffff8158b760 0000000000000000 ffffffff814a9184
> 	  0000000000000000 0000000000000000 0000000000000000 0000000000000000
> 	  0000000000000000 ffffffff811203b8 0000000000000000 0000000000000000
> 	  ...
> [   44.968408] Call Trace:
> [   44.970873] [<ffffffff811203b8>] show_stack+0x68/0x80
> [   44.975937] [<ffffffff814a9184>] dump_stack+0x78/0xb8
> [   44.980999] [<ffffffff811aac54>] __report_bad_irq+0x44/0x108
> [   44.986662] [<ffffffff811ab238>] note_interrupt+0x248/0x2a0
> [   44.992240] [<ffffffff811a85e4>] handle_irq_event_percpu+0x144/0x200
> [   44.998598] [<ffffffff811a86f4>] handle_irq_event+0x54/0x90
> [   45.004176] [<ffffffff811ab908>] handle_level_irq+0xd0/0x148
> [   45.009839] [<ffffffff811a7b04>] generic_handle_irq+0x34/0x50
> [   45.015589] [<ffffffff8111dae8>] do_IRQ+0x18/0x30
> [   45.020301] [<ffffffff8110486c>] plat_irq_dispatch+0x74/0xb8
> [   45.025958]
> [   45.027451] handlers:
> [   45.029731] [<ffffffff813fca10>] cvm_oct_rgmii_rml_interrupt
> [   45.035397] Disabling IRQ #117
> [   45.038742] Port 0 receive error code 13, packet dropped
> [   46.324719] eth0: Link down
> [   48.324733] eth0: 1000 Mbps Full duplex, port  0, queue  0
>
> Reported-by: "Jason A. Donenfeld" <Jason@zx2c4.com>
> Signed-off-by: Aaro Koskinen <aaro.koskinen@iki.fi>

Acked-by: David Daney <david.daney@cavium.com>

> ---
>   drivers/staging/octeon/ethernet-rgmii.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/drivers/staging/octeon/ethernet-rgmii.c b/drivers/staging/octeon/ethernet-rgmii.c
> index d8f5f69..ea53af3 100644
> --- a/drivers/staging/octeon/ethernet-rgmii.c
> +++ b/drivers/staging/octeon/ethernet-rgmii.c
> @@ -373,9 +373,7 @@ int cvm_oct_rgmii_init(struct net_device *dev)
>   			 * Enable interrupts on inband status changes
>   			 * for this port.
>   			 */
> -			gmx_rx_int_en.u64 =
> -			    cvmx_read_csr(CVMX_GMXX_RXX_INT_EN
> -					  (index, interface));
> +			gmx_rx_int_en.u64 = 0;
>   			gmx_rx_int_en.s.phy_dupx = 1;
>   			gmx_rx_int_en.s.phy_link = 1;
>   			gmx_rx_int_en.s.phy_spd = 1;
>
