Received: from mailapp01.imgtec.com ([195.59.15.196]:15171 "EHLO
        imgpgp01.kl.imgtec.org" rhost-flags-OK-OK-OK-FAIL)
        by eddie.linux-mips.org with ESMTP id S23992213AbdBKVtsJmXf6 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Sat, 11 Feb 2017 22:49:48 +0100
Date: Sat, 11 Feb 2017 21:49:41 +0000
From: James Hogan <james.hogan@imgtec.com>
Subject: Re: [PATCH] MIPS: IRQ Stack: Fix erroneous jal to plat_irq_dispatch
Message-ID: <20170211214941.GC9246@jhogan-linux.le.imgtec.org>
References: <1485363625-10789-1-git-send-email-matt.redfearn@imgtec.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="4jXrM3lyYWu4nBt5"
Content-Disposition: inline
In-Reply-To: <1485363625-10789-1-git-send-email-matt.redfearn@imgtec.com>
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
To: Matt Redfearn <matt.redfearn@imgtec.com>
Cc: Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org, Paul Burton <paul.burton@imgtec.com>
Message-ID: <20170211214941.bbg6paXw-Utt7S5Cla2ImiXZusmDGIIv9V05gJV8254@z>

--4jXrM3lyYWu4nBt5
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 25, 2017 at 05:00:25PM +0000, Matt Redfearn wrote:
> Commit dda45f701c9d ("MIPS: Switch to the irq_stack in interrupts")
> changed both the normal and vectored interrupt handlers. Unfortunately
> the vectored version, "except_vec_vi_handler", was incorrectly modified
> to unconditionally jal to plat_irq_dispatch, rather than doing a jalr to
> the vectored handler that has been set up. This is ok for many platforms
> which set the vectored handler to plat_irq_dispatch anyway, but will
> cause problems with platforms that use other handlers.
>=20
> Fixes: dda45f701c9d ("MIPS: Switch to the irq_stack in interrupts")
> Signed-off-by: Matt Redfearn <matt.redfearn@imgtec.com>

Applied

Thanks
James

> ---
>=20
> Ralf, if possible please could you squash this?
>=20
> ---
>  arch/mips/kernel/genex.S | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/arch/mips/kernel/genex.S b/arch/mips/kernel/genex.S
> index 0a7ba4b2f687..7ec9612cb007 100644
> --- a/arch/mips/kernel/genex.S
> +++ b/arch/mips/kernel/genex.S
> @@ -329,7 +329,7 @@ NESTED(except_vec_vi_handler, 0, sp)
>  	PTR_ADD sp, t0, t1
> =20
>  2:
> -	jal	plat_irq_dispatch
> +	jalr	v0
> =20
>  	/* Restore sp */
>  	move	sp, s1
> --=20
> 2.7.4
>=20

--4jXrM3lyYWu4nBt5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYn4b1AAoJEGwLaZPeOHZ6i3AP/1ASsU4NZz9u6U48uY+ho0bw
ozVQkklVC+dst/X+vDK1k89oGgYJwtnwg4FY6Je8VBfs+89tBs2jqflqGLfONGV+
g4nkxbXXnmSRuHGVkBQBo+Zid3tvxc1sS6JyHAS8a/KOgnZ/2B4M83gTC5Wuyd9v
VuZbdjZW8lgUHrBCIkVmyqrrfFXiMx0LgMVwXhEfbM4INauLghBcLo67dYEhkIfE
9EV9y7RcNblqqFiIxFl6O4KaQrY73v4YEebl66epYnnnbt2udqfvE9fnNpnefVsd
98JFEomVa3jTRcLxaa7AL37HkU7B3/8GvdK1VtU4pY7bAynRDlrWF4zDtfQ9VNj9
XQTFKYDed2LmZQo2yuteoRP7sPNBGZp61Y5ELsk5tRKd1cISRiujU2siF/33fmjY
D7N3Pb5SokrScdZCKqFnZ/+yqHx8jBII3Z2shRK6up5vCWWunDGle3Aaxw2qbYWL
I+o0Ghh0YeRyn3qAIgPfOlZeijPgtV6szmP4oyBxtRGeZJ1+kphhQ6zb1P1XjFS+
0f9HBH5U0n8pKmn+HstN+/Bv/TnPmApHqWFFIMaZvFnwj0TvnwXK8WsXBS2fxfcT
WPbC3DBtmIgx+IBMDk1QNcVc4ZMnIurFAAXhAYtT00ssCFBCQxFWlH0ErP+5ohEY
/fG0FXRcnGL/dEPKDP4k
=YV1k
-----END PGP SIGNATURE-----

--4jXrM3lyYWu4nBt5--
