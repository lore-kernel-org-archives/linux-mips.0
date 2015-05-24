Received: from mailapp01.imgtec.com ([195.59.15.196]:35032 "EHLO
        imgpgp01.kl.imgtec.org" rhost-flags-OK-OK-OK-FAIL)
        by eddie.linux-mips.org with ESMTP id S27006775AbbEXPCzi9omr (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Sun, 24 May 2015 17:02:55 +0200
Date: Sun, 24 May 2015 16:02:48 +0100
From: Paul Burton <paul.burton@imgtec.com>
Subject: Re: [PATCH v4 28/37] MIPS, clk: move jz4740 UDC auto suspend
 functions to jz4740-cgu
Message-ID: <20150524150248.GQ13811@NP-P-BURTON>
References: <1429881457-16016-1-git-send-email-paul.burton@imgtec.com>
 <1429881457-16016-29-git-send-email-paul.burton@imgtec.com>
 <20150513030652.20636.98939@quantum>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="GLp9dJVi+aaipsRk"
Content-Disposition: inline
In-Reply-To: <20150513030652.20636.98939@quantum>
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
To: Michael Turquette <mturquette@linaro.org>, Lars-Peter Clausen <lars@metafoo.de>
Cc: linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>, Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org
Message-ID: <20150524150248.yfHfhmfjxA93IEnZ3tHwU72SSTNSqMsKj8KxoKw1m50@z>

--GLp9dJVi+aaipsRk
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 12, 2015 at 08:06:52PM -0700, Michael Turquette wrote:
> Hi Paul,
>=20
> Quoting Paul Burton (2015-04-24 06:17:28)
> > -void jz4740_clock_udc_disable_auto_suspend(void)
> > -{
> > -       jz_clk_reg_clear_bits(JZ_REG_CLOCK_GATE, JZ_CLOCK_GATE_UDC);
> > -}
> > -EXPORT_SYMBOL_GPL(jz4740_clock_udc_disable_auto_suspend);
> > -
> > -void jz4740_clock_udc_enable_auto_suspend(void)
> > -{
> > -       jz_clk_reg_set_bits(JZ_REG_CLOCK_GATE, JZ_CLOCK_GATE_UDC);
> > -}
> > -EXPORT_SYMBOL_GPL(jz4740_clock_udc_enable_auto_suspend);
>=20
> I couldn't find a caller for these functions. Where and how are they
> used?
>=20
> Thanks,
> Mike

Good question. Lars?

Thanks,
    Paul

--GLp9dJVi+aaipsRk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVYegYAAoJENzvn0paErs5D3wP/AhhX9azBUwBrfK8XxL5bDkN
IBTaa04qBr8wXtgQsswtViqDUP8jB2DPT+9UrH1h6HbrDHWpjc4f4ED6J4DS8Iad
5oYyJivTC6G8Te8tj6n7Bgnq56aTMtGEZqy5NL0WbCUirbFof+1+chqEDLLCNWL3
HwLVzqeC212KmPN14q+3Cif1cSSwUCr5eU01MJ7H2RCTq8BVH7wofcoTe7auebui
ai5UlvWmh7pmrtjsVZKtZkhWtcerGgEMRt4HGI4Jyea56jxJK23AOW2n8yuHL/71
tervek0i2YwM9VrjHDzEeSvJMyWRnkdHbt0N4fZ8oy1knhnqdyqJCkanwhCICmLK
qxJwvByeNc7wSEIyOpfBadXk2c0dXQrWNr2uISEumJBLpQ9sPPv2mIipZ3R1Iyga
I/ufzKf/0BXaCzCPW6MH784XKpzDgYlX7HuMAbZR39C8vjSHR7cskV3x4EGWIxA4
eSosmrNIhXlj0l/PymNGPGU0AgXvKyPRNiownJ7onPAuEXeUFP+/ciCtOrrDC+H1
o7dK5LLnv+j/Pi59tYofa3RlHmugGvTOvAjDl1+yAPqsIr1+rXRVFM0Zs0ucs16e
yC6uQx8iHoEJri1SUsx5okn4lH5CpV7feynhpJ1y74+fYa4ORRSF1IQuu472rj+q
vD6jl/8GAiuMAqdmeH58
=Rv2T
-----END PGP SIGNATURE-----

--GLp9dJVi+aaipsRk--
