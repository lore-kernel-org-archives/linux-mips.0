Received: from mailapp01.imgtec.com ([195.59.15.196]:11458 "EHLO
        imgpgp01.kl.imgtec.org" rhost-flags-OK-OK-OK-FAIL)
        by eddie.linux-mips.org with ESMTP id S27012495AbbEEVnLZIIea (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 5 May 2015 23:43:11 +0200
Date: Tue, 5 May 2015 22:42:06 +0100
From: James Hogan <james.hogan@imgtec.com>
Subject: Re: [BUG ?] MIPS: KVM: condition with no effect
Message-ID: <20150505214205.GD17687@jhogan-linux.le.imgtec.org>
References: <20150505123438.GA21514@opentech.at>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="mSxgbZZZvrAyzONB"
Content-Disposition: inline
In-Reply-To: <20150505123438.GA21514@opentech.at>
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
To: Nicholas Mc Guire <der.herr@hofr.at>
Cc: Gleb Natapov <gleb@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, Ralf Baechle <ralf@linux-mips.org>, kvm@vger.kernel.org, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org
Message-ID: <20150505214206.9x-LFSf1x-lpxDaDYznvGzfR73IWAxcGgs5bEhZxmS4@z>

--mSxgbZZZvrAyzONB
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, May 05, 2015 at 02:34:38PM +0200, Nicholas Mc Guire wrote:
>=20
> Hi !
>=20
>  Not sure if this is a bug or maybe a placeholder for
>  something... so patch - but maybe someone that knows this code can
>  give it a look.
>=20
> arch/mips/kvm/emulate.c:emulation_result kvm_mips_complete_mmio_load()   =
=20
> <snip>
> 2414         case 2:
> 2415                 if (vcpu->mmio_needed =3D=3D 2)
> 2416                         *gpr =3D *(int16_t *) run->mmio.data;       =
        =20
> 2417                 else
> 2418                         *gpr =3D *(int16_t *) run->mmio.data;
> 2419=20
> 2420                 break;
> <snip>
>=20
>  either the if/else is not needed or one of the branches is wrong
>  or it is a place-holder for somethign that did not get
>  done - in which case a few lines explaining this would be=20
>  nice (e.g. like in arch/sh/kernel/traps_64.c line 59)
>=20
>  line numbers refer to 4.1-rc2=20

mmio_needed encodes whether the MMIO load is a signed (2) or unsigned
(1) load. E.g. the len =3D=3D 1 case just below casts the pointer to u8 vs
int8_t to control sign extension. So it appears the else branch (line
2418 in your quote) should be uint16_t (or u16) to prevent the MMIO
value loaded by a lhu (load halfword unsigned) being sign extended to
the full width of the registers. Nice catch!

Feel free to send a patch to fix. Otherwise I'm happy to do it.

Thanks!
James

--mSxgbZZZvrAyzONB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJVSTktAAoJEGwLaZPeOHZ6vfgP/0KOtZqSyQ/6HuBMJJrhPQs/
RBLEOgi881Vk4jFnvg+0e8yk/MrkNbmOo/j+DSKkO58Q+WY4vo+cI95d1Owvk92I
+aFivxw5HghxUQ8+G4jFKsA7qcyVo0DYXdlnp3hXDm+Yn17WPGCsEaeO3NF5EPaS
0hyiqVULNDRrGE6iUPWoaELNvhLBMZ3rlb9SyIKmQSlkDH6+tYqSy+XhTJxv569b
YdYXei5LHofKJYNoktBhdPWpvoCi1MsarndyZhX+iufa8SbFZHgzK9mds/xrmiWM
GRJVepfuJ7vkgkt+bKtFGk7L8nHBn84Uu5qV6NbjHE46FR/AkNwOfhXT7YnP4q3E
v5o+TFY37UWxbEnxzemLT49ZwI84+3EUv0kjaPGTtCX1N48DgsXCICjW9/nfNbtI
4FOdRa5ydaGwe/vsidiVX3BSq42XrI+0KKY7hRAHxkl5eSrhvduofMzLLA8ptmRj
TZ5p0RXmJBDJ/D0Uh7AqdOKYWw98q3/m99V+gOxUjdT0FOpOUOoMQ2y8ZlL5vI5Q
l6OOfVsl+noV/M6NoFJNbJU1A+MowMZZGWrBxkILOUckdgP7qV5egobHcu9dBMWs
jfj9tdVuRuulhTAcxp4sSLBGRAlD5ZiVcWm8ONAOugYNjBHTAeTz/cEu22YZS3FF
YS7ZHgEt1ec6d2McueAI
=hNQN
-----END PGP SIGNATURE-----

--mSxgbZZZvrAyzONB--
