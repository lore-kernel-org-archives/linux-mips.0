Received: from mailapp01.imgtec.com ([195.59.15.196]:35473 "EHLO
        imgpgp01.kl.imgtec.org" rhost-flags-OK-OK-OK-FAIL)
        by eddie.linux-mips.org with ESMTP id S27013952AbbLQKtYyAvUa (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 17 Dec 2015 11:49:24 +0100
Date: Thu, 17 Dec 2015 10:49:18 +0000
From: James Hogan <james.hogan@imgtec.com>
Subject: Re: [PATCH 00/16] MIPS: KVM: Misc trivial cleanups
Message-ID: <20151217104918.GA2789@jhogan-linux.le.imgtec.org>
References: <1450309781-28030-1-git-send-email-james.hogan@imgtec.com>
 <567290D2.70207@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ibTvN161/egqYuK8"
Content-Disposition: inline
In-Reply-To: <567290D2.70207@redhat.com>
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
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Ralf Baechle <ralf@linux-mips.org>, Gleb Natapov <gleb@kernel.org>, linux-mips@linux-mips.org, kvm@vger.kernel.org
Message-ID: <20151217104918.WOlf7c65Z53_-drkqBZ-wB2PYClc3Rf1d-ZiEUFgA8E@z>

--ibTvN161/egqYuK8
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Paolo.

On Thu, Dec 17, 2015 at 11:39:14AM +0100, Paolo Bonzini wrote:
>=20
>=20
> On 17/12/2015 00:49, James Hogan wrote:
> > This patchset contains a bunch of miscellaneous cleanups (which are
> > mostly trivial) for MIPS KVM & MIPS headers, such as:
> > - Style/whitespace fixes
> > - General cleanup and removal of dead code.
> > - Moving/refactoring of general MIPS definitions out of arch/mips/kvm/
> >   and into arch/mips/include/asm/ so they can be shared with the rest of
> >   arch/mips. Specifically COP0 register bits, exception codes, cache
> >   ops, & instruction opcodes.
> > - Add MAINTAINERS entry for MIPS KVM.
> >=20
> > Due to the interaction with other arch/mips/ code, I think it makes
> > sense for these to go via the MIPS tree.
>=20
> No objection.
>=20
> Acked-by: Paolo Bonzini <pbonzini@redhat.com>

Thanks!

>=20
> I think I'd use s8/u8 instead of int8_t/uint8_t in patch 15, but really
> that's just me.  I'm fine either way, and that's really the only comment
> I have on the series. :)

I'm inclined to agree. u?int(8|16|32)_t all over arch/mips/kvm/ instead
of [us](8|16|32) irritates me as its not very kernel'y.

Ralf: Maybe don't apply patch 15 (I've marked rejected in patchwork),
and I'll do a wider cleanup at some point instead.

Cheers
James

>=20
> Paolo
>=20
> > James Hogan (16):
> >   MIPS: KVM: Trivial whitespace and style fixes
> >   MIPS: KVM: Drop some unused definitions from kvm_host.h
> >   MIPS: Move definition of DC bit to mipsregs.h
> >   MIPS: KVM: Drop unused kvm_mips_host_tlb_inv_index()
> >   MIPS: KVM: Convert EXPORT_SYMBOL to _GPL
> >   MIPS: KVM: Refactor added offsetof()s
> >   MIPS: KVM: Make kvm_mips_{init,exit}() static
> >   MIPS: Move Cause.ExcCode trap codes to mipsregs.h
> >   MIPS: Update trap codes
> >   MIPS: Use EXCCODE_ constants with set_except_vector()
> >   MIPS: Break down cacheops.h definitions
> >   MIPS: KVM: Use cacheops.h definitions
> >   MIPS: Move KVM specific opcodes into asm/inst.h
> >   MIPS: KVM: Add missing newline to kvm_err()
> >   MIPS: KVM: Consistent use of uint*_t in MMIO handling
> >   MAINTAINERS: Add KVM for MIPS entry
> >=20
> >  MAINTAINERS                       |   8 +++
> >  arch/mips/Kconfig                 |   3 +-
> >  arch/mips/include/asm/cacheops.h  | 106 ++++++++++++++++++++----------=
----
> >  arch/mips/include/asm/kvm_host.h  |  39 +------------
> >  arch/mips/include/asm/mipsregs.h  |  34 +++++++++++
> >  arch/mips/include/uapi/asm/inst.h |   3 +-
> >  arch/mips/kernel/cpu-bugs64.c     |   8 +--
> >  arch/mips/kernel/traps.c          |  52 ++++++++---------
> >  arch/mips/kvm/callback.c          |   2 +-
> >  arch/mips/kvm/dyntrans.c          |  10 +---
> >  arch/mips/kvm/emulate.c           | 118 ++++++++++++++++--------------=
--------
> >  arch/mips/kvm/interrupt.c         |   8 +--
> >  arch/mips/kvm/locore.S            |  12 ++--
> >  arch/mips/kvm/mips.c              |  38 ++++++------
> >  arch/mips/kvm/opcode.h            |  22 -------
> >  arch/mips/kvm/tlb.c               |  77 +++++++------------------
> >  arch/mips/kvm/trap_emul.c         |   1 -
> >  17 files changed, 245 insertions(+), 296 deletions(-)
> >  delete mode 100644 arch/mips/kvm/opcode.h
> >=20
> > Cc: Ralf Baechle <ralf@linux-mips.org>
> > Cc: Paolo Bonzini <pbonzini@redhat.com>
> > Cc: Gleb Natapov <gleb@kernel.org>
> > Cc: linux-mips@linux-mips.org
> > Cc: kvm@vger.kernel.org
> >=20

--ibTvN161/egqYuK8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJWcpMuAAoJEGwLaZPeOHZ6VhYQAJ+PwFTimcObsAV65URdWakP
G9w/rkpv+XYuIfA4dh5p44njEhL5+r9kXrIps7u03Cv3SU8h+PmZej2Ni9Tt8RQP
pBSOc0AxJFU8tdLkIju1oHflAblbkOe7OXJTFKZA1NEBn5diJt6e8CCeC8rkZbB/
wvKDmrvfZuDqCrPj4+XOU1rVpLEeQem+oH4qXvTudQEuz/8u8FTZjFVb/YjT+vp5
6XQmc/6Oh2nZO1HU67nrqu/VdwesokbaKzc71CZ1SqJi2XACzFZgcx4l0D6VNvrU
G4LAr0IoYh9v1cpvwbi9mYzzTA+9Kq66b+EpxtCJj1OyqAMi4imNtrpBq56hlM99
dHSJFXwm8iPF+zwR+VhoAZMQpbDC+T+6M1J+V9j5DwrttyAuOAeYMqG1zEpbbPTC
QfeNMxIO82gjAQU5fDqkxrZPkLibCJtVlZqe4/WOPybS1Xzf6L4UOSSDka6UNaKM
2n4Bo8o1h8cDamA1YHA1nHB+HWkSQTXVROj8jBJZrW0r0gWJI+Ex9cHgDFLOt1T9
J9HDHyshMrR6WLk4NM+rww4370h+fwQ3Fdz58kjjNgIDfAgcSz0QKL6m2RQYMdil
jUdshWUvIcgmfPsaMCCBkP9O6RjEpKJ7+gD5BB27T/u35dK8K0E1WuarH+IatNru
6ccg+2wvsctx4NKrhwh8
=sNqW
-----END PGP SIGNATURE-----

--ibTvN161/egqYuK8--
