Received: from 9pmail.ess.barracuda.com ([64.235.154.211]:45653 "EHLO
        9pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23992105AbeABJwbx5yvu (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 2 Jan 2018 10:52:31 +0100
Date: Tue, 2 Jan 2018 09:51:26 +0000
From: James Hogan <james.hogan@mips.com>
Subject: Re: [PATCH 1/2] MIPS: add declaration for function
 `memory_region_available`
Message-ID: <20180102095125.GO27409@jhogan-linux.mipstec.com>
References: <20171226113717.15074-1-malat@debian.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="b/Q3JWIUAuLE0ZFy"
Content-Disposition: inline
In-Reply-To: <20171226113717.15074-1-malat@debian.org>
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
Cc: Ralf Baechle <ralf@linux-mips.org>, Marcin Nowakowski <marcin.nowakowski@mips.com>, David Daney <david.daney@cavium.com>, Goran Ferenc <goran.ferenc@imgtec.com>, Miodrag Dinic <miodrag.dinic@mips.com>, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org
Message-ID: <20180102095126.F5YwMl4OWKPsPhODpyRAuuScZAFWq01xJyIMekUv2zg@z>

--b/Q3JWIUAuLE0ZFy
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 26, 2017 at 12:37:13PM +0100, Mathieu Malaterre wrote:
> Fix non-fatal warning:
>=20
> arch/mips/kernel/setup.c:158:13: warning: no previous prototype for =E2=
=80=98memory_region_available=E2=80=99 [-Wmissing-prototypes]
>  bool __init memory_region_available(phys_addr_t start, phys_addr_t size)
>              ^~~~~~~~~~~~~~~~~~~~~~~

It only seems to be referenced from that one file, so making it static
and __maybe_unused to handle the configs it isn't used would probably be
better.

Thanks
James

>=20
> Signed-off-by: Mathieu Malaterre <malat@debian.org>
> ---
>  arch/mips/include/asm/bootinfo.h | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/arch/mips/include/asm/bootinfo.h b/arch/mips/include/asm/boo=
tinfo.h
> index e26a093bb17a..32e3c9a2c5a0 100644
> --- a/arch/mips/include/asm/bootinfo.h
> +++ b/arch/mips/include/asm/bootinfo.h
> @@ -108,6 +108,7 @@ extern struct boot_mem_map boot_mem_map;
> =20
>  extern void add_memory_region(phys_addr_t start, phys_addr_t size, long =
type);
>  extern void detect_memory_region(phys_addr_t start, phys_addr_t sz_min, =
 phys_addr_t sz_max);
> +extern bool memory_region_available(phys_addr_t start, phys_addr_t size);
> =20
>  extern void prom_init(void);
>  extern void prom_free_prom_memory(void);
> --=20
> 2.11.0
>=20
>=20

--b/Q3JWIUAuLE0ZFy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEd80NauSabkiESfLYbAtpk944dnoFAlpLVh0ACgkQbAtpk944
dnrWyg/9F0b1Yp4MQ5jkWeYgbvTy9qKLOyGwUnN7GyKT7eabDd1KOhNYfgwJupbk
t8wO0Q/u3iuuSzaBh2oyMcoKMaucmmpN80iTx9OflmQNrfF+ho2ds8gOJUu71RFL
IwNzwNszA7TS0fk1ua5GHvAfgDEVyPTQ6oQnYU9AdhLGP7J5cm0eEs5ghfiaKxKN
9RWMXmY6rJ2QMCeDszESJtlv5kIWUyR0GQsrbJbAppG9Y5ScUi06fqy+43GSEJ96
ucGRazzcgVyKwNlMqpG/kv0bUTe1rpMrW51AyrC6D9o6vcMntziT1GQ3sdN9ztEo
FjUS1FFQ/X2//Q/XAZ+aZrgfE0ocxAdckANnXQpRMK2c60bb3+daQj1uzYCcFSF4
ASf2BC8H9XDgI/fHchpNI7RkzDgm3Flrv9XVlU/51xkzk82GQeGxdx50I9yoChAB
ZJG/NMNt37l+nuOqHiFkh6rXnONEKhTWvaMmGy4g+gwN3FqbXOaZJhLSnsamW1PY
+R3rMDbp1OHQL3Qzn3tV+ZF8iU8Mi9ilkpe1OIZbrMVaty2smR5gUKq8iFvJI0MG
CZucwH/+npI7OZhaYJSsOEP//ZfRglGlD39oadO5nyPrpT6l1XYOoMgws28/YTIt
00JKu+JgDU1xSCpmincgCH2qnOnkrw7FnEavwittGRDUphzz790=
=gcKV
-----END PGP SIGNATURE-----

--b/Q3JWIUAuLE0ZFy--
