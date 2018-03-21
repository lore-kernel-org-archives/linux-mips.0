Received: from 9pmail.ess.barracuda.com ([64.235.154.211]:49677 "EHLO
        9pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23990439AbeCUIw6ErPLX (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 21 Mar 2018 09:52:58 +0100
Subject: Re: [PATCH v3] MIPS: ralink: fix booting on mt7621
References: <87efkf9z0o.fsf@notabene.neil.brown.name>
 <87605r9mwf.fsf@notabene.neil.brown.name>
 <871sge872l.fsf@notabene.neil.brown.name>
From: Matt Redfearn <matt.redfearn@mips.com>
Message-ID: <364419e1-947b-2a87-526d-ccf3e77beb16@mips.com>
Date: Wed, 21 Mar 2018 08:52:54 +0000
MIME-Version: 1.0
In-Reply-To: <871sge872l.fsf@notabene.neil.brown.name>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Return-Path: <Matt.Redfearn@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: NeilBrown <neil@brown.name>, John Crispin <john@phrozen.org>, Ralf Baechle <ralf@linux-mips.org>, James Hogan <jhogan@kernel.org>
Cc: linux-mips@linux-mips.org, linux-kernel@vger.kernel.org
Message-ID: <20180321085254.ZZ_Sn9XtBohUNdB5l_f4_e_Vo13CJkRXclVODp7oq4E@z>



On 21/03/18 03:02, NeilBrown wrote:
> 
> Since commit 3af5a67c86a3 ("MIPS: Fix early CM probing") the MT7621
> has not been able to boot.
> 
> This patched caused mips_cm_probe() to be called before
> mt7621.c::proc_soc_init().
> 
> prom_soc_init() has a comment explaining that mips_cm_probe()
> "wipes out the bootloader config" and means that configuration
> registers are no longer available.  It has some code to re-enable
> this config.
> 
> Before this re-enable code is run, the sysc register cannot be
> read, so when SYSC_REG_CHIP_NAME0 is read, a garbage value
> is returned and panic() is called.
> 
> If we move the config-repair code to the top of prom_soc_init(),
> the registers can be read and boot can proceed.
> 
> Very occasionally, the first register read after the reconfiguration
> returns garbage.  So I added a call to __sync().
> 
> Fixes: 3af5a67c86a3 ("MIPS: Fix early CM probing")
> Signed-off-by: NeilBrown <neil@brown.name>

Looks good to me

Reviewed-by: Matt Redfearn <matt.redfearn@mips.com>

> ---
>   arch/mips/ralink/mt7621.c | 42 ++++++++++++++++++++++--------------------
>   1 file changed, 22 insertions(+), 20 deletions(-)
> 
> diff --git a/arch/mips/ralink/mt7621.c b/arch/mips/ralink/mt7621.c
> index 1b274742077d..d2718de60b9b 100644
> --- a/arch/mips/ralink/mt7621.c
> +++ b/arch/mips/ralink/mt7621.c
> @@ -170,6 +170,28 @@ void prom_soc_init(struct ralink_soc_info *soc_info)
>   	u32 n1;
>   	u32 rev;
>   
> +	/* Early detection of CMP support */
> +	mips_cm_probe();
> +	mips_cpc_probe();
> +
> +	if (mips_cps_numiocu(0)) {
> +		/*
> +		 * mips_cm_probe() wipes out bootloader
> +		 * config for CM regions and we have to configure them
> +		 * again. This SoC cannot talk to pamlbus devices
> +		 * witout proper iocu region set up.
> +		 *
> +		 * FIXME: it would be better to do this with values
> +		 * from DT, but we need this very early because
> +		 * without this we cannot talk to pretty much anything
> +		 * including serial.
> +		 */
> +		write_gcr_reg0_base(MT7621_PALMBUS_BASE);
> +		write_gcr_reg0_mask(~MT7621_PALMBUS_SIZE |
> +				    CM_GCR_REGn_MASK_CMTGT_IOCU0);
> +		__sync();
> +	}
> +
>   	n0 = __raw_readl(sysc + SYSC_REG_CHIP_NAME0);
>   	n1 = __raw_readl(sysc + SYSC_REG_CHIP_NAME1);
>   
> @@ -194,26 +216,6 @@ void prom_soc_init(struct ralink_soc_info *soc_info)
>   
>   	rt2880_pinmux_data = mt7621_pinmux_data;
>   
> -	/* Early detection of CMP support */
> -	mips_cm_probe();
> -	mips_cpc_probe();
> -
> -	if (mips_cps_numiocu(0)) {
> -		/*
> -		 * mips_cm_probe() wipes out bootloader
> -		 * config for CM regions and we have to configure them
> -		 * again. This SoC cannot talk to pamlbus devices
> -		 * witout proper iocu region set up.
> -		 *
> -		 * FIXME: it would be better to do this with values
> -		 * from DT, but we need this very early because
> -		 * without this we cannot talk to pretty much anything
> -		 * including serial.
> -		 */
> -		write_gcr_reg0_base(MT7621_PALMBUS_BASE);
> -		write_gcr_reg0_mask(~MT7621_PALMBUS_SIZE |
> -				    CM_GCR_REGn_MASK_CMTGT_IOCU0);
> -	}
>   
>   	if (!register_cps_smp_ops())
>   		return;
> 
