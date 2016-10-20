Received: from mailapp01.imgtec.com ([195.59.15.196]:1918 "EHLO
        imgpgp01.kl.imgtec.org" rhost-flags-OK-OK-OK-FAIL)
        by eddie.linux-mips.org with ESMTP id S23993035AbcJTTPWJJmch (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 20 Oct 2016 21:15:22 +0200
Date: Thu, 20 Oct 2016 20:15:15 +0100
From: James Hogan <james.hogan@imgtec.com>
Subject: Re: [PATCH] KVM: MIPS: Add missing uaccess.h include
Message-ID: <20161020191515.GM7370@jhogan-linux.le.imgtec.org>
References: <d852b5f35e84e60c930589eeb14a6df21ea9b1cb.1476834183.git-series.james.hogan@imgtec.com>
 <20161020131054.GF8573@potion>
 <20161020131630.GL7370@jhogan-linux.le.imgtec.org>
 <20161020175323.GB8569@potion>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="wHh0aNzodMFDTGdO"
Content-Disposition: inline
In-Reply-To: <20161020175323.GB8569@potion>
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
To: Radim =?utf-8?B?S3LEjW3DocWZ?= <rkrcmar@redhat.com>
Cc: linux-mips@linux-mips.org, Paolo Bonzini <pbonzini@redhat.com>, Ralf Baechle <ralf@linux-mips.org>, kvm@vger.kernel.org
Message-ID: <20161020191515.NIwUOY87xEl-biJ2d53E1-qbq-xdiSrQMmQl2q9KQJ0@z>

--wHh0aNzodMFDTGdO
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 20, 2016 at 07:53:23PM +0200, Radim Kr=C4=8Dm=C3=A1=C5=99 wrote:
> 2016-10-20 14:16+0100, James Hogan:
> > BTW, generally speaking do you always prefer pull requests to have the
> > patches sent in reply to it, or only if they haven't already been posted
> > for review?
>=20
> I strongly prefer pull requests that include only patches that were
> already posted on the list and slightly prefer to omit the patch
> replies.
>=20
> At least for me, a patch in a pull request has a FYI status instead of a
> RFC status that a normal posting has.
>=20
> [I'd like if all patches in pull requests were already (re)viewed by
>  interested parties, so merge discussions could be high level or focus
>  on things that we learned while/after applying the patches, hence there
>  would be little benefit from reposting patches to the mailing list.]

Good, I absolutely agree.

Thanks
James

--wHh0aNzodMFDTGdO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYCRe9AAoJEGwLaZPeOHZ6ODMP/1r2s9A3ReQpp7gf1uERZaPs
b+Utjg505meWt0jpUqM3M8y1VJeIGq0ngtDvxGezpLMD4v3J5b5W7TABPkqy+Vej
UrmCXI1JBoIjOBt8aFIgo8RXMDkSnhKtZjRxMnvt3KHLHBt8LBh3PlnsAilLBJMO
TCKaxUvu40Lsyquxr0jZewRJCIpZsLcv5hMBqTP1Y2QDIpyj6ixNZ8zBuZqfdMzt
AgFhYRZ1nkh9QypvGAX97KtH8CDM4N6a91WMH4GZsSZHF9YNiwa0FTzxzq4rkh7Y
KoU9Ei6Dq5YOXC6K0RZsBiX9QS/Yp4RejGJsFcJfOnCSjDPQlCroA1EexLZDOYte
T8s1ctKfeEjbqZOZXc0Y4aoegnjnu/Dn++PDOlK1lcChytgGoTUUHuoAHZEWdLkR
WqTrVVktDvxal3AEZtQYSBOFoOuPXQgHxVqWpGtj8iW40eHRpRwj1cjDCG74O70G
RHt2Xs3Z/Oip7G+rovQgi2v0WeZnTgHYtCFIp7W0oUmyIPKXBf1nxiFX6bf1cmDb
lc4b0yBGJnQnXkaE7xBrqRFQQB4FY5tAKey3b16opYldIl9WPQK3PxxIxbKoMqmr
9H/7Nbs0hIXmSvv1e5qx21Q1XH2VvYW3qzoFVDsOOESERf5hGvkjqcS/WUrolbb+
M110OTNpa9fciN/WHJ73
=nadt
-----END PGP SIGNATURE-----

--wHh0aNzodMFDTGdO--
