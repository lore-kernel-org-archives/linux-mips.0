Received: from mail.windriver.com ([147.11.1.11]:51644 "EHLO
        mail.windriver.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27007895AbbJFWXPId5t8 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 7 Oct 2015 00:23:15 +0200
Date: Tue, 6 Oct 2015 18:23:00 -0400
From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: Re: [PATCH 2/2] ttyFDC: Fix build problems due to use of
 module_{init,exit}
Message-ID: <20151006222300.GI14103@windriver.com>
References: <1444140726-5740-1-git-send-email-james.hogan@imgtec.com>
 <1444140726-5740-3-git-send-email-james.hogan@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1444140726-5740-3-git-send-email-james.hogan@imgtec.com>
Return-Path: <Paul.Gortmaker@windriver.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: James Hogan <james.hogan@imgtec.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jslaby@suse.com>, Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org, stable@vger.kernel.org
Message-ID: <20151006222300.jaUcjSNiZ9x1vag8SkP4MxgJK9HpkHq_yR6EXIgeP3Q@z>

[[PATCH 2/2] ttyFDC: Fix build problems due to use of module_{init,exit}] On 06/10/2015 (Tue 15:12) James Hogan wrote:

> Commit 0fd972a7d91d (module: relocate module_init from init.h to
> module.h) broke the build of ttyFDC driver due to that driver's (mis)use
> of module_mips_cdmm_driver() without first including module.h, for
> example:

The driver must not be hooked into any mips defconfigs or my build
coverage should have caught it (or it was merged after my change went on
in)  -- in any case this is only the 2nd that slipped through out of
the big shuffle that came from that, so I think that is not bad.

> 
> In file included from ./arch/mips/include/asm/cdmm.h +11 :0,
>                  from drivers/tty/mips_ejtag_fdc.c +34 :
> include/linux/device.h +1295 :1: warning: data definition has no type or storage class
> ./arch/mips/include/asm/cdmm.h +84 :2: note: in expansion of macro ‘module_driver’
> drivers/tty/mips_ejtag_fdc.c +1157 :1: note: in expansion of macro ‘module_mips_cdmm_driver’
> include/linux/device.h +1295 :1: error: type defaults to ‘int’ in declaration of ‘module_init’ [-Werror=implicit-int]
> ./arch/mips/include/asm/cdmm.h +84 :2: note: in expansion of macro ‘module_driver’
> drivers/tty/mips_ejtag_fdc.c +1157 :1: note: in expansion of macro ‘module_mips_cdmm_driver’
> drivers/tty/mips_ejtag_fdc.c +1157 :1: warning: parameter names (without types) in function declaration
> 
> Instead of just adding the module.h include, switch to using the new
> builtin_mips_cdmm_driver() helper macro and drop the remove callback,
> since it isn't needed. If module support is added later, the code can
> always be resurrected.

Thanks for taking the cleanup approach here and not the one line
approach.  Saves me doing the cleanup work myself later.

Acked-by: Paul Gortmaker <paul.gortmaker@windriver.com>

P.
--

> 
> Signed-off-by: James Hogan <james.hogan@imgtec.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Jiri Slaby <jslaby@suse.com>
> Cc: Paul Gortmaker <paul.gortmaker@windriver.com>
> Cc: linux-mips@linux-mips.org
> Cc: <stable@vger.kernel.org> # 4.2.x-
> ---
>  drivers/tty/mips_ejtag_fdc.c | 35 +----------------------------------
>  1 file changed, 1 insertion(+), 34 deletions(-)
> 
> diff --git a/drivers/tty/mips_ejtag_fdc.c b/drivers/tty/mips_ejtag_fdc.c
> index a8c8cfd52a23..57ff5d3157a6 100644
> --- a/drivers/tty/mips_ejtag_fdc.c
> +++ b/drivers/tty/mips_ejtag_fdc.c
> @@ -1048,38 +1048,6 @@ err_destroy_ports:
>  	return ret;
>  }
>  
> -static int mips_ejtag_fdc_tty_remove(struct mips_cdmm_device *dev)
> -{
> -	struct mips_ejtag_fdc_tty *priv = mips_cdmm_get_drvdata(dev);
> -	struct mips_ejtag_fdc_tty_port *dport;
> -	int nport;
> -	unsigned int cfg;
> -
> -	if (priv->irq >= 0) {
> -		raw_spin_lock_irq(&priv->lock);
> -		cfg = mips_ejtag_fdc_read(priv, REG_FDCFG);
> -		/* Disable interrupts */
> -		cfg &= ~(REG_FDCFG_TXINTTHRES | REG_FDCFG_RXINTTHRES);
> -		cfg |= REG_FDCFG_TXINTTHRES_DISABLED;
> -		cfg |= REG_FDCFG_RXINTTHRES_DISABLED;
> -		mips_ejtag_fdc_write(priv, REG_FDCFG, cfg);
> -		raw_spin_unlock_irq(&priv->lock);
> -	} else {
> -		priv->removing = true;
> -		del_timer_sync(&priv->poll_timer);
> -	}
> -	kthread_stop(priv->thread);
> -	if (dev->cpu == 0)
> -		mips_ejtag_fdc_con.tty_drv = NULL;
> -	tty_unregister_driver(priv->driver);
> -	for (nport = 0; nport < NUM_TTY_CHANNELS; nport++) {
> -		dport = &priv->ports[nport];
> -		tty_port_destroy(&dport->port);
> -	}
> -	put_tty_driver(priv->driver);
> -	return 0;
> -}
> -
>  static int mips_ejtag_fdc_tty_cpu_down(struct mips_cdmm_device *dev)
>  {
>  	struct mips_ejtag_fdc_tty *priv = mips_cdmm_get_drvdata(dev);
> @@ -1152,12 +1120,11 @@ static struct mips_cdmm_driver mips_ejtag_fdc_tty_driver = {
>  		.name	= "mips_ejtag_fdc",
>  	},
>  	.probe		= mips_ejtag_fdc_tty_probe,
> -	.remove		= mips_ejtag_fdc_tty_remove,
>  	.cpu_down	= mips_ejtag_fdc_tty_cpu_down,
>  	.cpu_up		= mips_ejtag_fdc_tty_cpu_up,
>  	.id_table	= mips_ejtag_fdc_tty_ids,
>  };
> -module_mips_cdmm_driver(mips_ejtag_fdc_tty_driver);
> +builtin_mips_cdmm_driver(mips_ejtag_fdc_tty_driver);
>  
>  static int __init mips_ejtag_fdc_init_console(void)
>  {
> -- 
> 2.4.9
> 
