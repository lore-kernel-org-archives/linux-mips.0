Received: from mailapp01.imgtec.com ([195.59.15.196]:54478 "EHLO
        imgpgp01.kl.imgtec.org" rhost-flags-OK-OK-OK-FAIL)
        by eddie.linux-mips.org with ESMTP id S27026558AbbEHOmITyLXa (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 8 May 2015 16:42:08 +0200
Message-ID: <554CCB3B.90504@imgtec.com>
Date: Fri, 8 May 2015 15:42:03 +0100
From: James Hogan <james.hogan@imgtec.com>
MIME-Version: 1.0
Subject: Re: [PATCH RFC] MIPS: KVM: role back pc in case of EMULATE_FAIL
References: <1431003091-30161-1-git-send-email-hofrat@osadl.org>
In-Reply-To: <1431003091-30161-1-git-send-email-hofrat@osadl.org>
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature";
        boundary="BCRvvqCFuCgXmOSFfednB6ho95vLARhat"
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
Message-ID: <20150508144203.Dq_KsClm8IbCRqlId02ozciG9SQ3gDXRceeX0V3q8G4@z>

--BCRvvqCFuCgXmOSFfednB6ho95vLARhat
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On 07/05/15 13:51, Nicholas Mc Guire wrote:
> Currently if kvm_mips_complete_mmio_load() fails with EMULATE_FAIL it w=
ill
> not role back the pc nor will the caller handle this failure.
>=20
> Signed-off-by: Nicholas Mc Guire <hofrat@osadl.org>
> ---
>  arch/mips/kvm/emulate.c |    4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> kvm_mips_complete_mmio_load is called only in arch/mips/kvm/mips.c with=
out
> checking the return value to signal EMULATE_FAIL:
>  383         if (vcpu->mmio_needed) {
>  384                 if (!vcpu->mmio_is_write)
>  385                         kvm_mips_complete_mmio_load(vcpu, run);
>  386                 vcpu->mmio_needed =3D 0;
>  387         }
>=20
> so maybe kvm_mips_complete_mmio_load should role back in case of failur=
e=20
> at arch/mips/kvm/emuilate.c:kvm_mips_complete_mmio_load()
> 2406         if (er =3D=3D EMULATE_FAIL) {
> 2408                 return er;
>=20
> something like the below patch - only based no looking at how EMULATE_F=
AIL
> is handled at other locations - not sure if this is appropriate here.
>=20
> Patch was only compile tested msp71xx_defconfig + CONFIG_KVM=3Dm
>=20
> Patch is against 4.1-rc2 (localversion-next is -next-20150506)
>=20
> diff --git a/arch/mips/kvm/emulate.c b/arch/mips/kvm/emulate.c
> index 2f0fc60..b58596b 100644
> --- a/arch/mips/kvm/emulate.c
> +++ b/arch/mips/kvm/emulate.c
> @@ -2403,8 +2403,10 @@ enum emulation_result kvm_mips_complete_mmio_loa=
d(struct kvm_vcpu *vcpu,
>  	 */
>  	curr_pc =3D vcpu->arch.pc;
>  	er =3D update_pc(vcpu, vcpu->arch.pending_load_cause);
> -	if (er =3D=3D EMULATE_FAIL)
> +	if (er =3D=3D EMULATE_FAIL) {
> +		vcpu->arch.pc =3D curr_pc;

If update_pc returns EMULATE_FAIL then vcpu->arch.pc won't have been
modified, so putting it back to the old value is redundant.

Actually, curr_pc can be dropped from this function since nothing else
can go wrong that would cause the PC to need rolling back. Effectively
kvm_mips_emulate_load() has omitted to update the PC since it'll only
return to userland to handle the MMIO and get the load data, so by the
time it gets back to kvm_mips_complete_mmio_load(), it already has
everything it needs to guarantee success.

Cheers
James


>  		return er;
> +	}
> =20
>  	switch (run->mmio.len) {
>  	case 4:
>=20


--BCRvvqCFuCgXmOSFfednB6ho95vLARhat
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJVTMs8AAoJEGwLaZPeOHZ6ep0P/AqfJK6QeSCtU7Iobp129yRH
jImrjDqaKq8rlbpqDiKKHAoPXZmAYEZbtr1pD6xfIynmUBeOokyxgZcoMnPc8Bnc
LhuSbP3R17SR5I/mQ1vXZtydsB3Oizr2z3c/a5/nf8R+/+vsRau6PqQ/UqM06uMz
vO8mahw5IJ0kGhbThX6g9m1ck8xy7GAahar41OaCiI3LVxL0M1h0YHEX4ty6fybD
b3FCfVwfOJwgmVov4JODAYZ9mZFi3oOPhhD9f+sX1CEvk5WsSM3Brq/u4XxyRdOi
pPlglAP7Am+RxQIiOZOjmTYWZdAioWZuWYSw+9aYv1ksqxf3A4Rr+O4I0FiLgtCb
vIUyvvD67eS/0jiR8BxsRUjEXJQmG4IV0UjUq8UuGMVj3iSr2wVnDcNaWNE5lpac
CgJuXgCsWEme3W3Db0qPbUtDS/y+rxobtaXwhFlaV3+ID5ArXGOG+y3QpADstL0v
NJ2/QWB6oknWw+gJg/pjQddYMpqoxC5mhCWijQ9SlE8NVHLdOdoFrTBi71CZab2x
rAGv/FuPlM0YLL+YiJ6xfp+Hx6QflbRnNUhLCzUkxCm/ApJnJcGEMCSKUx5EuAPL
gX7NpqS0g12ftKFMouq2Gi/C23h7zxmQ2uP3wtrHnPWeVHudmVoMSIPwK6QrCClM
ShY5Isciv/AWHA+m8q+4
=qTer
-----END PGP SIGNATURE-----

--BCRvvqCFuCgXmOSFfednB6ho95vLARhat--
