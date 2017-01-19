Received: from mailapp01.imgtec.com ([195.59.15.196]:28827 "EHLO
        imgpgp01.kl.imgtec.org" rhost-flags-OK-OK-OK-FAIL)
        by eddie.linux-mips.org with ESMTP id S23993014AbdASJIJnpgm0 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 19 Jan 2017 10:08:09 +0100
Date: Thu, 19 Jan 2017 09:08:03 +0000
From: James Hogan <james.hogan@imgtec.com>
Subject: Re: [PATCH 2/13] KVM: MIPS: Pass type of fault down to
 kvm_mips_map_page()
Message-ID: <20170119090803.GE31545@jhogan-linux.le.imgtec.org>
References: <201701191629518310684@zte.com.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="r7U+bLA8boMOj+mD"
Content-Disposition: inline
In-Reply-To: <201701191629518310684@zte.com.cn>
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
To: jiang.biao2@zte.com.cn
Cc: linux-mips@linux-mips.org, pbonzini@redhat.com, rkrcmar@redhat.com, ralf@linux-mips.org, kvm@vger.kernel.org
Message-ID: <20170119090803.tugZhjjn5bBe9Nqz4a9BEryDrRmY_6cmXQy8VZFiEYQ@z>

--r7U+bLA8boMOj+mD
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Jan 19, 2017 at 04:29:51PM +0800, jiang.biao2@zte.com.cn wrote:
> Hi, James
>=20
>=20
>=20
>=20
>=20
>=20
>=20
> =EF=BC=9E Whats wrong with bool parameters?
> =EF=BC=9E=20
> =EF=BC=9E It needs a GPA mapping created, either for a read or a write de=
pending
> =EF=BC=9E on the caller. bool would seem ideally suited for just such a s=
ituation,
> =EF=BC=9E and in fact its exactly what the KVM GPA fault code path does t=
o pass
> =EF=BC=9E whether the page needs to be writable:
> =EF=BC=9E=20
> =EF=BC=9E kvm_mips_map_page() -=EF=BC=9E gfn_to_pfn_prot() -=EF=BC=9E __g=
fn_to_pfn_memslot() -=EF=BC=9E
> =EF=BC=9E hva_to_pfn() -=EF=BC=9E hva_to_pfn_slow().
> =EF=BC=9E=20
> =EF=BC=9E so all this really does is extend that pattern up the other way=
 as
> =EF=BC=9E necessary to be able to provide that information to gfn_to_pfn_=
prot().
> Bool parameter may make the code less readable.  :-)
>=20
>=20
> The way used is indeed consistent with the exist pattern, but the tramp d=
ata=20
>=20
>=20
> passed around and long parameters list maybe code smell(not for sure for=
=20
>=20
>=20
> the kernel :-) ),  which may be improved by some means.
>=20
> No offense,  just personal opinion. :-)

No offense taken :-)

Thanks again for reviewing,

Cheers
James

--r7U+bLA8boMOj+mD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYgIHNAAoJEGwLaZPeOHZ6IyQP/jllVPA7nALx5P8aUJgaGv+4
AOhW44B+iNtVkPyPZfgpf+m2EKAmx7E8UXdlkZpRQN0Mqbe6Xd/qD+xd/XDhZjow
/HaFmJBZpbbsFmyBlQAA9r/Kgxl0G/u+8oToJ476LHu4y8zf18w6EuZpSgsf9x0S
MwrZ/ZfvExssY9FnYyUivLnL0nZ0v7b1by7hk4MfT0q42OC098pjOImuqap67me4
hBC8cVO9e0R6OaKQWCb20NRLRV0DqalU7dd0h+ZbFkkb79JW4yHSdqGGrBCT76PY
EDSWu3huhsq3q5aZp84MKAFx5ZiaU/WazKSTYeE0AdzehEfQ4R8YbkCJU/egzHRc
Nn0z6ZyaCgB49YELO3GeQfIWm6wOHSGvxchI/3w8a3KfSnWcabR/XcuxBGcSuNNh
G1kpxBc2M4oE9L4aNNfUvD4l24+wCq4Xhlm09b1XOfrJ9O3q4a63bGiW8Rne1o5J
WHwV90wzU0kqKwWSwt3l9rhXL0vsB5nUWFLvcCRshjlW1EspvvYMGeP/BkwpoiAE
mt3d+19uQ6fjsDGOtWhMrLTVq4UsD2nqtsKerHLfjiDpiwhSEQuDEfXlqRCmS0Ak
VhwuiVKVdbVUSEVvS2aoZd5dqNDmz3hzuA6zzDBY8mmBKEXov/Ok9+B+Wo/vshLX
ZFJr/+506JixbFaKiLEm
=22k9
-----END PGP SIGNATURE-----

--r7U+bLA8boMOj+mD--
