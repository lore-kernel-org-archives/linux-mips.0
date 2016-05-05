Received: from mailapp01.imgtec.com ([195.59.15.196]:46087 "EHLO
        imgpgp01.kl.imgtec.org" rhost-flags-OK-OK-OK-FAIL)
        by eddie.linux-mips.org with ESMTP id S27028019AbcEEV6GizMC5 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 5 May 2016 23:58:06 +0200
Date: Thu, 5 May 2016 22:58:00 +0100
From: James Hogan <james.hogan@imgtec.com>
Subject: Re: [PATCH v2] MIPS: Remove no longer needed work_on_cpu() call
Message-ID: <20160505215800.GA11557@jhogan-linux.le.imgtec.org>
References: <1462179649-55112-1-git-send-email-anna-maria@linutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="zhXaljGHf11kAtnf"
Content-Disposition: inline
In-Reply-To: <1462179649-55112-1-git-send-email-anna-maria@linutronix.de>
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
To: Anna-Maria Gleixner <anna-maria@linutronix.de>
Cc: linux-kernel@vger.kernel.org, rt@linutronix.de, Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org
Message-ID: <20160505215800.4Mr0fXFd0qLy1Mx1su5A2TvaCNJjGyCVIu2RyJlhCrs@z>

--zhXaljGHf11kAtnf
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 02, 2016 at 11:00:49AM +0200, Anna-Maria Gleixner wrote:
> Since commit 3b9d6da67e11 ("cpu/hotplug: Fix rollback during error-out
> in __cpu_disable()") it is ensured that callbacks of CPU_ONLINE and
> CPU_DOWN_PREPARE are processed on the hotplugged CPU. Due to this
> work_on_cpu() calls are no longer required.
>=20
> Replace work_on_cpu() with a direct call of mips_cdmm_bus_up() or
> mips_cdmm_bus_down(). Description of those functions are adapted.
>=20
> Cc: Ralf Baechle <ralf@linux-mips.org>
> Cc: linux-mips@linux-mips.org
> Signed-off-by: Anna-Maria Gleixner <anna-maria@linutronix.de>

Thanks, looks reasonable to me,
Acked-by: James Hogan <james.hogan@imgtec.com>

Cheers,
James

> ---
> Changes in v2:
> 	- Adapt referenced commit in commit message
>=20
>  drivers/bus/mips_cdmm.c |   12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
>=20
> --- a/drivers/bus/mips_cdmm.c
> +++ b/drivers/bus/mips_cdmm.c
> @@ -599,8 +599,8 @@ BUILD_PERDEV_HELPER(cpu_up)         /* i
>   * mips_cdmm_bus_down() - Tear down the CDMM bus.
>   * @data:	Pointer to unsigned int CPU number.
>   *
> - * This work_on_cpu callback function is executed on a given CPU to call=
 the
> - * CDMM driver cpu_down callback for all devices on that CPU.
> + * This function is executed on the hotplugged CPU and calls the CDMM
> + * driver cpu_down callback for all devices on that CPU.
>   */
>  static long mips_cdmm_bus_down(void *data)
>  {
> @@ -630,7 +630,9 @@ static long mips_cdmm_bus_down(void *dat
>   * CDMM devices on that CPU, or to call the CDMM driver cpu_up callback =
for all
>   * devices already discovered on that CPU.
>   *
> - * It is used during initialisation and when CPUs are brought online.
> + * It is used as work_on_cpu callback function during
> + * initialisation. When CPUs are brought online the function is
> + * invoked directly on the hotplugged CPU.
>   */
>  static long mips_cdmm_bus_up(void *data)
>  {
> @@ -677,10 +679,10 @@ static int mips_cdmm_cpu_notify(struct n
>  	switch (action & ~CPU_TASKS_FROZEN) {
>  	case CPU_ONLINE:
>  	case CPU_DOWN_FAILED:
> -		work_on_cpu(cpu, mips_cdmm_bus_up, &cpu);
> +		mips_cdmm_bus_up(&cpu);
>  		break;
>  	case CPU_DOWN_PREPARE:
> -		work_on_cpu(cpu, mips_cdmm_bus_down, &cpu);
> +		mips_cdmm_bus_down(&cpu);
>  		break;
>  	default:
>  		return NOTIFY_DONE;
>=20

--zhXaljGHf11kAtnf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJXK8HoAAoJEGwLaZPeOHZ6a6wQALRVK6fpbcIXrOCngzj5eWI5
aOVGVjUSPT/ArjguOJjwSRj2hI7hbLoqDPCUXYPAsbt7dWiWl6Il+mRZfWzcSH68
7BDZeAkhjX6d+oXbJ4WJtSVMxTIFJeMwylRxMtUhIwzf/tEpLHO9krGS/MIfOg/d
k9HQU2hiNSABJOEL4AEXzFjYC5Uc85zxj6ZvDJp7KRWRniu221pPn1/pTLKPYFWi
VYHQdBgprJhwjmSSlbD5URggjs+ZahvExhS47bRhzi0tcopAmOPbO/J5zpU+kwUh
lJq3XjvngRcEbDfomXOa8GXK9Yk8ZEoE5OFx56dTc1CW0s8ol/5ptTwfglvxhGyT
aQDVVSaf1fA7Ey2n2SQmg/N8Ju1g7s5ewoc9kchry8x6cMVMFSv4423bD1naeX5P
DXyypH/TdHSorU+YoG8PVFychkOe058Ug2Vwjfcff27Wol3ZdqzCkGiNIfWj/bhr
oyxB798pNOSlebFRZz9bAZVKmcCCqcEy6WmgnfgMlc6hrOIt7yBOocdV76ZHdf0d
GDA8+6EKqnRd31wDT7sCcPQUK9huwwNkOM/9osNDYChsN8foDeOSggsEzJscttDq
lzQin/MqigHyeFTWiNKkOiW1dXniZVmwscxfSM6Ea6PB01oZiR4eUgHNt9WJ17xG
6cSVkMCa64iFqftAC7jd
=6TBg
-----END PGP SIGNATURE-----

--zhXaljGHf11kAtnf--
