Received: from mailapp01.imgtec.com ([195.59.15.196]:40763 "EHLO
        imgpgp01.kl.imgtec.org" rhost-flags-OK-OK-OK-FAIL)
        by eddie.linux-mips.org with ESMTP id S23992517AbdEaPlRGxq8n (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 31 May 2017 17:41:17 +0200
Date: Wed, 31 May 2017 16:41:11 +0100
From: James Hogan <james.hogan@imgtec.com>
Subject: Re: [PATCH] MIPS: Sort MIPS Kconfig Alphabetically.
Message-ID: <20170531154110.GA15577@jhogan-linux.le.imgtec.org>
References: <1494841595-8954-1-git-send-email-matt.redfearn@imgtec.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="pf9I7BMVVzbSWLtt"
Content-Disposition: inline
In-Reply-To: <1494841595-8954-1-git-send-email-matt.redfearn@imgtec.com>
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
Message-ID: <20170531154111.rMzAoIegH9EZWKf-0BfNUxnN2LqqY10D0Xjpq3lM3EY@z>

--pf9I7BMVVzbSWLtt
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Mon, May 15, 2017 at 10:46:35AM +0100, Matt Redfearn wrote:
> +	select HAVE_SYSCALL_TRACEPOINTS
> +	select HAVE_SYSCALL_TRACEPOINTS

Maybe we could remove duplicates while we're at it?

Cheers
James

--pf9I7BMVVzbSWLtt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEd80NauSabkiESfLYbAtpk944dnoFAlku5BMACgkQbAtpk944
dnqz8w/7BZXpJYZduSe7RbaVhk9/cJy/QKOK2sJ19Y8KktzrGF2vpTVYPkG0eF/y
LgwbMJMCO9GLNlgPtyvKLGtRalqVHwJHgU5HykFmQ2Im08jl0D4FNXhH8BD3Jnp0
18d9HOhhyBBCCZ1b0EiTUwwhnp8fRpf7Zol0ZsgreVJpeyjd6gzaLpIiX+0yJmDw
dWaPlnP3NxP/TXaaPvdEEHz2UWW1jNGsggLjfDvldh5G3MR7BVbxrnTL83xx6pSN
dSceOfMC6U5lhVuOhMz+kzR1HdIbERHLmct3qwN3Gx8Vyd5FeNElWzh2T6GkqfN6
VRFNWIxR2RsYW7yHxCUUatFX1Le7SIaPLUvxGDBw3S2uZuhiHCqHf2vk4+jj8/BZ
rnz2Hi1tQGuzFEToMAZLOgkX+PZRUpik01EjlB/VwYL7/+9gAnNQV7ufyIDraQw0
En27rOpZPZwxPQAm9NmdvFjDwhP/NM+b2IhBxt1OMiP5c1TqwwOryDI9mfuFfeZ0
4j4vFz3lVQ2gzAg/ZIfBHDoLFENB8S0xsKBGX+Hwg4zKYUS2uqpJLnHhpg2bH6iz
w6DPF2UMD+oFkmv8tGRDQgOxcbGe32CVFl34Hy621FaEAvRXBDV6LRgPi3YZVo4s
1dNdItCoaM0Ciii0b2Yh/Qmd7jhJHM1zWAySTNftumTdGuzVSCo=
=qAbn
-----END PGP SIGNATURE-----

--pf9I7BMVVzbSWLtt--
