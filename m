Received: from 19pmail.ess.barracuda.com ([64.235.154.231]:58613 "EHLO
        19pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23992143AbdKGQMCii2ly (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 7 Nov 2017 17:12:02 +0100
Date: Tue, 7 Nov 2017 16:11:57 +0000
From: James Hogan <james.hogan@mips.com>
Subject: Re: [PATCH v2 05/12] MIPS: Octeon: Header and file cleaning.
Message-ID: <20171107161157.GI15260@jhogan-linux>
References: <1506620053-2557-1-git-send-email-steven.hill@cavium.com>
 <1506620053-2557-6-git-send-email-steven.hill@cavium.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="Uu2n37VG4rOBDVuR"
Content-Disposition: inline
In-Reply-To: <1506620053-2557-6-git-send-email-steven.hill@cavium.com>
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
To: "Steven J. Hill" <steven.hill@cavium.com>
Cc: linux-mips@linux-mips.org, ralf@linux-mips.org
Message-ID: <20171107161157.KXT-fPF10vJhbpuL3m9Yq-ay03B1QGu4iLtBFLSCYqM@z>

--Uu2n37VG4rOBDVuR
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Steven,

On Thu, Sep 28, 2017 at 12:34:06PM -0500, Steven J. Hill wrote:
> From: "Steven J. Hill" <Steven.Hill@cavium.com>
>=20
> In preparation for new hotplug CPU, some housekeeping:
>=20
> * Clean-up header file dependencies, specifically move inclusion
>   of some headers to only the files that need them.
> * Remove usage of arch/mips/cavium-octeon/octeon_boot.h
> * Clean-ups from checkpatch in arch/mips/cavium-octeon/setup.c
> * Add defining of NR_IRQS_LEGACY for completeness.
> * Move CVMX_TMP_STR macros from top level to cvmx-asm.h
> * Update some copyright dates.
> * Add some missing register include files to top level.
>=20
> Signed-off-by: Steven J. Hill <steven.hill@cavium.com>
> Acked-by: David Daney <david.daney@cavium.com>

This causes a whole pile of build errors. First this, the include of
which is visible in the context of your patch:

arch/mips/cavium-octeon/smp.c:25:25: fatal error: octeon_boot.h: No such fi=
le or directory
 #include "octeon_boot.h"
                         ^

and removing that include, all these too:

arch/mips/cavium-octeon/smp.c: In function =E2=80=98octeon_smp_hotplug_setu=
p=E2=80=99:
arch/mips/cavium-octeon/smp.c:121:85: error: =E2=80=98LABI_ADDR_IN_BOOTLOAD=
ER=E2=80=99 undeclared (first use in this function)
  labi =3D (struct linux_app_boot_info *)PHYS_TO_XKSEG_CACHED(LABI_ADDR_IN_=
BOOTLOADER);
                                                                           =
          ^
arch/mips/cavium-octeon/smp.c:121:85: note: each undeclared identifier is r=
eported only once for each function it appears in
arch/mips/cavium-octeon/smp.c:122:10: error: dereferencing pointer to incom=
plete type
  if (labi->labi_signature !=3D LABI_SIGNATURE) {
          ^
arch/mips/cavium-octeon/smp.c:122:30: error: =E2=80=98LABI_SIGNATURE=E2=80=
=99 undeclared (first use in this function)
  if (labi->labi_signature !=3D LABI_SIGNATURE) {
                              ^
arch/mips/cavium-octeon/smp.c:127:37: error: dereferencing pointer to incom=
plete type
  octeon_bootloader_entry_addr =3D labi->InitTLBStart_addr;
                                     ^
arch/mips/cavium-octeon/smp.c: In function =E2=80=98octeon_smp_setup=E2=80=
=99:
arch/mips/cavium-octeon/smp.c:136:9: error: implicit declaration of functio=
n =E2=80=98cvmx_sysinfo_get=E2=80=99 [-Werror=3Dimplicit-function-declarati=
on]
  struct cvmx_sysinfo *sysinfo =3D cvmx_sysinfo_get();
         ^
arch/mips/cavium-octeon/smp.c:136:33: error: initialization makes pointer f=
rom integer without a cast [-Werror]
  struct cvmx_sysinfo *sysinfo =3D cvmx_sysinfo_get();
                                 ^
arch/mips/cavium-octeon/smp.c:155:3: error: implicit declaration of functio=
n =E2=80=98cvmx_coremask_is_core_set=E2=80=99 [-Werror=3Dimplicit-function-=
declaration]
   if ((id !=3D coreid) && cvmx_coremask_is_core_set(&sysinfo->core_mask, i=
d)) {
   ^
arch/mips/cavium-octeon/smp.c:155:59: error: dereferencing pointer to incom=
plete type
   if ((id !=3D coreid) && cvmx_coremask_is_core_set(&sysinfo->core_mask, i=
d)) {
                                                           ^
arch/mips/cavium-octeon/smp.c: In function =E2=80=98plat_post_relocation=E2=
=80=99:
arch/mips/cavium-octeon/smp.c:188:39: error: =E2=80=98kernel_entry=E2=80=99=
 undeclared (first use in this function)
  unsigned long entry =3D (unsigned long)kernel_entry;
                                       ^
arch/mips/cavium-octeon/smp.c: In function =E2=80=98octeon_cpu_die=E2=80=99:
arch/mips/cavium-octeon/smp.c:317:45: error: =E2=80=98LINUX_APP_BOOT_BLOCK_=
NAME=E2=80=99 undeclared (first use in this function)
  block_desc =3D cvmx_bootmem_find_named_block(LINUX_APP_BOOT_BLOCK_NAME);
                                             ^
arch/mips/cavium-octeon/smp.c:322:86: error: =E2=80=98LABI_ADDR_IN_BOOTLOAD=
ER=E2=80=99 undeclared (first use in this function)
   labi =3D (struct linux_app_boot_info *)PHYS_TO_XKSEG_CACHED(LABI_ADDR_IN=
_BOOTLOADER);
                                                                           =
           ^
arch/mips/cavium-octeon/smp.c:324:7: error: dereferencing pointer to incomp=
lete type
   labi->avail_coremask |=3D mask;
       ^
arch/mips/cavium-octeon/smp.c:325:18: error: dereferencing pointer to incom=
plete type
   new_mask =3D labi->avail_coremask;
                  ^
arch/mips/cavium-octeon/smp.c:327:99: error: =E2=80=98AVAIL_COREMASK_OFFSET=
_IN_LINUX_APP_BOOT_BLOCK=E2=80=99 undeclared (first use in this function)
   uint32_t *p =3D (uint32_t *)PHYS_TO_XKSEG_CACHED(block_desc->base_addr +
                                                                           =
                        ^
arch/mips/cavium-octeon/smp.c: In function =E2=80=98start_after_reset=E2=80=
=99:
arch/mips/cavium-octeon/smp.c:355:2: error: implicit declaration of functio=
n =E2=80=98kernel_entry=E2=80=99 [-Werror=3Dimplicit-function-declaration]
  kernel_entry(0, 0, 0); /* set a2 =3D 0 for secondary core */
  ^
arch/mips/cavium-octeon/smp.c: In function =E2=80=98octeon_update_boot_vect=
or=E2=80=99:
arch/mips/cavium-octeon/smp.c:365:76: error: =E2=80=98BOOTLOADER_BOOT_VECTO=
R=E2=80=99 undeclared (first use in this function)
   (struct boot_init_vector *)PHYS_TO_XKSEG_CACHED(BOOTLOADER_BOOT_VECTOR);
                                                                           =
 ^
arch/mips/cavium-octeon/smp.c:367:45: error: =E2=80=98LINUX_APP_BOOT_BLOCK_=
NAME=E2=80=99 undeclared (first use in this function)
  block_desc =3D cvmx_bootmem_find_named_block(LINUX_APP_BOOT_BLOCK_NAME);
                                             ^
arch/mips/cavium-octeon/smp.c:372:86: error: =E2=80=98LABI_ADDR_IN_BOOTLOAD=
ER=E2=80=99 undeclared (first use in this function)
   labi =3D (struct linux_app_boot_info *)PHYS_TO_XKSEG_CACHED(LABI_ADDR_IN=
_BOOTLOADER);
                                                                           =
           ^
arch/mips/cavium-octeon/smp.c:374:24: error: dereferencing pointer to incom=
plete type
   avail_coremask =3D labi->avail_coremask;
                        ^
arch/mips/cavium-octeon/smp.c:375:7: error: dereferencing pointer to incomp=
lete type
   labi->avail_coremask &=3D ~(1 << coreid);
       ^
arch/mips/cavium-octeon/smp.c:377:103: error: =E2=80=98AVAIL_COREMASK_OFFSE=
T_IN_LINUX_APP_BOOT_BLOCK=E2=80=99 undeclared (first use in this function)
   avail_coremask =3D *(uint32_t *)PHYS_TO_XKSEG_CACHED(
                                                                           =
                            ^
arch/mips/cavium-octeon/smp.c:387:2: error: invalid use of undefined type =
=E2=80=98struct boot_init_vector=E2=80=99
  boot_vect[coreid].app_start_func_addr =3D
  ^
arch/mips/cavium-octeon/smp.c:387:11: error: dereferencing pointer to incom=
plete type
  boot_vect[coreid].app_start_func_addr =3D
           ^
arch/mips/cavium-octeon/smp.c:389:2: error: invalid use of undefined type =
=E2=80=98struct boot_init_vector=E2=80=99
  boot_vect[coreid].code_addr =3D octeon_bootloader_entry_addr;
  ^
arch/mips/cavium-octeon/smp.c:389:11: error: dereferencing pointer to incom=
plete type
  boot_vect[coreid].code_addr =3D octeon_bootloader_entry_addr;
           ^

Cheers
James

--Uu2n37VG4rOBDVuR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEd80NauSabkiESfLYbAtpk944dnoFAloB200ACgkQbAtpk944
dnr+Kg//Q3n1FGV3+O9qDFO0pZlJacFb3HoVTYUTd/C601hwAPYLe+K7TmgYsIio
gcAA1BdtMUIEBc1EnLEn84Fq7BAJHFizmzDbdlOxIwTdFHKqmRhHboCSKMmxxUqX
DdQfnknAvSiolSNthSzbMnz+kSsOH4M2omBhOz1b7sS8jINuWs/A5g/4TxbT9NNP
At7EvIKpR1kRt4k5Y5Aw4/lJbk6tHc1X1LCYw4Z3BDkmLWsIvjlheV49mPVuH5u8
kxycNK/skBneB7dfa4ShL50QMEr4vc/sBjt7rpS8ObxMAS6m45Xbw3UR3zepzqRC
s7a+D7FdzROj2pUyUZVeej7Hv8ZSuYJ8Cp8+8zXYJvrhEaNDUZTQLZHolHYLN6xF
mnPn46wjs6xkkhLLtVRlKZrXulb0KBR8WYLXhz/CepO/82CjPIMrvKu7kgnysWy8
HEDDdnVYNxmZmoCcPgKcfskoO3/Weq9NEiaEu6PuP6mcWJcwS+uQ+NWFJxpUzHU7
aTxDVve2Av+tmZG3tYqeDUu/6YrXTrM5ADls/jjKT4PoAxgwanpHlk/of0D5foS1
xxzDVdaVC6whB9b/PlY2MN0dZNyAL+pXHQjAaDVcXHXAKQG1wTjH5R75wp+vuDvN
mjWdbxTbKX8aXBKIx2YSaXxxvI4frsjKQSR0cA234KcpTOZSSEI=
=9kDG
-----END PGP SIGNATURE-----

--Uu2n37VG4rOBDVuR--
