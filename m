Received: from mailapp01.imgtec.com ([195.59.15.196]:57247 "EHLO
        imgpgp01.kl.imgtec.org" rhost-flags-OK-OK-OK-FAIL)
        by eddie.linux-mips.org with ESMTP id S23993417AbdBMLMQnxa9q (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 13 Feb 2017 12:12:16 +0100
Date: Mon, 13 Feb 2017 11:12:10 +0000
From: James Hogan <james.hogan@imgtec.com>
Subject: Re: [PATCH] MIPS: Lantiq: Fix cascaded IRQ setup
Message-ID: <20170213111209.GJ24226@jhogan-linux.le.imgtec.org>
References: <20170119112822.59445-1-nbd@nbd.name>
 <20170211231906.GI24226@jhogan-linux.le.imgtec.org>
 <073628a4-9c45-b3c3-6caa-c88bea138aa9@hauke-m.de>
 <54159608-3adb-071b-9555-f48e2fb3dd22@nbd.name>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="JsihDCElWRmQcbOr"
Content-Disposition: inline
In-Reply-To: <54159608-3adb-071b-9555-f48e2fb3dd22@nbd.name>
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
To: Felix Fietkau <nbd@nbd.name>
Cc: Hauke Mehrtens <hauke@hauke-m.de>, linux-mips@linux-mips.org, ralf@linux-mips.org, john@phrozen.org
Message-ID: <20170213111210.vkcCLscfG3qMRhD48CszqXKtaGxyi5hDwpOBVcYB6rc@z>

--JsihDCElWRmQcbOr
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 12, 2017 at 12:05:08PM +0100, Felix Fietkau wrote:
> On 2017-02-12 00:50, Hauke Mehrtens wrote:
> > On 02/12/2017 12:19 AM, James Hogan wrote:
> >> On Thu, Jan 19, 2017 at 12:28:22PM +0100, Felix Fietkau wrote:
> >>> With the IRQ stack changes integrated, the XRX200 devices started
> >>> emitting a constant stream of kernel messages like this:
> >>>
> >>> [  565.415310] Spurious IRQ: CAUSE=3D0x1100c300
> >>>
> >>> This appears to be caused by IP0 firing for some reason without being
> >>> handled. Fix this by setting up IP2-6 as a proper chained IRQ handler=
 and
> >>> calling do_IRQ for all MIPS CPU interrupts.
> >>>
> >>> Cc: john@phrozen.org
> >>> Cc: stable@vger.kernel.org
> >>> Signed-off-by: Felix Fietkau <nbd@nbd.name>
> >>=20
> >> Is this still applicable after Matt's fix is applied?
> >> https://patchwork.linux-mips.org/patch/15110/
> >=20

> > I just tried it without Matt's and Felix's fix and I saw the problem,
> > then I applied Matt's fix and the problem was gone.
> I still think it should be applied, since it replaces some hacks with
> cleaner code.

Okay, I'll drop cc stable (since cpu_has_vint is hardwired to 1 on
lantiq platform), and change the last paragraph of the commit message to
say:

> This is caused by IP0 getting handled by plat_irq_dispatch() rather than
> its vectored interrupt handler, which is fixed by commit de856416e714
> ("MIPS: IRQ Stack: Fix erroneous jal to plat_irq_dispatch").
>
> Fix plat_irq_dispatch() to handle non-vectored IPI interrupts correctly
> by setting up IP2-6 as proper chained IRQ handlers and calling do_IRQ
> for all MIPS CPU interrupts.

I think thats accurate, but let me know if you want it changed.

Thanks
James

--JsihDCElWRmQcbOr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYoZSAAAoJEGwLaZPeOHZ64dUQALEIa7JmOyaDCfAbroTM+Pp0
xCFbxnT/t8MV17U3zwzRTr3DiwEY3zWdR+4CDGk1eaaes/4TD7OipYE8K8UoUQ6Y
DePHODpZpz1YnK5u5/WCqDitkx3tIRYqIFlAGqrhVhtvvccqhPpoMytGVXFUrq5C
NDMufAb/P3EheiJq2lrHlhG6qQhCEGcgcGtD1+BpMQhF5srCclVLkpGadyf74LCJ
oTur2bj+AXFduZm5950MkmXpUMbzWkm7Ya2UTYJzlhgquV/fR5Zty2HxSuzMi0qo
sxz0V9Jq4tIJpw39wO63JZ2tvFWbvirdAt5P8l7ssrZcIGFFjedK9TiACL8w65jE
t3gpXa/3ciVq1ygRxw4R/TtufKO3oVNCly+6JVNpMxOJwtdzdhQu4fixmlEvadM2
rNENuqL/zDZDJ+d4r3oOowHVAEbAxCLvjysGvWNoMj8UGrfI3Dh4GG+v4ghxjuyW
tz/mAOgxnoeteOV2y0ITiXj0Yl3BOHJPHMU16IFjqpLPEBb9cuQ1yUXtpUiozjnq
gZbRI0peiyLfVvHNoSxnF/IVEmk1gJ6knN43ly2x6BdJX38kEn/Z4emlUB5Q5JtS
0aBAViW5xkdx61ffeq3RAPDnAzaT4CGj+DevLcWGU8Z1+mOPVNbhWL2m3vS4Hb1f
z9SN1W351FZ4KFKqvOZZ
=g9Fq
-----END PGP SIGNATURE-----

--JsihDCElWRmQcbOr--
