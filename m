Received: from mailapp01.imgtec.com ([195.59.15.196]:29207 "EHLO
        imgpgp01.kl.imgtec.org" rhost-flags-OK-OK-OK-FAIL)
        by eddie.linux-mips.org with ESMTP id S23990519AbdBWMwn65IaY (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 23 Feb 2017 13:52:43 +0100
Date: Thu, 23 Feb 2017 12:52:36 +0000
From: James Hogan <james.hogan@imgtec.com>
Subject: Re: [PATCH] MIPS: Force o32 fp64 support on 32bit MIPS64r6 kernels
Message-ID: <20170223125236.GC996@jhogan-linux.le.imgtec.org>
References: <01a9d2344224e76ea17ff62ffa7b75717f6f1100.1487248664.git-series.james.hogan@imgtec.com>
 <1648905.7UokBy1sI6@np-p-burton>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="qlTNgmc+xy1dBmNv"
Content-Disposition: inline
In-Reply-To: <1648905.7UokBy1sI6@np-p-burton>
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
To: Paul Burton <paul.burton@imgtec.com>
Cc: Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org, stable@vger.kernel.org
Message-ID: <20170223125236.9qrC2RKFtJ_37iYMXgmR3ualiYy0ZwXRFn6zJfn-e9o@z>

--qlTNgmc+xy1dBmNv
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Paul,

On Fri, Feb 17, 2017 at 10:29:11AM -0800, Paul Burton wrote:
> > This results in userland FP breakage as CP0_Status.FR is read-only 1
> > since r6 (when an FPU is present) but CP0_Config5.FRE won't be set to
> > emulate FR=3D0.
>=20
> Perhaps it would be worth clarifying that what it breaks is FPU emulation=
 or=20
> pre-r6 FP code running atop MIPS32r6 kernels. Since FR=3D1 context switch=
ing=20
> should work fine for r6 user code, and it would only be impacted if it=20
> requires emulation for some reason (which is probably why we haven't hit =
this=20
> earlier in our CI testing).

Thanks Paul, it does indeed invoke the FPU emulator as it fails to set
FR=3D0. I'll update that paragraph to say this:
> This results in userland FP breakage as CP0_Status.FR is read-only 1
> since r6 (when an FPU is present) so __enable_fpu() will fail to clear
> FR. This causes the FPU emulator to get used which will incorrectly
> emulate 32-bit FPU registers.


> Besides possibly clarifying the commit message above this looks good to m=
e so:
>=20
>     Reviewed-by: Paul Burton <paul.burton@imgtec.com>

Thanks
James

--qlTNgmc+xy1dBmNv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYrtsUAAoJEGwLaZPeOHZ6tucQAKc8XZK4UEKztvOsnGcWUq4Q
yQAFNviHOf3y4Iz+5IVl/qHBXd96btaaRGmg/k7iPyk2ATzZJc/+nVV5aS7A/GNM
mFnyfeuT+1KLJMQ59VY+qzxzhknVmOTcrp9cS+vH72ri6GN/aeNR/WKgxuVRRccI
ag7kK7XnYdjNBuHnM00XajL3ympdyKp+qhmymbTw9tMcJV53XclLOt3bH6DDTsLv
TEcLXrOgENq1Kjgrqawl8/xJXhClxZTW5QzAmkubs9GA4BZ2BZrfHsxSNcxDQSWr
jb0sK/C02Axt/hEUlqy5wU4Euqs9NlY6M+LRFp0Lyp+U9J3K+tki2nCnoQQAnJ01
jV+G73dibBbSsI2C+z6gQ3y2FGkCdBTyM2vdHfghPRB80bXsu5qJTlWh+oPspeQy
JbJD1TfqeruVo+YUqiidq/TM8HgvggVs+bY9xX0nL4nAJCJjBLp6AwMaUST+q8od
wKJ6KSlnWNHc2aHgS9NFHdxGSG6ppOS2jWc8WeIfJnYnbkwSMsLvdnZYZEHQAXPO
hScP8XQgXoB0GvGLBP2we8AylVdJLsjVaNzkSbG4uDiN8wUX0wZ0inN7na4kvYhc
f2H7LHACQchXX2PsLi1YWk96T1yHUGW/4o82K4OqtEtUKY94aZ388FwAzZOIC0JP
fZJLxEU9hzgNtle5yi6A
=LNac
-----END PGP SIGNATURE-----

--qlTNgmc+xy1dBmNv--
