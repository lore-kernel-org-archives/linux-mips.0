Received: from mailapp01.imgtec.com ([195.59.15.196]:52315 "EHLO
        imgpgp01.kl.imgtec.org" rhost-flags-OK-OK-OK-FAIL)
        by eddie.linux-mips.org with ESMTP id S23993875AbdBMWTwzhb1k (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 13 Feb 2017 23:19:52 +0100
Date: Mon, 13 Feb 2017 22:19:45 +0000
From: James Hogan <james.hogan@imgtec.com>
Subject: Re: [PATCH v2] MIPS: Allow compressed images to be loaded at any
 address
Message-ID: <20170213221945.GM24226@jhogan-linux.le.imgtec.org>
References: <1487018290-10451-1-git-send-email-albeu@free.fr>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="UUMz/kfoogzZ9WLZ"
Content-Disposition: inline
In-Reply-To: <1487018290-10451-1-git-send-email-albeu@free.fr>
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
To: Alban <albeu@free.fr>
Cc: linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>, Jonas Gorski <jogo@openwrt.org>, linux-kernel@vger.kernel.org, Matt Redfearn <Matt.Redfearn@imgtec.com>
Message-ID: <20170213221945.ytGrWAK7iG0QgmD0HvB70WCX0WMIQFoGrW3IOV-2HXw@z>

--UUMz/kfoogzZ9WLZ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Alban,

On Mon, Feb 13, 2017 at 09:38:08PM +0100, Alban wrote:
> From: Alban Bedel <albeu@free.fr>
>=20
> Compressed images (vmlinuz.bin) have to be loaded at a specific
> address that differ from the address normaly used for vmlinux.bin.
> This is because the decompressor just write its output at the address
> vmlinux.bin should be loaded at, and it shouldn't overwrite itself.
> This limitation mean that the bootloader must be configured differently
> when loading a vmlinux.bin or a vmlinuz.bin image, this is annoying
> and a source of error.
>=20
> To workaround this we extend the compressed loader to cope with being
> loaded at (nearly) any address. During the early init a jump is used
> to compute the offset between the current address and the linked
> address, if they differ the whole image is first copied to the linked
> address before proceeding.
>=20
> Some load address won't work, for example if there is an overlap with
> the range where vmlinuz.bin should be loaded. However for the typical
> case of using the vmlinux.bin address that won't be the case.
>=20
> Signed-off-by: Alban Bedel <albeu@free.fr>
> Suggested-by: Jonas Gorski <jonas.gorski@gmail.com>
> ---
> Changelog:
> v2: * Rework the code as suggested by Jonas Gorski to autodetect the
>       load address and remove the need for a Kconfig option.
> ---
>  arch/mips/boot/compressed/head.S | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
>=20
> diff --git a/arch/mips/boot/compressed/head.S b/arch/mips/boot/compressed=
/head.S
> index 409cb48..3c25a96 100644
> --- a/arch/mips/boot/compressed/head.S
> +++ b/arch/mips/boot/compressed/head.S
> @@ -25,6 +25,29 @@ start:
>  	move	s2, a2
>  	move	s3, a3
> =20
> +	/* Get the offset between the current address and linked address */
> +	PTR_LA	t0, reloc_label
> +	bal	reloc_label
> +	 nop
> +reloc_label:
> +	subu	t0, ra, t0
> +
> +	/* If there is no offset no reloc is needed */
> +	beqz	t0, clear_bss
> +	 nop
> +
> +	/* Move the text, data section and DTB to the correct address */
> +	PTR_LA	a0, .text
> +	addu	a1, t0, a0
> +	PTR_LA	a2, _edata
> +copy_vmlinuz:
> +	lw	a3, 0(a1)
> +	sw	a3, 0(a0)
> +	addiu	a0, a0, 4
> +	bne	a2, a0, copy_vmlinuz
> +	 addiu	a1, a1, 4

Does this need to sync the icache and resolve the instruction hazard
before jumping into the newly written code?

E.g. on mips32/64 r2 and later you could I think "synci" at SYNCI_Step
intervals (as determined by RDHWR instruction), followed by a "sync" and
then using "jr.hb" instead of "jr" to clear the instruction hazard while
jumping to the newly written code.

That is roughly what arch/mips/kernel/relocate.c and
arch/mips/kernel/head.S do, but as mentioned that assumes MIPS32/64 r2+,
and at least 2 platforms selecting SYS_SUPPORTS_ZBOOT* also select
CPU_HAS_CPU_MIPS32_R1.

Cheers
James

> +
> +clear_bss:
>  	/* Clear BSS */
>  	PTR_LA	a0, _edata
>  	PTR_LA	a2, _end
> --=20
> 2.7.4
>=20
>=20

--UUMz/kfoogzZ9WLZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYojEBAAoJEGwLaZPeOHZ6NioQAJLokQUFZQWcBnQ5xi66wunb
pwIxfKiYWrv3lkTgKVQph23gXv7tymdQxOgqu52cu6+vt+UDSrS8K0TWs79cAX2Y
mOqmF2t8PrLazFUBrDlHFhZdg/T+zzqjzo2dHGi3fOZMAWnJTOFtNaCVR8Mn38+S
/Myki9/LcQ8sqTmRc3LTAhkD+7JvURLwsvGbRn/hn8U+f+8JbDnlnBzM8M+5eIug
jcno7Aps68tT4J3h3vXHxqpspqTHXBLZ4RQocTGdGI/ZWNv1HBHax+wtuJ1f8JR2
V86il1RT6OG3aWb9LSKmzySAggUov4Z/JCjjHDqPxia4hzJQtM6HPsVN6wWlgOxS
49YslL1Qco+ZiUSUboFksQAxlGBXcsLR3G391ffzSnaGftb4xqWhhmLt4Aq7WW9a
1inK1rKBonlAT29f3Mrbv5mvP5JbCOHvL5wk7Vw4FZfdra4eAZ7yXyEqtuI/NcnP
Ly7WbzOweB8vQmB+RX13tL3kEEODxEwBAxkvjZAL2n23J3Fjqi8Lh/VowPv2F8bI
yPzPfYHCzdYv9FAGPkYOxc/zNARoUDksK1tdILCPqa78FqoB1HBqbEghXTE9Q8xq
My0f6g0kruLGva2i0xCD9I2zC4nm5JVxDKike3jJFvsH0aN0bhpGl2OnCE8Pm8XQ
Kzel/ygUrXFS8iBAPDj3
=ZIHG
-----END PGP SIGNATURE-----

--UUMz/kfoogzZ9WLZ--
