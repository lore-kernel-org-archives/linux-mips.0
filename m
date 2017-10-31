Received: from 19pmail.ess.barracuda.com ([64.235.150.244]:43215 "EHLO
        19pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23991940AbdJaXwXjpkRU (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 1 Nov 2017 00:52:23 +0100
Date: Tue, 31 Oct 2017 23:52:19 +0000
From: James Hogan <james.hogan@mips.com>
Subject: Re: [PATCH] MIPS: Fix CM region target definitions
Message-ID: <20171031235219.GE15260@jhogan-linux>
References: <20171031220922.14931-1-paul.burton@mips.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="gE7i1rD7pdK0Ng3j"
Content-Disposition: inline
In-Reply-To: <20171031220922.14931-1-paul.burton@mips.com>
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
To: Paul Burton <paul.burton@mips.com>
Cc: linux-mips@linux-mips.org, Matt Redfearn <matt.redfearn@mips.com>, Ralf Baechle <ralf@linux-mips.org>, stable@vger.kernel.org
Message-ID: <20171031235219.5O6cTlXLYG3X9XsAScwCIVK38wKhl1-s6-zA53gC_oE@z>

--gE7i1rD7pdK0Ng3j
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 31, 2017 at 03:09:22PM -0700, Paul Burton wrote:
> The default CM target field in the GCR_BASE register is encoded with 0
> meaning memory & 1 being reserved. However the definitions we use for
> those bits effectively get these two values backwards - likely because
> they were copied from the definitions for the CM regions where the
> target is encoded differently. This results in use setting up GCR_BASE
> with the reserved target value by default, rather than targeting memory
> as intended. Although we currently seem to get away with this it's not a
> great idea to rely upon.
>=20
> Fix this by changing our macros to match the documentated target values.
>=20
> The incorrect encoding became used as of commit 9f98f3dd0c51 ("MIPS: Add
> generic CM probe & access code") in the Linux v3.15 cycle, and was
> likely carried forwards from older but unused code introduced by
> commit 39b8d5254246 ("[MIPS] Add support for MIPS CMP platform.") in the
> v2.6.26 cycle.
>=20
> Signed-off-by: Paul Burton <paul.burton@mips.com>
> Reported-by: Matt Redfearn <matt.redfearn@mips.com>
> Cc: Matt Redfearn <matt.redfearn@mips.com>
> Cc: Ralf Baechle <ralf@linux-mips.org>
> Cc: linux-mips@linux-mips.org
> Cc: <stable@vger.kernel.org> # v3.15+

Reviewed-by: James Hogan <jhogan@kernel.org>

Cheers
James

> ---
>=20
>  arch/mips/include/asm/mips-cm.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/arch/mips/include/asm/mips-cm.h b/arch/mips/include/asm/mips=
-cm.h
> index f6231b91b724..c6aaabd7cfd1 100644
> --- a/arch/mips/include/asm/mips-cm.h
> +++ b/arch/mips/include/asm/mips-cm.h
> @@ -142,8 +142,8 @@ GCR_ACCESSOR_RO(64, 0x000, config)
>  GCR_ACCESSOR_RW(64, 0x008, base)
>  #define CM_GCR_BASE_GCRBASE			GENMASK_ULL(47, 15)
>  #define CM_GCR_BASE_CMDEFTGT			GENMASK(1, 0)
> -#define  CM_GCR_BASE_CMDEFTGT_DISABLED		0
> -#define  CM_GCR_BASE_CMDEFTGT_MEM		1
> +#define  CM_GCR_BASE_CMDEFTGT_MEM		0
> +#define  CM_GCR_BASE_CMDEFTGT_RESERVED		1
>  #define  CM_GCR_BASE_CMDEFTGT_IOCU0		2
>  #define  CM_GCR_BASE_CMDEFTGT_IOCU1		3
> =20
> --=20
> 2.15.0
>=20
>=20

--gE7i1rD7pdK0Ng3j
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEd80NauSabkiESfLYbAtpk944dnoFAln5DLMACgkQbAtpk944
dnoOag//aX0DaDsvnM+pRWG+7pwYZJIqD4usrz1x48cag+WMRrn6oKudsSruSgih
08j3cbQAocp5nMYFr4irZdONpRibi1SHBMlotCYnQiwBzmakKgf+FPXTUtFKOOk3
jWYSrSeYi7Z2wbUDuhUcYGUhS1vep/S9iM1nXTjRhjrArECrmK4jHLXsXee1PRRt
5ZcPHQmaYQDXlMblWtHIxfnhbRMzY8rHkSd7EReSDHRh2VSNYI8i/24+yMGyG5bP
iRQlauOnNZOc3dp8NZ3kSgNNnlYH8z/BUmKPxWq4aGRsfU3zbuF7reTkCzuxY0FR
3/RzYKS2cLCWxXrz/HJ7mBtxFbeXCTRtNncq6tIq+tBLwLjWYM9t7xJ6NnN4e2xJ
YJ9hydOBi7hRMyouH+iqBcijB8wlTQdynzK/t/uLNnpxPpPaS4ZIL0ppfNzDLN36
LiVNJFH77oCavVYEGDZSPvDzE0/IlhGGna+gNpogDvp7ikC3aYHrq7iuEfpt1Ij/
cG9IeRIMPLn7lTxjvr/luhON09UBgGvZvSNmUQrjs1Hcxi+jsUSvuyhK0MEaEfQd
dCaiTqg0ITr89glvFr5Q+e4q7lULDjAItWQ06gWEX2KxUAj/AKj7Pm9whBRUhKZG
FYzIwqAef2rs3/WpJpUwrPb7FcglKqZFXRBzsHKfOedHXIjUaOk=
=Z8Jl
-----END PGP SIGNATURE-----

--gE7i1rD7pdK0Ng3j--
