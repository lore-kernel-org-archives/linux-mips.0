Received: from 19pmail.ess.barracuda.com ([64.235.154.231]:60033 "EHLO
        19pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23990901AbdKNUb0pcktl (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 14 Nov 2017 21:31:26 +0100
Date: Tue, 14 Nov 2017 20:30:47 +0000
From: James Hogan <james.hogan@mips.com>
Subject: Re: [PATCH v3 04/11] MIPS: Octeon: Remove usage of cvmx_wait()
 everywhere.
Message-ID: <20171114203046.GC5823@jhogan-linux.mipstec.com>
References: <1510633827-23548-1-git-send-email-steven.hill@cavium.com>
 <1510633827-23548-5-git-send-email-steven.hill@cavium.com>
 <20171114190828.GD16044@linux-mips.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="TiqCXmo5T1hvSQQg"
Content-Disposition: inline
In-Reply-To: <20171114190828.GD16044@linux-mips.org>
Return-Path: <James.Hogan@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Ralf Baechle <ralf@linux-mips.org>
Cc: "Steven J. Hill" <steven.hill@cavium.com>, linux-mips@linux-mips.org
Message-ID: <20171114203047.gnZKGxcfWyRhKNx4P7XUEVHDU88Za4Mw0YPm-HXjBvw@z>

--TiqCXmo5T1hvSQQg
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 14, 2017 at 08:08:28PM +0100, Ralf Baechle wrote:
> On Mon, Nov 13, 2017 at 10:30:20PM -0600, Steven J. Hill wrote:
> > From: "Steven J. Hill" <Steven.Hill@cavium.com>
>=20
> At this place and many others cvmx_wait() was used to wait for a number
> of miliseconds, so I think it should better be replaced with something
> like mdelay(10).

Note that this patch, along with the nudges one and the lastpfn one, is
already queued for 4.15:

git://git.kernel.org/pub/scm/linux/kernel/git/jhogan/mips.git
branch: mips-next

so any fixes to it will have to be made on top.

Cheers
James

--TiqCXmo5T1hvSQQg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEd80NauSabkiESfLYbAtpk944dnoFAloLUm0ACgkQbAtpk944
dnrKIg//Ro41TrHMcJP+MTkUf4cB8aBl9NWNBAD4Fr1vCxgCy3Z6z+CbgzsAdyTk
pvulNHzcv40vEJTU/KXd1CePn+4JBNGgZ87KI1E1KLlmOuUDBPePiF7gouHU0f5j
YJD4IIFvJWeF8Sr1sj5MXFVPF83da2LplgqVcseeXCQIdrESrh4txzJvDTXbOrPx
LD+hV0fATpvC6ynWeabIVGHxwcJsw+nM2PUpbbQPc6gSHuUqRm16jMrRa8N65XgY
s44MXBVV/Q/oa4AgxuFfqaAB+S6AgUbD4SQg8xPmvBOcKHeu784x46Nd3yrLrMrZ
YehboQObF565/YYffEp9NAsbIEe2uyxzTvnau+Ix7o2GjAraVZJBnlMgCEafQt7q
d5aDIq58aAGiwplgTw437+aMMTtDuGms7SsSZeuFJN3n2ZTKSC2f2db37DqTvYYk
x5MyGgIVzaVSqBLYCtTs+mZV1WNdS3N8qjEFC+e7xGCwyivz8RSC5M1tvfRFasIh
zHarjVDrO4vVm7JBJwkq1YoDrVLBco6UOp2qpEnrIOuf+W4Pjri3ssIx4KWHtm7B
Tt5LBubS5aKFW/5uwtmitg7r9DcT+SNB1qFFi/LFlTWN4xChLQPWMDnj8MN2HSU7
4Yx+FgYZm5+pJyn+ByKhIbCU+1iflDqkIwD1eZschiIkjfqvwpc=
=MJyA
-----END PGP SIGNATURE-----

--TiqCXmo5T1hvSQQg--
