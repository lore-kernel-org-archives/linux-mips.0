Received: from mailapp01.imgtec.com ([195.59.15.196]:58689 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23993931AbdHNQS2BGz0D (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 14 Aug 2017 18:18:28 +0200
From: Paul Burton <paul.burton@imgtec.com>
Subject: Re: [PATCH 37/38] irqchip: mips-gic: Use cpumask_first_and() in gic_set_affinity()
Date: Mon, 14 Aug 2017 09:18:18 -0700
Message-ID: <2303810.q0vlmmS52X@np-p-burton>
In-Reply-To: <8af291b4-2cdc-d9aa-88a3-a6c3af856bb4@cogentembedded.com>
References: <20170813043646.25821-1-paul.burton@imgtec.com> <20170813043646.25821-38-paul.burton@imgtec.com> <8af291b4-2cdc-d9aa-88a3-a6c3af856bb4@cogentembedded.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart300565529.n1cbobXRVD";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Return-Path: <Paul.Burton@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: linux-mips@linux-mips.org, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Thomas Gleixner <tglx@linutronix.de>, Ralf Baechle <ralf@linux-mips.org>
Message-ID: <20170814161818.p9w4xAAPkbNPcdIT4Ce2RtGhposx9GpGnxd_rtLS2dI@z>

--nextPart300565529.n1cbobXRVD
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Sergei,

On Sunday, 13 August 2017 02:08:50 PDT Sergei Shtylyov wrote:
> Hello!
> 
> On 8/13/2017 7:36 AM, Paul Burton wrote:
> > Currently in gic_set_affinity() we calculate a temporary cpumask holding
> > the intersection of the provided cpumask & the CPUs that are online,
> > then we call cpumask_first twice on it to find the first such CPU. Since
> > we don't need to temporary cpumask for anything else & we only care
> 
>     s/to/the/?

Indeed - nice to know someone is reading a 38 patch series :)

I'll fix up but leave submitting a v2 until someone asks me to.

Thanks,
    Paul

> 
> > about the first CPU that's both online & in the provided cpumask, we can
> > instead use cpumask_first_and to find that CPU & drop the temporary
> > mask.
> > 
> > Signed-off-by: Paul Burton <paul.burton@imgtec.com>
> > Cc: Jason Cooper <jason@lakedaemon.net>
> > Cc: Marc Zyngier <marc.zyngier@arm.com>
> > Cc: Ralf Baechle <ralf@linux-mips.org>
> > Cc: Thomas Gleixner <tglx@linutronix.de>
> > Cc: linux-mips@linux-mips.org
> 
> [...]
> 
> MBR, Serge


--nextPart300565529.n1cbobXRVD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEELIGR03D5+Fg+69wPgiDZ+mk8HGUFAlmRzUoACgkQgiDZ+mk8
HGVcHg//aq1vE3Meiak/gB1X1jxgOfHA/j0b33c1QUOzqOJmNlBvbgVxTWMSxOmL
kTwoU2OK1fAgcB1ykLJe2A3y6s+KyI4ShXgwr5FT3qjZjwyd2sjJs8ULyC/E1CeU
/qhkKmKPiitKTrwnKzroArxUpAQ0n/2hqDKsrx+7cAy5AiLJADjp41gRJ5+GicHV
XhH9Qzi9YZEtoY1yOpXvWz8hGzWW0qpq6/+EUSHlkvddskYwW8XMF0asF6MSO7bx
1lvbAH2ebMQEANjHiAVA7tO2rcx8ig6N3sXh7xb2+OxWz9ClQ+F5hImipoCTP7yf
o80+kKnvClwDC+rOaKZf4VqCZKHaJdmRK/GmLURqT04iSHn0JSRt3+mI+4O5FKyA
+IpbJYvoYIh9QHZ68KH7l3MmX/KrCeuFP7RkaGcOol+EreuMz1r5tchJ8535ooz/
rhdHdInvqKXLMB1jBl4Be1wSpzuH9Y2+1j2JF5LDV8UXTyV/0gHVPo0cpjNM4zZY
yQwNBI4FSK3hR/axWw8Y+xQa8w11ahQmllY76pCR45zdY32Lo7QYkWcZA1Evpjek
hMwqkdDayRLKit8/5sMTZjzO/eVrCX0hiRTNrdtRJmyWZvKke8UhoJ7N+Y0hNGxl
jM1FZjJ5pMFhE/LsrtVtrc60gnXVPS2jTmqLWk2yGifrrSkW/WM=
=k4Ds
-----END PGP SIGNATURE-----

--nextPart300565529.n1cbobXRVD--
