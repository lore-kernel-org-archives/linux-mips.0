Received: from mailapp01.imgtec.com ([195.59.15.196]:37185 "EHLO
        imgpgp01.kl.imgtec.org" rhost-flags-OK-OK-OK-FAIL)
        by eddie.linux-mips.org with ESMTP id S23993877AbdBMV4SfvArk (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 13 Feb 2017 22:56:18 +0100
Date: Mon, 13 Feb 2017 21:56:11 +0000
From: James Hogan <james.hogan@imgtec.com>
Subject: Re: [PATCH] MIPS: Lantiq: Keep ethernet enabled during boot
Message-ID: <20170213215610.GL24226@jhogan-linux.le.imgtec.org>
References: <20170119132009.55709-1-nbd@nbd.name>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="FnOKg9Ah4tDwTfQS"
Content-Disposition: inline
In-Reply-To: <20170119132009.55709-1-nbd@nbd.name>
Return-Path: <James.Hogan@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Felix Fietkau <nbd@nbd.name>
Cc: linux-mips@linux-mips.org, ralf@linux-mips.org, john@phrozen.org, hauke.mehrtens@lantiq.com
Message-ID: <20170213215611.oByDgrz6ciFWsEgtGSgZ3YvNUxs4UgVBmhLJQNiM7c4@z>

--FnOKg9Ah4tDwTfQS
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 19, 2017 at 02:20:09PM +0100, Felix Fietkau wrote:
> Disabling ethernet during reboot (only to enable it again when the
> ethernet driver attaches) can put the chip into a faulty state where it
> corrupts the header of all incoming packets.
>=20
> This happens if packets arrive during the time window where the core is
> disabled, and it can be easily reproduced by rebooting while sending a
> flood ping to the broadcast address.
>=20
> Cc: john@phrozen.org
> Cc: hauke.mehrtens@lantiq.com
> Cc: stable@vger.kernel.org
> Fixes: 95135bfa7ead ("MIPS: Lantiq: Deactivate most of the devices by def=
ault")
> Signed-off-by: Felix Fietkau <nbd@nbd.name>

Applied

Thanks
James

> ---
>  arch/mips/lantiq/xway/sysctrl.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/arch/mips/lantiq/xway/sysctrl.c b/arch/mips/lantiq/xway/sysc=
trl.c
> index 236193b5210b..9a61671c00a7 100644
> --- a/arch/mips/lantiq/xway/sysctrl.c
> +++ b/arch/mips/lantiq/xway/sysctrl.c
> @@ -545,7 +545,7 @@ void __init ltq_soc_init(void)
>  		clkdev_add_pmu("1a800000.pcie", "msi", 1, 1, PMU1_PCIE2_MSI);
>  		clkdev_add_pmu("1a800000.pcie", "pdi", 1, 1, PMU1_PCIE2_PDI);
>  		clkdev_add_pmu("1a800000.pcie", "ctl", 1, 1, PMU1_PCIE2_CTL);
> -		clkdev_add_pmu("1e108000.eth", NULL, 1, 0, PMU_SWITCH | PMU_PPE_DP);
> +		clkdev_add_pmu("1e108000.eth", NULL, 0, 0, PMU_SWITCH | PMU_PPE_DP);
>  		clkdev_add_pmu("1da00000.usif", "NULL", 1, 0, PMU_USIF);
>  		clkdev_add_pmu("1e103100.deu", NULL, 1, 0, PMU_DEU);
>  	} else if (of_machine_is_compatible("lantiq,ar10")) {
> @@ -553,7 +553,7 @@ void __init ltq_soc_init(void)
>  				  ltq_ar10_fpi_hz(), ltq_ar10_pp32_hz());
>  		clkdev_add_pmu("1e101000.usb", "ctl", 1, 0, PMU_USB0);
>  		clkdev_add_pmu("1e106000.usb", "ctl", 1, 0, PMU_USB1);
> -		clkdev_add_pmu("1e108000.eth", NULL, 1, 0, PMU_SWITCH |
> +		clkdev_add_pmu("1e108000.eth", NULL, 0, 0, PMU_SWITCH |
>  			       PMU_PPE_DP | PMU_PPE_TC);
>  		clkdev_add_pmu("1da00000.usif", "NULL", 1, 0, PMU_USIF);
>  		clkdev_add_pmu("1f203000.rcu", "gphy", 1, 0, PMU_GPHY);
> @@ -575,11 +575,11 @@ void __init ltq_soc_init(void)
>  		clkdev_add_pmu(NULL, "ahb", 1, 0, PMU_AHBM | PMU_AHBS);
> =20
>  		clkdev_add_pmu("1da00000.usif", "NULL", 1, 0, PMU_USIF);
> -		clkdev_add_pmu("1e108000.eth", NULL, 1, 0,
> +		clkdev_add_pmu("1e108000.eth", NULL, 0, 0,
>  				PMU_SWITCH | PMU_PPE_DPLUS | PMU_PPE_DPLUM |
>  				PMU_PPE_EMA | PMU_PPE_TC | PMU_PPE_SLL01 |
>  				PMU_PPE_QSB | PMU_PPE_TOP);
> -		clkdev_add_pmu("1f203000.rcu", "gphy", 1, 0, PMU_GPHY);
> +		clkdev_add_pmu("1f203000.rcu", "gphy", 0, 0, PMU_GPHY);
>  		clkdev_add_pmu("1e103000.sdio", NULL, 1, 0, PMU_SDIO);
>  		clkdev_add_pmu("1e103100.deu", NULL, 1, 0, PMU_DEU);
>  		clkdev_add_pmu("1e116000.mei", "dfe", 1, 0, PMU_DFE);
> --=20
> 2.11.0
>=20
>=20

--FnOKg9Ah4tDwTfQS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYoitqAAoJEGwLaZPeOHZ68ZsQALhj0GEQIH2XP6jP3sgyJ1LI
x7FNQ6MiVURR82/UmEvLLyx0wiyvM2w/gUNPDCOheTNt89fuIPEvJj8NOiXp9d/B
XZGdOLaIpxLSZJxgXcznJ2iTztKyiysrdDG4B51fPXvgX4U6BSn3/upDnH71TU9v
RhXStbCV0qBS6+i3JTcXJJW5QiGG4JmGrGuzMPu4XhBXxLv2yFr37kVcEbGQ5WUn
AQ7GCOfcVSYDNst5lFSX0rc/wiQLZ1NlvT/WvuTVNsDkR01LlFCwNZNHsoinAbKV
tO4yGfwGIhLgd/UlkPOrFhCstEzKPVzwUldIY0qYNn3GJ0IYvs6vqnFF6YGCY5UW
3svz8zJLCS7vtL8hDta3zZY1k1cSouYCNiR9Jr0bgT+qnhwucxCKBoHulRc1vUdo
0BpdVRdTJxrG+HOVy2Xwq8zBSHPmVspER3NS6IUTW8KOIztWrl0AvyW5zbjW2p3e
0tQliGePny5FCYPrvKuOh84RHTFxbXpcBjimGFzQjALLe1F65NzOAkuCfAanCNjd
LNmK83gU9zTr+ylyIus1bw9o1KOx4/wlqNeK0NdBJslroTzj0Hhrf7oVNjWqlOEY
nPVefQJqNwv9CeAslqiQyoXCqgfi9J2ObqrYauKLKbzKl1jUGDiHVF9hntfbpWvT
F0mqxTtFAP8yRamk3WvD
=ARlv
-----END PGP SIGNATURE-----

--FnOKg9Ah4tDwTfQS--
