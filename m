Received: from 19pmail.ess.barracuda.com ([64.235.154.231]:50412 "EHLO
        19pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23992316AbdKOWBJyI2M4 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 15 Nov 2017 23:01:09 +0100
Date: Wed, 15 Nov 2017 21:59:11 +0000
From: James Hogan <james.hogan@mips.com>
Subject: Re: [PATCH v9 3/3] MIPS: ranchu: Add Ranchu as a new generic-based
 board
Message-ID: <20171115215910.GB27409@jhogan-linux.mipstec.com>
References: <1510753368-16453-1-git-send-email-aleksandar.markovic@rt-rk.com>
 <1510753368-16453-4-git-send-email-aleksandar.markovic@rt-rk.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="neYutvxvOLaeuPCA"
Content-Disposition: inline
In-Reply-To: <1510753368-16453-4-git-send-email-aleksandar.markovic@rt-rk.com>
Return-Path: <James.Hogan@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
Cc: linux-mips@linux-mips.org, Miodrag Dinic <miodrag.dinic@mips.com>, Goran Ferenc <goran.ferenc@mips.com>, Aleksandar Markovic <aleksandar.markovic@mips.com>, "David S. Miller" <davem@davemloft.net>, Douglas Leung <douglas.leung@mips.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, Paul Burton <paul.burton@mips.com>, Petar Jovanovic <petar.jovanovic@mips.com>, Raghu Gandham <raghu.gandham@mips.com>, Ralf Baechle <ralf@linux-mips.org>, Randy Dunlap <rdunlap@infradead.org>
Message-ID: <20171115215911.xABDy5vT_HY2GOFmbm5hIEeiwNG47igY1hc--ce9rlw@z>

--neYutvxvOLaeuPCA
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Aleksandar,

On Wed, Nov 15, 2017 at 02:42:20PM +0100, Aleksandar Markovic wrote:
> diff --git a/arch/mips/configs/generic/board-ranchu.config b/arch/mips/configs/generic/board-ranchu.config
> new file mode 100644
> index 0000000..fee9ad4
> --- /dev/null
> +++ b/arch/mips/configs/generic/board-ranchu.config
> @@ -0,0 +1,30 @@
> +CONFIG_VIRT_BOARD_RANCHU=y

I presume its valid for Ranchu support to be enabled in MIPS32 / MIPS64,
and R1 / R2 / R6 kernels? (that's fine if so, just making sure there's
no need for a require comment).

> diff --git a/arch/mips/generic/board-ranchu.c b/arch/mips/generic/board-ranchu.c
> new file mode 100644
> index 0000000..0efc555
> --- /dev/null
> +++ b/arch/mips/generic/board-ranchu.c
> @@ -0,0 +1,85 @@

...

> +static __init unsigned int ranchu_measure_hpt_freq(void)
> +{

...

> +	count += 5000;	/* round */
> +	count -= count % 10000;

A comment to explain the purpose of the rounding would be helpful. I
presume its there just to get a more accurate value since the frequency
will always be a round value in practice.

Either way this patch looks good to me:
Reviewed-by: James Hogan <jhogan@kernel.org>

Thanks!
James

--neYutvxvOLaeuPCA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEd80NauSabkiESfLYbAtpk944dnoFAloMuKgACgkQbAtpk944
dnpeFw/8DExi8wFBAdaH20u+iGqOc0Kpxl2KyV+on+yt9EDVHizax+NfYj50Upqc
h8B1TVGUTGFFwv0PzaddABszwepRM+uhRvnLn+WLgENt+UUFPehF8UTE1h5tFgqO
VUJqxYbvLmicsF0W3HpMlyWbr4CZibyhftPb/mZonwifaJbHKgslXYttGG4D903j
prhUTN7o8Hnkt2q+sV3fyGgO2nC3Ex5oSVeDDNTxQNxqK8oNSrslq2lTOhXuMO++
b/sbT6EZSnQ/GPnSUJrHuHgcVsAGRQwhQCZwC1uMm7sjkMxpcffKpUWE/NJLQuk8
GuBlRw6y68KbvrNDZ2iQWZB09VQfe8DxoC5Axw2/6F+PwGuCDWOI0mcAf18p0mGC
a8zA5yZ1VpbRhwZnR2YrQIA+Ozlv7U79EA0iiCFfSEF9uoKLre7J4FpeN+RdsG9y
N7w2X6TZOVrBHbHWUMe1hZTdUd29Vy24OLflhcHRkdovz4aG1NYabU5RfMSZnU47
QP4h7OOYkzWVuY6F5k3BhvJaEiV9ML2HeDwg92/GqI6soqU601B2r+EKK5eGcF3z
Dcw/fuVyKtgzCWMj4K2jneugKZuStUcbskoBsz8Qtqu2FJ/ZhYnHopzLVFYQAWL/
TYIK7m9hOVLEaeY+xytdBXyJEHOP1VbE+h3Ufu2fMfZJ9YYCbbQ=
=vr0Q
-----END PGP SIGNATURE-----

--neYutvxvOLaeuPCA--
