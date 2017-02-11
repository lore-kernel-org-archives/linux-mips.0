Received: from mailapp01.imgtec.com ([195.59.15.196]:45733 "EHLO
        imgpgp01.kl.imgtec.org" rhost-flags-OK-OK-OK-FAIL)
        by eddie.linux-mips.org with ESMTP id S23992213AbdBKWTYnwMI6 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Sat, 11 Feb 2017 23:19:24 +0100
Date: Sat, 11 Feb 2017 22:19:18 +0000
From: James Hogan <james.hogan@imgtec.com>
Subject: Re: [PATCH] MIPS: sync-r4k: Fix KERN_CONT fallout
Message-ID: <20170211221918.GH24226@jhogan-linux.le.imgtec.org>
References: <1486041724-19524-1-git-send-email-matt.redfearn@imgtec.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="EemXnrF2ob+xzFeB"
Content-Disposition: inline
In-Reply-To: <1486041724-19524-1-git-send-email-matt.redfearn@imgtec.com>
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
To: Matt Redfearn <matt.redfearn@imgtec.com>
Cc: Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org
Message-ID: <20170211221918.vtkqHBNyGrYkF29RhTayAHfae-BJ56hXu43LEcbRgEw@z>

--EemXnrF2ob+xzFeB
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 02, 2017 at 01:22:04PM +0000, Matt Redfearn wrote:
> Since commit 4bcc595ccd80 ("printk: reinstate KERN_CONT for printing
> continuation lines") the output of counter synchornisation has been
> split across lines:
> [ 0.665181] Synchronize counters for CPU 1:
> [ 0.678578] done.
>=20
> Fix this by using pr_cont, and replace printk with pr_info.
>=20
> Signed-off-by: Matt Redfearn <matt.redfearn@imgtec.com>

Applied

Thanks
James

> ---
>=20
>  arch/mips/kernel/sync-r4k.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/arch/mips/kernel/sync-r4k.c b/arch/mips/kernel/sync-r4k.c
> index 4472a7f98577..1df1160b6a47 100644
> --- a/arch/mips/kernel/sync-r4k.c
> +++ b/arch/mips/kernel/sync-r4k.c
> @@ -29,7 +29,7 @@ void synchronise_count_master(int cpu)
>  	int i;
>  	unsigned long flags;
> =20
> -	printk(KERN_INFO "Synchronize counters for CPU %u: ", cpu);
> +	pr_info("Synchronize counters for CPU %u: ", cpu);
> =20
>  	local_irq_save(flags);
> =20
> @@ -83,7 +83,7 @@ void synchronise_count_master(int cpu)
>  	 * count registers were almost certainly out of sync
>  	 * so no point in alarming people
>  	 */
> -	printk("done.\n");
> +	pr_cont("done.\n");
>  }
> =20
>  void synchronise_count_slave(int cpu)
> --=20
> 2.7.4
>=20
>=20

--EemXnrF2ob+xzFeB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYn43mAAoJEGwLaZPeOHZ6EugQAJUhwCavUWGqQ4H/GNmO3zr7
BDwTXmCrSgRAjnmfZCPKlBAIWjQ5tpc8ZzRhn+w3guz3O78IaAjRbPkC7vXsEDcS
3/1znac+gI+rGVVOUq1yOKUzyjU/IAHBnr14jaNhZVqgh8y+zN6PlAeHzRyXX8kw
RhXr4Xe+ZSyd5rzT0LTn0vhWp1MVDMaWPgSS60dQjqxbpDBqPSF0xDmh5yPgGgWg
kZNvUsrWrcwUBqBm17CvP+IUCfiTijPgZDauFLopibEKKA0a8bOopltAPVCQPwYY
roGmuRW/LUOwKtCSdAcHjLfWTQT40vs8R6AoQQOVMbnQy0jBcrN7exeWA6adH5MY
musAVHKdCxFFesIlDjJdAxOKa4dGtL2ZmjRGkS3Px+zSCztxa6J+WbcjpBb9sMJ3
3PY/WE8fxxFeT76ui7Blk5YRsQQCgY+yp3qgy/CbM1MzImAUXSaAicGb/ARC9bnz
sMNmpjY/vC3SRhaiITqqeS8o4dHJ3Q0kOgq7NESrkJKnUy8wGDQeQqeG5DHzlbt+
5zNYZy7Duu8n426tP19t90iT3a00MjkW+ox2yrajzGu0FVr/M0K9XrsStjX0oNpS
zsQkdk9F8s07o5AqWNyVZZ+mnWqDI6+WFD1X/hsG9qifVJQ7az1aRdwbP2EzVRML
JVE0u/Pgo73qauRy/F/t
=x/mw
-----END PGP SIGNATURE-----

--EemXnrF2ob+xzFeB--
