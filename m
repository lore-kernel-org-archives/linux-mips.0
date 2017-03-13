Received: from mailapp01.imgtec.com ([195.59.15.196]:9211 "EHLO
        imgpgp01.kl.imgtec.org" rhost-flags-OK-OK-OK-FAIL)
        by eddie.linux-mips.org with ESMTP id S23990522AbdCMK5GBf9Bx (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 13 Mar 2017 11:57:06 +0100
Date: Mon, 13 Mar 2017 10:56:59 +0000
From: James Hogan <james.hogan@imgtec.com>
Subject: Re: [PATCH] MIPS: BPF: Add support for SKF_AD_HATYPE
Message-ID: <20170313105659.GJ996@jhogan-linux.le.imgtec.org>
References: <20170310221405.30648-1-david.daney@cavium.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="FWLu4iDmFxBfQb5/"
Content-Disposition: inline
In-Reply-To: <20170310221405.30648-1-david.daney@cavium.com>
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
To: David Daney <david.daney@cavium.com>
Cc: linux-mips@linux-mips.org, ralf@linux-mips.org, linux-kernel@vger.kernel.org, "Steven J. Hill" <steven.hill@cavium.com>, Alexei Starovoitov <ast@kernel.org>, netdev@vger.kernel.org
Message-ID: <20170313105659.eNc6OxLJrqpCOXNhkTDzhwxN9K-Cnca2xUE-dMMs0fA@z>

--FWLu4iDmFxBfQb5/
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 10, 2017 at 02:14:05PM -0800, David Daney wrote:
> This let's us pass some additional "modprobe test-bpf" tests.
>=20
> Reuse the code for SKF_AD_IFINDEX, but substitute the offset and size
> of the "type" field.
>=20
> Signed-off-by: David Daney <david.daney@cavium.com>

I think the BPF maintainers should probably be Cc'd on this patch.
Cc'ing now.

> ---
>  arch/mips/net/bpf_jit.c | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
>=20
> diff --git a/arch/mips/net/bpf_jit.c b/arch/mips/net/bpf_jit.c
> index 49a2e22..f613708 100644
> --- a/arch/mips/net/bpf_jit.c
> +++ b/arch/mips/net/bpf_jit.c
> @@ -1111,6 +1111,7 @@ static int build_body(struct jit_ctx *ctx)
>  			emit_load(r_A, 28, off, ctx);
>  			break;
>  		case BPF_ANC | SKF_AD_IFINDEX:
> +		case BPF_ANC | SKF_AD_HATYPE:
>  			/* A =3D skb->dev->ifindex */

this comment should probably be updated.

>  			ctx->flags |=3D SEEN_SKB | SEEN_A;
>  			off =3D offsetof(struct sk_buff, dev);
> @@ -1120,10 +1121,15 @@ static int build_body(struct jit_ctx *ctx)
>  			emit_bcond(MIPS_COND_EQ, r_s0, r_zero,
>  				   b_imm(prog->len, ctx), ctx);
>  			emit_reg_move(r_ret, r_zero, ctx);
> -			BUILD_BUG_ON(FIELD_SIZEOF(struct net_device,
> -						  ifindex) !=3D 4);
> -			off =3D offsetof(struct net_device, ifindex);
> -			emit_load(r_A, r_s0, off, ctx);
> +			if (code =3D=3D (BPF_ANC | SKF_AD_IFINDEX)) {
> +				BUILD_BUG_ON(FIELD_SIZEOF(struct net_device, ifindex) !=3D 4);
> +				off =3D offsetof(struct net_device, ifindex);
> +				emit_load(r_A, r_s0, off, ctx);
> +			} else { /* (code =3D=3D (BPF_ANC | SKF_AD_HATYPE) */
> +				BUILD_BUG_ON(FIELD_SIZEOF(struct net_device, type) !=3D 2);
> +				off =3D offsetof(struct net_device, type);
> +				emit_half_load(r_A, r_s0, off, ctx);

Technically net_device::type is unsigned, and emit_half_load uses LH
which sign extends. Does that matter in practice.

Cheers
James

--FWLu4iDmFxBfQb5/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYxnr7AAoJEGwLaZPeOHZ6vB8P/1qhDWJcOqciOWz85vMKYT1w
hrhyru4B9V2QX+XC85oacYVVR14fcHTQ+CvlmJcRdCx3/HyFfnfD6NNEifdff5Y2
JMMWqoZzk/vE7I4LpS+4Nn0LmJ65IVsU4fWf8ETA8G57Rut0Asn0hH3puTiRAmbX
9m93egf2KRHfcuvwRDX1lAumKmPm21J5tul8yYgClZ6efYS4fSE2KOEHgtY7Tce6
0zrBh6HZm+OLVMaoYci+3H9l/sCRrbFGEgdBvVZi7vQacxkbYu0Ik5VdRO89n8Z/
BTpzxWdsKNjFMntp5D0YgIkpAmvcJImvihU36b6uI7HNYe+fxOHdAWmPTr9y7N/n
+tT6hzQuqyyxNAHBIZ9GwQiKZ85i9NVrDEcp9UNdo/KySpc3HRxehPDSmn/jWdzy
PjWB1GYBWjTuIlcltAUiW3zzfn8G8n4Px+FyABlvVv3ttBFe5LOMtRtFFSGvD8jK
zi6UNBPWZfZcW7g1wPMc7z8D5m71mkbPEBLx6rmkQrpQPukSb/XY31XNYQGTXmhP
UD4jEzoNn8yhX6RM2Z3UnJPTzO0IrD0FR3U8Kiqh3kK+gmjvHz0IHjnIroyLTU7w
aoSTYhKYpnx7LBRJl7b9Clrp+8VULiC4Anxvx1aJ/YFymZHf+o6ZqrWYrwTQvcFL
pzziJNpHlH1yPd6ABlGr
=YBJk
-----END PGP SIGNATURE-----

--FWLu4iDmFxBfQb5/--
