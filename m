Received: from 19pmail.ess.barracuda.com ([64.235.154.231]:39419 "EHLO
        19pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23990757AbdKIMyvdsdBH (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 9 Nov 2017 13:54:51 +0100
Date: Thu, 9 Nov 2017 12:54:32 +0000
From: James Hogan <james.hogan@mips.com>
Subject: Re: mips: use setup_timer() helper.
Message-ID: <20171109125432.GT15260@jhogan-linux>
References: <1506080615-6137-1-git-send-email-allen.lkml@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="kLVKJMuKEUFaIs8+"
Content-Disposition: inline
In-Reply-To: <1506080615-6137-1-git-send-email-allen.lkml@gmail.com>
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
To: Allen Pais <allen.lkml@gmail.com>
Cc: ralf@linux-mips.org, linux-mips@linux-mips.org
Message-ID: <20171109125432.T9E9rxqaesdSdub7RqrVeDD-IhqV8ujad9ZdWJ9e78I@z>

--kLVKJMuKEUFaIs8+
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 22, 2017 at 05:13:35PM +0530, Allen Pais wrote:
> Use setup_timer function instead of initializing timer with the
>    function and data fields.
>=20
> Signed-off-by: Allen Pais <allen.lkml@gmail.com>

Thanks, applied for 4.15.

Cheers
James

> ---
>  arch/mips/lasat/picvue_proc.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>=20
> diff --git a/arch/mips/lasat/picvue_proc.c b/arch/mips/lasat/picvue_proc.c
> index dd292dc..a8103f6 100644
> --- a/arch/mips/lasat/picvue_proc.c
> +++ b/arch/mips/lasat/picvue_proc.c
> @@ -197,8 +197,7 @@ static int __init pvc_proc_init(void)
>  	if (proc_entry =3D=3D NULL)
>  		goto error;
> =20
> -	init_timer(&timer);
> -	timer.function =3D pvc_proc_timerfunc;
> +	setup_timer(&timer, pvc_proc_timerfunc, 0UL);
> =20
>  	return 0;
>  error:

--kLVKJMuKEUFaIs8+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEd80NauSabkiESfLYbAtpk944dnoFAloEUAEACgkQbAtpk944
dnqhzBAAgrgHZe0Kdhinq8tOHGeUut9cQrPJVm9Mb5qFtz9coJxlL2CzW/o7JSWI
bQO+hyvJ2xGPWrnhrimh1J3VPQmaTVObQnB3+q/p0FNnD1to0HvhHCQEIMi30ehJ
x27C1o7G3Qc9bGZacjjXvl6ot7TkC4x+PYymiAeSZmylDWL5GMz0Yy/APRgemus0
0Nx86H4uJMeyJ7aVBJLj8ruPhxRdpwS+f8vvMJSC4CEZ8M2Sdtyrdu5HOLx2+VMj
Sc8MEsJmcR9nlv6UyODf8r19K/Ts56qtbSihE5tos+5n7KQo3pKs4Sn8g1QWGfUi
0zPRUBJVAj347K8jjkd0nlg3T1B7be386DFRQvvEpxDTLkzOymyHLu/fStfXORFN
hGPvuf7mgviTO1DsEfKf5d5gCGkxEvrSln76kUvn2QjIq4mOU/azBO6HgYM0zi5J
uUAf80u3eNsMbZaoVGICZiOgAx1XOhPltf+6lee436lOc0nZeArh9qCfwI13ryAz
UDjbOVIjKdzqvWRJuEgNkks0ciisMq+oVb4kjOeMSSe1MgFTy8HdbweXwplSAmn7
VrDupp01H6BG3T39g5moPOb8pBp8jpMbKuO8Z58yfhfwW9B5d+AyTp2t979bcQ4c
FYyF95OT44nbMMDZK2/06xKhCxBoa5/VBFyJXklLuHi7noToSG8=
=rlzs
-----END PGP SIGNATURE-----

--kLVKJMuKEUFaIs8+--
