Received: from mailapp01.imgtec.com ([195.59.15.196]:24397 "EHLO
        imgpgp01.kl.imgtec.org" rhost-flags-OK-OK-OK-FAIL)
        by eddie.linux-mips.org with ESMTP id S23992213AbdGKKRwpKON0 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 11 Jul 2017 12:17:52 +0200
Date: Tue, 11 Jul 2017 11:17:46 +0100
From: James Hogan <james.hogan@imgtec.com>
Subject: Re: [PATCH] MIPS: Fix MIPS I ISA /proc/cpuinfo reporting
Message-ID: <20170711101746.GQ31455@jhogan-linux.le.imgtec.org>
References: <alpine.LFD.2.20.1707082259380.5208@eddie.linux-mips.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="0pkK7MCEo5hACTvx"
Content-Disposition: inline
In-Reply-To: <alpine.LFD.2.20.1707082259380.5208@eddie.linux-mips.org>
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
To: "Maciej W. Rozycki" <macro@linux-mips.org>
Cc: Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org, stable@vger.kernel.org
Message-ID: <20170711101746.cTqx60oI3vq0URr6SIuxNskbTnCOmbylLG0gCSBTGFY@z>

--0pkK7MCEo5hACTvx
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Sat, Jul 08, 2017 at 11:24:44PM +0100, Maciej W. Rozycki wrote:
> Cc: stable@vger.kernel.org # 3.19+
> Fixes: 515a6393dbac ("MIPS: kernel: proc: Add MIPS R6 support to /proc/cpuinfo")

That commit landed in v4.0-rc1, not 3.19.

Most stable tags with comments also have square brackets around the
email too, i.e.:
Cc: <stable@vger.kernel.org> # 4.0+

(though maybe thats just not to confuse git-send-email).

Otherwise:
Reviewed-by: James Hogan <james.hogan@imgtec.com>

Nice catch!

Cheers
James

--0pkK7MCEo5hACTvx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEd80NauSabkiESfLYbAtpk944dnoFAllkpckACgkQbAtpk944
dnr/zxAAhQSNctVCPgsANR7EOXAhBvqoutCCkfROChat4SaCy7Gye8gazkC/t5Uo
Md1JK8YcGtYBlDMOW+kfk5vKICenE7lvuazQngJkOQsezDSsDhwp8HU3DR+Odk7j
pV9ktZvGgGGBzLl6bflxHaLnW/UhoJdr7QNufRygiU5l8eBRlRVHsFenDMpy3E93
8AmVXc/jMfIMz/yzrZqszQ1nSMAd6mROFppmn+hVHxIUKkhWyHm+lar1KF/aosTs
gXdbcRRpka14GBRHNaF2gH/KMoLL5SbCsJN70scKvVHiuEqsTwIi9Ju+6F27/Jm8
ndMYReCpX94a3sBrtfcAiZH2TPbYCBSDLHR6nYodTHAgz8t2XQyhEbih1R1yP7nN
ExJUga3WE5ve7LuYKq/M+qR+BK+GoZfeS8JWM3djkKLJ/JI5Y/i7uIhvdrmUZH0L
doy3Y34NNFJYbI9fokxndAnjrxSl4QsIr/1DzoT4gcjKB21mx294aMahbK6rXGNV
K1//s215m0jGy6DLYYdJ7nzaydh8eLh/ohiOBedprXsVT0Kcv69lyZUi74W3ZzFd
PyNaoSTPsYdeAV51zSpjdDHyk1f4Qfy56YoFoRu6Z0hkYiiuXFYqDnfoDeqMUEA9
aORuhHVOT5iSejeAxrE4ePDDYUynQNwfkOxiryHvGAVcuc6E7vg=
=6BsU
-----END PGP SIGNATURE-----

--0pkK7MCEo5hACTvx--
