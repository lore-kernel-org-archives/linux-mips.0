Received: from mailapp01.imgtec.com ([195.59.15.196]:7821 "EHLO
        imgpgp01.kl.imgtec.org" rhost-flags-OK-OK-OK-FAIL)
        by eddie.linux-mips.org with ESMTP id S27009001AbbGMJgZURbRr (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 13 Jul 2015 11:36:25 +0200
Message-ID: <55A38698.8080206@imgtec.com>
Date: Mon, 13 Jul 2015 10:36:24 +0100
From: James Hogan <james.hogan@imgtec.com>
MIME-Version: 1.0
Subject: Re: [PATCH 6/9] MIPS: Remove "weak" from get_c0_compare_int() declaration
References: <20150712230402.11177.11848.stgit@bhelgaas-glaptop2.roam.corp.google.com> <20150712231137.11177.3681.stgit@bhelgaas-glaptop2.roam.corp.google.com>
In-Reply-To: <20150712231137.11177.3681.stgit@bhelgaas-glaptop2.roam.corp.google.com>
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature";
        boundary="oN4xv1gqQhfe5uwwRV1wgTLtIbickEWJS"
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
To: Bjorn Helgaas <bhelgaas@google.com>, Ralf Baechle <ralf@linux-mips.org>
Cc: Andrew Bresticker <abrestic@chromium.org>, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org
Message-ID: <20150713093624.AUD49oZZey_tfupkMyIBKct2ug-p-7QU4VaW3JaCAF0@z>

--oN4xv1gqQhfe5uwwRV1wgTLtIbickEWJS
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 13/07/15 00:11, Bjorn Helgaas wrote:
> Weak header file declarations are error-prone because they make every
> definition weak, and the linker chooses one based on link order (see
> 10629d711ed7 ("PCI: Remove __weak annotation from pcibios_get_phb_of_no=
de
> decl")).
>=20
> get_c0_compare_int() is defined in several files.  Each definition is w=
eak,
> so I assume Kconfig prevents two or more from being included.  The call=
er
> contains default code used when get_c0_compare_int() isn't defined at a=
ll.
>=20
> Add a weak get_c0_compare_int() definition with the default code and re=
move
> the weak annotation from the declaration.
>=20
> Then the platform implementations will be strong and will override the =
weak
> default.  If multiple platforms are ever configured in, we'll get a lin=
k
> error instead of calling a random platform's implementation.
>=20
> Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>

Reviewed-by: James Hogan <james.hogan@imgtec.com>

Cheers
James

> ---
>  arch/mips/include/asm/time.h |    2 +-
>  arch/mips/kernel/cevt-r4k.c  |   11 +++++++----
>  2 files changed, 8 insertions(+), 5 deletions(-)
>=20
> diff --git a/arch/mips/include/asm/time.h b/arch/mips/include/asm/time.=
h
> index ce6a7d5..44a9c3a 100644
> --- a/arch/mips/include/asm/time.h
> +++ b/arch/mips/include/asm/time.h
> @@ -51,7 +51,7 @@ extern int get_c0_perfcount_int(void);
>  /*
>   * Initialize the calling CPU's compare interrupt as clockevent device=

>   */
> -extern unsigned int __weak get_c0_compare_int(void);
> +extern unsigned int get_c0_compare_int(void);
>  extern int r4k_clockevent_init(void);
> =20
>  static inline int mips_clockevent_init(void)
> diff --git a/arch/mips/kernel/cevt-r4k.c b/arch/mips/kernel/cevt-r4k.c
> index d70c4d8..cc7cc46 100644
> --- a/arch/mips/kernel/cevt-r4k.c
> +++ b/arch/mips/kernel/cevt-r4k.c
> @@ -174,6 +174,11 @@ int c0_compare_int_usable(void)
>  	return 1;
>  }
> =20
> +unsigned int __weak get_c0_compare_int(void)
> +{
> +	return MIPS_CPU_IRQ_BASE + cp0_compare_irq;
> +}
> +
>  int r4k_clockevent_init(void)
>  {
>  	unsigned int cpu =3D smp_processor_id();
> @@ -189,11 +194,9 @@ int r4k_clockevent_init(void)
>  	/*
>  	 * With vectored interrupts things are getting platform specific.
>  	 * get_c0_compare_int is a hook to allow a platform to return the
> -	 * interrupt number of it's liking.
> +	 * interrupt number of its liking.
>  	 */
> -	irq =3D MIPS_CPU_IRQ_BASE + cp0_compare_irq;
> -	if (get_c0_compare_int)
> -		irq =3D get_c0_compare_int();
> +	irq =3D get_c0_compare_int();
> =20
>  	cd =3D &per_cpu(mips_clockevent_device, cpu);
> =20
>=20


--oN4xv1gqQhfe5uwwRV1wgTLtIbickEWJS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJVo4aYAAoJEGwLaZPeOHZ6yfcP/2YYpfXNrKG3EXtwcE+v0cyv
7F0PM6BZPQsO+Tk5YvH7Lca0j9FnGUsqNSrMbTD6rw1LJh6Fd9VzPNDKap3jwcXW
Hh7TTkiFwJ5YHyH3zRAsP7ABfNKD7SM6vQiTOluSzza1fX/BtmiFbw6uLLtaufrd
WC2TED0X6Pr0FiuDrCnzSFo9CjohxGmXAmrroZ48O/X7tnWeSVdjGQyozqaiS1R0
hPBhSuZokrA+YHH1tvsjZ431zlx/R7Ax3TFc/L6HAidBqZRffDCObao64L/VtQSX
ApE2aOzXWTkSd3WujRpVngzVMtkMIseaMMvDmXq2SFEfZhw0Jlm7fxg2CzSJ2/+F
RLhJXY/wMpp48Bl1FHBwHDTGiBZi4brqNm2sUvNCbh90PLWo97GbjortBNRP1bwI
Io35xoPKaWSxAw6t45BOJ5O6dUTg7B8VsACCDQUoLVwtxcHoq4t9u37MxUuUcEKE
Cx0CoP8CZ3v8bVP0xouVh5AOxzRrJHLLwon7hxpHTazAHRlTs7jJOOVHt1mtGnvk
01EJbgxNR2Q2i6QmohHaO8X+q555DORlJRIWG3FkFIfJXFwrryb9OaidRuBzHahq
eNTM6wGfurRIsFIc6p/hMVxqzYlH4IOTsxAOljY8u6IHoKiXGty771iXtIrIvLgO
zu45GkZYo6wNBupOwQkh
=S2aC
-----END PGP SIGNATURE-----

--oN4xv1gqQhfe5uwwRV1wgTLtIbickEWJS--
