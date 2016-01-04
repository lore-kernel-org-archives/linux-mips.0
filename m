Received: from mailapp01.imgtec.com ([195.59.15.196]:16340 "EHLO
        imgpgp01.kl.imgtec.org" rhost-flags-OK-OK-OK-FAIL)
        by eddie.linux-mips.org with ESMTP id S27009741AbcADW22p8U5h (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 4 Jan 2016 23:28:28 +0100
Date: Mon, 4 Jan 2016 22:28:22 +0000
From: James Hogan <james.hogan@imgtec.com>
Subject: Re: [PATCH backport v3.15..v4.1 1/2] MIPS: uaccess: Take EVA into
 account in __copy_from_user()
Message-ID: <20160104222822.GJ17861@jhogan-linux.le.imgtec.org>
References: <1451939344-21557-1-git-send-email-james.hogan@imgtec.com>
 <1451939344-21557-2-git-send-email-james.hogan@imgtec.com>
 <568AE53F.80103@imgtec.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="6THr7QwYWIbrk6Kt"
Content-Disposition: inline
In-Reply-To: <568AE53F.80103@imgtec.com>
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
To: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>
Cc: stable@vger.kernel.org, Tom Herbert <therbert@google.com>, Markos Chandras <markos.chandras@imgtec.com>, Paul Burton <paul.burton@imgtec.com>, linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>
Message-ID: <20160104222822.sjrplA8ANECE9wCluiv7wOe4K6KR-q1Gco4k4sxmHhE@z>

--6THr7QwYWIbrk6Kt
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Leonid,

On Mon, Jan 04, 2016 at 01:33:51PM -0800, Leonid Yegoshin wrote:
> On 01/04/2016 12:29 PM, James Hogan wrote:
> > Add the eva_kernel_access() check in __copy_from_user() like the one in
> > copy_from_user().

=2E..

> Adding a user space check in __copy_from_user() kills the original=20
> design.

The original patch which did the same thing is already merged, so its a
bit late to be arguing with it now.

In any case, like other __ prefixed uaccess functions I believe the
semantics are such that __copy_from_user() can be used instead of
copy_from_user() to avoid multiple redundant access_ok() checks, since
the caller can do it once before calling __copy_from_user().

I have yet to see evidence or documentation suggesting that it was
intended never to be used for kernel addresses, which would be
inconsistent with copy_from_user and other __ uaccess functions which do
handle them. Given the awkwardness of auditing whether some of these
functions are ever called with kernel addresses, and the rate of code
change in Linux, taking shortcuts with the semantics, even if possible
to do at this moment, will only result in future code rot.

Cheers
James

--6THr7QwYWIbrk6Kt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJWivIGAAoJEGwLaZPeOHZ65UwP/0AsYNY2J56+d7y62VQHtnx+
rk4MMxxgCJswieIMPFLMAIeqcsK+ZjVUpK+KFLMyLN8qlptvMarci4fgdbYzc7PU
SrgsRNtNn62rYGbqkZ52Iaao/bLVRXW0K6Vn1udMvHBvuQsd6PsPaGLJsQZpmkni
JZuxxDwyNr9EsWBF604WeUytfQpGMBfd3HGI665O8weJ8k6z+9lglkuEy3pwTvMP
MfXMplsmYbnYgRRf5TIg757RIUcOwHb8THlMo1nUCmny+kKVNxp+A/166sdtxjzT
ubty6UAjZH0wWCCxEVjj2fILSpI31NNvuMZfpoXk1WvOFyF6RASU+OAtl//GP56v
U94mkAyOTzaIukdOigp9P6fjdXafLKaXe3+rrpJkLDEXt487ByjqBurFsLefUVEQ
MSmyjqVuXtZS5z+3BA3rpw8RgVFPmkHwHZzFx2qAyaqWpa7yPAkUBQRPYfiza8S7
VhpFYNww247UCrsVBzJbGDZwjn37ouhz6H6jGrIVYfOmyQO7LpRJ1IvSOfXneoO0
LDO9dcryG8RbAODyo2zTsGJu+YfPmal40eyZO+Q2allNnZFkx3RhRe8Z3W9lusDE
NGbC7AN/yBCcL6MnaxLkgnI1xOJEXERtaa99xLN4k7j24w+or4bAJv8NanBSxLGV
wf9GAdMmc3WdBgITqi81
=++zF
-----END PGP SIGNATURE-----

--6THr7QwYWIbrk6Kt--
