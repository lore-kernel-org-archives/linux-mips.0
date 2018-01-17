Received: from 9pmail.ess.barracuda.com ([64.235.154.211]:39918 "EHLO
        9pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23990409AbeAQVPRJmEJE (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 17 Jan 2018 22:15:17 +0100
Date: Wed, 17 Jan 2018 21:13:39 +0000
From: James Hogan <james.hogan@mips.com>
Subject: Re: [PATCH] MIPS: ftrace: Remove pointer comparison to 0 in
 prepare_ftrace_return
Message-ID: <20180117211339.GB27409@jhogan-linux.mipstec.com>
References: <20180117113157.25768-1-malat@debian.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="wwSFAA0Com6UqrPP"
Content-Disposition: inline
In-Reply-To: <20180117113157.25768-1-malat@debian.org>
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
To: Mathieu Malaterre <malat@debian.org>
Cc: Ralf Baechle <ralf@linux-mips.org>, Steven Rostedt <rostedt@goodmis.org>, Ingo Molnar <mingo@redhat.com>, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org
Message-ID: <20180117211339.FojZ479gkgS9lZ82gn3PvyZjcWbmQcJZBCQOOz9v5Lg@z>

--wwSFAA0Com6UqrPP
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 17, 2018 at 12:31:57PM +0100, Mathieu Malaterre wrote:
> Replace pointer comparison to 0 with NULL in prepare_ftrace_return
> to improve code readability. Identified with coccinelle script
> 'badzero.cocci'.
>=20
> Signed-off-by: Mathieu Malaterre <malat@debian.org>

Reviewed-by: James Hogan <jhogan@kernel.org>

Cheers
James

> ---
>  arch/mips/kernel/ftrace.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/arch/mips/kernel/ftrace.c b/arch/mips/kernel/ftrace.c
> index 99285be0e088..7f3dfdbc3657 100644
> --- a/arch/mips/kernel/ftrace.c
> +++ b/arch/mips/kernel/ftrace.c
> @@ -361,7 +361,7 @@ void prepare_ftrace_return(unsigned long *parent_ra_a=
ddr, unsigned long self_ra,
>  	 * If fails when getting the stack address of the non-leaf function's
>  	 * ra, stop function graph tracer and return
>  	 */
> -	if (parent_ra_addr =3D=3D 0)
> +	if (parent_ra_addr =3D=3D NULL)
>  		goto out;
>  #endif
>  	/* *parent_ra_addr =3D return_hooker; */
> --=20
> 2.11.0
>=20
>=20

--wwSFAA0Com6UqrPP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEd80NauSabkiESfLYbAtpk944dnoFAlpfvIMACgkQbAtpk944
dnrrfhAAjQRR+6kWFQh0Xt71sQZEBS3b1bNi81tc+yvwICe7sj1OQ8Jwn2YkWgRH
gjcBfAdBQYtCFrxWSnvBOZVVbtuYnfwFLyG66RZ0poaIs8Wl72o6Um4gSGpXgBlb
IS+Y27GYbNgCE86rBU6BwHe5HoYbi4TKRmqS2W29BrcZZ1iSe24Os89m43aOq6Vg
J+tETr/E4egZPoR9kAtYgEGPbsegRxnnfdehM9FT7/SgN0pFMQ84snq05tDXCwYZ
X4CPp0rdO3LqCSAh57zvqoTD1jveQv0vQzIb70efRtYE9M71KHZFIP3QFjB5uvqw
OYJk9aIjYHVE4uq+0rqFCBHnUW7FTYn24uz/8jUctJ8gisc/ETO1/QuHumee7BOD
CSEndG6xl+m9QtkbWUtyzHPP51kUZhHKpCgVQVfG5lfIht79APVf2wrrH6PfQfwK
OvTt75iNfIr6eybsKL0dv+AayaZsz2n86bsroTUxLLWlNW6zlO7zSbcOOxaZEn6T
C5dYth//jmqF7Mjngfn32qKj43n1lEsEPwSD3xlin+85vzV91W62WAsDFKAgJT4h
nZ4TiXRM6eYzlpgdrcLI6z4IW+a9pVTBv0xDHslCyc9iSbdP6dsvUE52eudAOxQ3
pHZyBVxEBEmo4y2Vf0L56owswxjBJ9wg524+YfZfvZPZkHgRQWc=
=mal1
-----END PGP SIGNATURE-----

--wwSFAA0Com6UqrPP--
