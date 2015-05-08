Received: from mailapp01.imgtec.com ([195.59.15.196]:63408 "EHLO
        imgpgp01.kl.imgtec.org" rhost-flags-OK-OK-OK-FAIL)
        by eddie.linux-mips.org with ESMTP id S27012817AbbEHORdS0nuJ (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 8 May 2015 16:17:33 +0200
Message-ID: <554CC530.20906@imgtec.com>
Date: Fri, 8 May 2015 15:16:16 +0100
From: James Hogan <james.hogan@imgtec.com>
MIME-Version: 1.0
Subject: Re: [PATCH] MIPS: KVM: do not sign extend on unsigned MMIO load
References: <1431002870-30098-1-git-send-email-hofrat@osadl.org>
In-Reply-To: <1431002870-30098-1-git-send-email-hofrat@osadl.org>
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature";
        boundary="4TxPvu4HkAHppA9S3Lc6EsaAl9OuAmtwq"
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
To: Nicholas Mc Guire <hofrat@osadl.org>, Gleb Natapov <gleb@kernel.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Ralf Baechle <ralf@linux-mips.org>, kvm@vger.kernel.org, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org
Message-ID: <20150508141616.GZFxWo2w4tAT-_koScYHUMaRN7Gf7kvtkuab2-r8GHU@z>

--4TxPvu4HkAHppA9S3Lc6EsaAl9OuAmtwq
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On 07/05/15 13:47, Nicholas Mc Guire wrote:
> Fix possible unintended sign extension in unsigned MMIO loads by castin=
g
> to uint16_t in the case of mmio_needed !=3D 2.
>=20
> Signed-off-by: Nicholas Mc Guire <hofrat@osadl.org>

Looks good to me. I wrote an MMIO test to reproduce the issue, and this
fixes it.

Reviewed-by: James Hogan <james.hogan@imgtec.com>
Tested-by: James Hogan <james.hogan@imgtec.com>

It looks suitable for stable too (3.10+).

Cheers
James

> ---
>=20
> Thanks to James Hogan <james.hogan@imgtec.com> for the explaination of =

> mmio_needed (there is not really any helpful comment in the code on thi=
s)
> in this case (mmio_needed!=3D2) it should be unsigned.
>=20
> Patch was only compile tested msp71xx_defconfig + CONFIG_KVM=3Dm
>=20
> Patch is against 4.1-rc2 (localversion-next is -next-20150506)
>=20
>  arch/mips/kvm/emulate.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/arch/mips/kvm/emulate.c b/arch/mips/kvm/emulate.c
> index 6230f37..2f0fc60 100644
> --- a/arch/mips/kvm/emulate.c
> +++ b/arch/mips/kvm/emulate.c
> @@ -2415,7 +2415,7 @@ enum emulation_result kvm_mips_complete_mmio_load=
(struct kvm_vcpu *vcpu,
>  		if (vcpu->mmio_needed =3D=3D 2)
>  			*gpr =3D *(int16_t *) run->mmio.data;
>  		else
> -			*gpr =3D *(int16_t *) run->mmio.data;
> +			*gpr =3D *(uint16_t *)run->mmio.data;
> =20
>  		break;
>  	case 1:
>=20


--4TxPvu4HkAHppA9S3Lc6EsaAl9OuAmtwq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJVTMU4AAoJEGwLaZPeOHZ67k0QAJPO9DMmHX3BH3vhjAcm2Qkm
RFKiVTkXqyypH14iYaCy6fpuQdIqzm4cqLnT9qZK/eSGovblhSpvIUcaxAPfAEqw
bsBV9ksQoONQIPrhlEXwiBW8TJa4V3ljBH9/Zx+lZuOgS79XREbrwtAH3/MhmVfF
BNamNA0S3Onjh+B4uExFMROaONb+vVbQID+FBS+T/USfwrNP+QcP6RCUNtDsjhGr
jj+LUn50miN1zWThm6V8fmUhgVaf6Ehcs7bUM04q5wgPV1r1xU12fsPkbZH5SbeI
N+D4KkX/YS0Q/DiNy2KCMKd7DpGil9Uu9RL34WmtV4a3cfmJZJ3GWdsrQinh2PL5
R/xdGrQ/wQJZxhZ9Q2Da7FniqXoHfVFtnk/58fFVP+kD4R2BKfNp2i81dHb3zUQF
FBxiBqLe/w+2gg1hrpYq0SfXGBXhc78y4qHxgbG+6f8kAJUGA6wmSULNofM1L1pO
3z8ckKDTJUnsD2Wb8RzliU2czeM94wnQE3N4MxSBndKkZ3h0YNKXO5SDKt9CxMhO
66nyZmXDi3VPmOhbE2cAimMsutpemgmIzYBTplfr2S3kNPe7UsbcbHXhjEZNCH4v
QOdRCeD8QgAe6ZOmDukRcWGftq1s4WmwkXFXd/BXSH50FwsjPy3C1bCBiZ8CvwLu
KDNcwhetO1VV3ufMs8s1
=aOsa
-----END PGP SIGNATURE-----

--4TxPvu4HkAHppA9S3Lc6EsaAl9OuAmtwq--
