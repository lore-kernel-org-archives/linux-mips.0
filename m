Received: from mailapp01.imgtec.com ([195.59.15.196]:29455 "EHLO
        imgpgp01.kl.imgtec.org" rhost-flags-OK-OK-OK-FAIL)
        by eddie.linux-mips.org with ESMTP id S27026894AbcDRKExMpNqM (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 18 Apr 2016 12:04:53 +0200
Date: Mon, 18 Apr 2016 11:04:47 +0100
From: James Hogan <james.hogan@imgtec.com>
Subject: Re: [PATCH v2 13/13] MIPS: mm: Panic if an XPA kernel is run without
 RIXI
Message-ID: <20160418100446.GN7859@jhogan-linux.le.imgtec.org>
References: <1460972133-16973-1-git-send-email-paul.burton@imgtec.com>
 <1460972133-16973-14-git-send-email-paul.burton@imgtec.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="R92lf0Oi2sxyK3LA"
Content-Disposition: inline
In-Reply-To: <1460972133-16973-14-git-send-email-paul.burton@imgtec.com>
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
To: Paul Burton <paul.burton@imgtec.com>
Cc: linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>, Paul Gortmaker <paul.gortmaker@windriver.com>, linux-kernel@vger.kernel.org
Message-ID: <20160418100447.lniNHV5NUxxfJ1mX2e_oWzWgsFxgIDTLchFiK-onIAU@z>

--R92lf0Oi2sxyK3LA
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 18, 2016 at 10:35:33AM +0100, Paul Burton wrote:
> XPA kernels hardcode for the presence of RIXI - the PTE format & its
> handling presume RI & XI bits. Make this dependence explicit by panicing
> if we run on a system that violates it.
>=20
> Signed-off-by: Paul Burton <paul.burton@imgtec.com>
>=20
> ---
>=20
> Changes in v2:
> - New patch, in response to clarification on patch 5.
>=20
>  arch/mips/mm/tlbex.c | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/arch/mips/mm/tlbex.c b/arch/mips/mm/tlbex.c
> index 3f1a8a2..9c39c66 100644
> --- a/arch/mips/mm/tlbex.c
> +++ b/arch/mips/mm/tlbex.c
> @@ -2395,6 +2395,9 @@ void build_tlb_refill_handler(void)
>  	 */
>  	static int run_once =3D 0;
> =20
> +	if (config_enabled(CONFIG_XPA) && !cpu_has_rixi)
> +		panic("Kernels supporting XPA currently require CPUs with RIXI\n");

Don't think you need the newline.

Otherwise
Reviewed-by: James Hogan <james.hogan@imgtec.com>

In the future we can hopefully drop that requirement so that XPA kernels
can run on non-XPA, non-RIXI hardware.

Cheers
James

> +
>  	output_pgtable_bits_defines();
>  	check_pabits();
> =20
> --=20
> 2.8.0
>=20

--R92lf0Oi2sxyK3LA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJXFLE+AAoJEGwLaZPeOHZ6CB0QALUYRfCsF3GNUtxr/MEMVYLw
g4N2k6QjPimvoxp151bLGlnH17o2MM24YP5SVzGiq6gRpplQ9Z0eEwxb14WYbizd
HkipMJ7o8UAggNFaJ3aogWzykq/+Xd2neVAL9eUbTOrdkYyQGwi/AYf9KsidZWD/
O4RwRi4ahWLKVRlEOhzJvnKBoGb5P6zpSZmtwvW/BD7VR7zAGjay4Dm+urigg+va
cMwfDlflNKoK9/VpG22n+iNHnTZzO+n/Rrc9AYe6WMwWgBerNEl7hYJsRZyg/J9h
HFUUsLzrWzbAp7XLUu8ktTxaei/OtM5MUrqDbv1IMnjmRvLAXmY48tcMotce9ELQ
X+iH5SZdoCtVU3O/Ss3K9cG24zwLpiOybo+tuSz/VGQHiS7hxrfBYU6BlAqhVEIw
NSuhX3kplhL9VyA+oOqtOEA7hF1ZXY6WUdWA9p6NVG5TfKZNVuz+IQ4n3L+QsbOa
O7EPdsOIJcN9k8qYF1Mi7Hsv5EN8EXQCT74+KDRBnLMMcLL+WJVwgehICP/km+rr
0xa12HGyA3E83o4RdL4E9T6JFdCBAL1zLhOS5IPM2qpRjRLYces4pHI/0VEQK8/N
jw26NYZZgP8sxiPAQf4i27oP11XCR44OniMxAwL0tBQ4Knor4ZuLwPpWv7cRo3Mm
sRFtfpLLk2txIjutFgC3
=OMgd
-----END PGP SIGNATURE-----

--R92lf0Oi2sxyK3LA--
