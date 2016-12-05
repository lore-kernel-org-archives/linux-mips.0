Received: from mailapp01.imgtec.com ([195.59.15.196]:57716 "EHLO
        imgpgp01.kl.imgtec.org" rhost-flags-OK-OK-OK-FAIL)
        by eddie.linux-mips.org with ESMTP id S23992213AbcLER1ZehpmK (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 5 Dec 2016 18:27:25 +0100
From: Paul Burton <paul.burton@imgtec.com>
Subject: Re: [PATCH 3/5] MIPS: Only change $28 to thread_info if coming from user mode
Date: Mon, 5 Dec 2016 17:27:11 +0000
Message-ID: <40031221.jIbnRxB01Q@np-p-burton>
In-Reply-To: <alpine.DEB.2.00.1612051605590.6743@tp.orcam.me.uk>
References: <1480685957-18809-1-git-send-email-matt.redfearn@imgtec.com> <1480685957-18809-4-git-send-email-matt.redfearn@imgtec.com> <alpine.DEB.2.00.1612051605590.6743@tp.orcam.me.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart1953937.a2uVhPrRmM";
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
To: "Maciej W. Rozycki" <macro@imgtec.com>
Cc: Matt Redfearn <matt.redfearn@imgtec.com>, Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org, "Jason A . Donenfeld" <Jason@zx2c4.com>, Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org, James Hogan <james.hogan@imgtec.com>
Message-ID: <20161205172711.p5D8jNQFzQW4ZpIgcdtIZpK29PTpNWVs2NIsHbPvZa0@z>

--nextPart1953937.a2uVhPrRmM
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Maciej,

>  Overall I think all <asm/stackframe.h> code should be using the (default)
> `.set reorder' mode, perhaps forced explicitly in case these macros are
> pasted into `.set noreorder' code, to make it easier to avoid subtle data
> dependency bugs, and also to make R6 porting easier.  Except maybe for the
> RFE sequence, for readability's sake, although even there GAS will do the
> right thing.  Surely the BLTZ/MOVE piece does not have to be `.set
> noreorder' as GAS will schedule that delay slot automatically if allowed
> to.

Agreed we ought to use .set reorder (or rather, not use .set noreorder) 
wherever possible but FYI one thing I've only noticed recently is that we 
don't actually get any reordering anyway, presumably because we don't provide 
any -O flags when building asm source. I haven't yet done the legwork or 
figuring out whether we've ever had optimisation & if so what changed...

Thanks,
    Paul
--nextPart1953937.a2uVhPrRmM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEELIGR03D5+Fg+69wPgiDZ+mk8HGUFAlhFo28ACgkQgiDZ+mk8
HGVCEQ/9GrNOneHNyUO4Z8eogunJmAe6kpSvpHClNaSkC/UJwhDm/b6q+PPYiH1n
KFqAEiWGdEhguWH64LiY0NZwyzyg/6yinfnDBGjq0Tslmw7azNdKDPzOJ+z00Bx8
bwdZRZFZK+ALngY25bTDC6mmM2lHmiQsSK2xS3iQbas4iCIz9yQ/w84Fv3QDjVZa
26bjGTy+stEJz2eJ2L60a44qfAB3NLc/O8oapxEIS5/d4FiLkLXCTBa3GDQJMun8
L92SiuWJVxRYnsjDlAWW1/8ChseFJW51f/VomVYS6gwteOLWiYK3Csk4snBhPEp1
A1UHmMsC6/YeV/u6Esjl7VWdN767FwvPBsrZlqm10U0HkVG6TkU2fdVyQ9IiSmFq
iWaCe8zPOoJvJTUEM8fZLSReK1raAQfijufiaVPrVbPRcZab9Nqm2MHf4gcxvShy
57R5D17E/rAyW67um6thsJuGVPGa2tFuyN8oyyyRSaqvSWm/aW4ehEaAkY21gnLg
1I4dqEeGE2gxv4lvqxqMoQRdNtebn75OaBqPFdOVIirq1rkW51C+yf/XHlcL4zce
v5r5U4Pfkknx5k+DUpz7HoX9eOmVe/tHCuEa4qH0QKCaBVwwLU2DOJCa+r8kx+lf
mDu6PnZJPs1Z6tvDelS3qUUCkQs56qB0V09rarrCr7KQDWrdIxo=
=Pblh
-----END PGP SIGNATURE-----

--nextPart1953937.a2uVhPrRmM--
