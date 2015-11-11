Received: from mailapp01.imgtec.com ([195.59.15.196]:3863 "EHLO
        imgpgp01.kl.imgtec.org" rhost-flags-OK-OK-OK-FAIL)
        by eddie.linux-mips.org with ESMTP id S27011543AbbKKO5TiVlie (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 11 Nov 2015 15:57:19 +0100
Date: Wed, 11 Nov 2015 14:57:12 +0000
From: James Hogan <james.hogan@imgtec.com>
Subject: Re: [PATCH 0/3] MIPS: KVM: Misc fixes
Message-ID: <20151111145712.GX26383@jhogan-linux.le.imgtec.org>
References: <1447251680-5254-1-git-send-email-james.hogan@imgtec.com>
 <56435402.2050503@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="QQ0dNM4HnH4+xgqD"
Content-Disposition: inline
In-Reply-To: <56435402.2050503@redhat.com>
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
Cc: Ralf Baechle <ralf@linux-mips.org>, Gleb Natapov <gleb@kernel.org>, linux-mips@linux-mips.org, kvm@vger.kernel.org, stable@vger.kernel.org
Message-ID: <20151111145712.C7REYWZrvyx0e5tmnLIqSJe0bgM_6BSaaKjZFA3dQps@z>

--QQ0dNM4HnH4+xgqD
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Paolo,

On Wed, Nov 11, 2015 at 03:43:14PM +0100, Paolo Bonzini wrote:
> On 11/11/2015 15:21, James Hogan wrote:
> > A few misc MIPS KVM fixes for issues that have been around since the
> > code was merged in v3.10.
> >=20
> > James Hogan (3):
> >   MIPS: KVM: Fix ASID restoration logic
> >   MIPS: KVM: Fix CACHE immediate offset sign extension
> >   MIPS: KVM: Uninit VCPU in vcpu_create error path
> >=20
> >  arch/mips/kvm/emulate.c |  2 +-
> >  arch/mips/kvm/locore.S  | 16 ++++++++++------
> >  arch/mips/kvm/mips.c    |  5 ++++-
> >  3 files changed, 15 insertions(+), 8 deletions(-)
> >=20
> > Cc: Ralf Baechle <ralf@linux-mips.org>
> > Cc: Paolo Bonzini <pbonzini@redhat.com>
> > Cc: Gleb Natapov <gleb@kernel.org>
> > Cc: linux-mips@linux-mips.org
> > Cc: kvm@vger.kernel.org
> > Cc: <stable@vger.kernel.org>
> >=20
>=20
> Thanks, these will have to wait after the end of the merge window.

Okay, no problem. As long as they can make v4.4.

For the record do you prefer not to receive patches during merge window?

Thanks
James

--QQ0dNM4HnH4+xgqD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJWQ1dIAAoJEGwLaZPeOHZ6tLgP/3aAqb39mlneKvc5UbJXPJwQ
dHwBosuIr5kpa6o0fuL2qa5SVjWAtZYNkvZTNThSm6B4bAwWv/usv2AhDEPjZKs5
qEu8I6bLYyyEdDDAv+8Rbd9VDmYsJQT/xHQpNvpPPRGlinowOEakRwApkM6SZJKa
pnbTB8q+jhY2g8y1w0/thRCnHeVLFFc4VXLEmpjmFX4Pec0cGYQYdqZkqTQdeFHY
FBjqaTds2tDT7DTUhqCIVU3YN7cQ5AqxeV4mhRen+8XuZShXpNXHKCAkpjzPM0DY
ok/o/NTAc0oXn4zXzQz2gLYp2i1x1nCF8dzHs+PcQxUCxsjvjMRpLuyR6jOnGXpk
0PaCL2EzNyPgb+bB05Etv1NcTXnSv5fN2p1ZyrwUQvKmqhm8neLi50lVi6asBnIL
ROjjVN6g9Xl9PDJjy+toogsQdFPiDgbRYUjT+s02MDSfAgqnzF4/blaAMA+IiKn9
cjbE2Ku9LyQUMNYRM967m+LdJRbTxVYf/DE0MkhSPGvzBaz3yKHsbXICfXr4ZwPm
m62rW3fJ34VI4uY0R9FtKxXiRHPaxEcdB8vKLyHpxHlip/CFKPojpMIBtDdH9v8D
cMBdshjCQgYr25Ec2/3fGUgji23fIFgRjGjJJfdgEvcjnSzyFoWQSFhVPiyLmxxn
zJRGFXv9lPJX59Xez/bP
=ZWkN
-----END PGP SIGNATURE-----

--QQ0dNM4HnH4+xgqD--
