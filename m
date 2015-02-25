Received: from mailapp01.imgtec.com ([195.59.15.196]:55111 "EHLO
        imgpgp01.kl.imgtec.org" rhost-flags-OK-OK-OK-FAIL)
        by eddie.linux-mips.org with ESMTP id S27007076AbbBYLCofsDXS (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 25 Feb 2015 12:02:44 +0100
Message-ID: <54EDABCE.5070004@imgtec.com>
Date: Wed, 25 Feb 2015 11:02:38 +0000
From: James Hogan <james.hogan@imgtec.com>
MIME-Version: 1.0
Subject: Re: [PATCH v2 0/3] Add MIPS CDMM bus support
References: <1422877510-29247-1-git-send-email-james.hogan@imgtec.com>
In-Reply-To: <1422877510-29247-1-git-send-email-james.hogan@imgtec.com>
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature";
        boundary="milb73IVam162qev8IWooGKIWNNkapQH0"
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
To: linux-kernel@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org
Message-ID: <20150225110238.s2wU1UYjE74xodpELWRnD6SMtnDago97TVbDReNet_8@z>

--milb73IVam162qev8IWooGKIWNNkapQH0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

Hi,

On 02/02/15 11:45, James Hogan wrote:
> This patchset adds basic support for the MIPS Common Device Memory Map
> Memory (CDMM) region in the form of a bus in the standard Linux device
> model.

It'd be great to get these patches upstream for v4.1 via the MIPS tree
along with my other two related patchsets (MIPS: Allow shared IRQ for
timer & perf counter, and Add MIPS EJTAG Fast Debug Channel TTY driver).

Greg: Since this is a new bus I suspect I need your Ack/Review first?

Btw, more info about CDMM can be found here:
http://www.linux-mips.org/wiki/CDMM

And a git branch containing the latest version of all 3 patchsets
(basically just rebased on v4.0-rc1 to resolve conflicts) can be found
here:
git://git.kernel.org/pub/scm/linux/kernel/git/jhogan/mips.git fdc

Thanks
James

>=20
> Since the CDMM region is a feature of the MIPS architecture (since
> around MIPSr2) the first patch adds the necessary definitions and
> probing to arch/mips.
>=20
> The second patch adds the actual bus driver (see that patch for lots
> more info).=20
>=20
> The final patch just enables CDMM to work on Malta.
>=20
> Futher patches will follow soon to add TTY/Console/KGDB support for the=

> EJTAG Fast Debug Channel (FDC) device which is found in the CDMM region=
=2E
>=20
> Changes in v2:
> - Fix typo in definition of MIPS_CPU_CDMM, s/0ll/ull (Maciej).
> - Fix some checkpatch errors.
> - Correct CDMM name in various places. It is "Common Device Memory Map"=
,
>   rather than "Common Device Mapped Memory" (which for some reason had
>   got stuck in my head).
>=20
> Cc: Ralf Baechle <ralf@linux-mips.org>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: linux-mips@linux-mips.org
>=20
> James Hogan (3):
>   MIPS: Add arch CDMM definitions and probing
>   MIPS: Add CDMM bus support
>   MIPS: Malta: Implement mips_cdmm_phys_base()
>=20
>  arch/mips/include/asm/cdmm.h         |  87 +++++
>  arch/mips/include/asm/cpu-features.h |   4 +
>  arch/mips/include/asm/cpu.h          |   1 +
>  arch/mips/include/asm/mipsregs.h     |  11 +
>  arch/mips/kernel/cpu-probe.c         |   2 +
>  arch/mips/mti-malta/malta-memory.c   |   7 +
>  drivers/bus/Kconfig                  |  13 +
>  drivers/bus/Makefile                 |   1 +
>  drivers/bus/mips_cdmm.c              | 711 +++++++++++++++++++++++++++=
++++++++
>  include/linux/mod_devicetable.h      |   8 +
>  scripts/mod/devicetable-offsets.c    |   3 +
>  scripts/mod/file2alias.c             |  16 +
>  12 files changed, 864 insertions(+)
>  create mode 100644 arch/mips/include/asm/cdmm.h
>  create mode 100644 drivers/bus/mips_cdmm.c
>=20


--milb73IVam162qev8IWooGKIWNNkapQH0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJU7avOAAoJEGwLaZPeOHZ6qfsQAIxPTFdmoiT8WnPVmk/TfXR/
BRhwKYV7xUJempmzfIAVwrjoHYfvBu59XEDz461o4aig6SI9yBD9sQw5Uti9V31t
D1SxH3PZGAV+rnHDMhPIXeIakp6/zwKXl+Sx25y9V1bg5Iak7F6fK0hqGD0wTR3D
cIOBcMArDcZdcKKKEa2mgrSv6IHkOjuh/24DjSS8G9kkYNQ4n29cB1UWOBJR8MYw
jSyU9VjXCgDF3t2yzmKDx2sv3hspcAi5xAuEYHScsZHupYIrgKDRm9aLf01fWgfj
ulYK8tvZaNAxqiwtmoGKdnmQ0w6YlgOgL7LPIaDrbsAB7KTJwkv6tT1SE5JvXlh3
M8SeGKcPlYff+zwU8gYGJxYzPFyjY7KhvpfadMdRqHOcXqB+ONfEg74cQP2TcDwO
PjyZ95AfNiHEcsMC0Tl9X168dZdnvcNeRCSzjhKe8dg918wkeV5hgnin092Ytz05
1vkOTntFiJR8qk81iSmkPEDXzDipy4DeLq35zQd9bj0nk74Gq66i5uiQwo9yJOZV
nyQ3hNSem9IaZiaBUY2j8FQgZ45JkcUxQYSbQtWlw7g3Q5YPGT7alBes3JZOqZKG
S9T1mS2blSk8SVmdi1HDUXblyH0yd5S4FpKaC8LU0nSyXoOqyJN8dpo188yKRy1s
h2a7JrQY6pVRQL/ilxr2
=hbu2
-----END PGP SIGNATURE-----

--milb73IVam162qev8IWooGKIWNNkapQH0--
