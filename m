Received: from mailapp01.imgtec.com ([195.59.15.196]:45218 "EHLO
        imgpgp01.kl.imgtec.org" rhost-flags-OK-OK-OK-FAIL)
        by eddie.linux-mips.org with ESMTP id S23993942AbdF0Wd7CUOBb (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 28 Jun 2017 00:33:59 +0200
Date: Tue, 27 Jun 2017 23:33:52 +0100
From: James Hogan <james.hogan@imgtec.com>
Subject: Re: [PATCH 7/7] MIPS: uaccess: Use standard __user_copy* function
 calls
Message-ID: <20170627223352.GI31455@jhogan-linux.le.imgtec.org>
References: <20161107111802.12071-1-paul.burton@imgtec.com>
 <20161107111802.12071-8-paul.burton@imgtec.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="VkVuOCYP9O7H3CXI"
Content-Disposition: inline
In-Reply-To: <20161107111802.12071-8-paul.burton@imgtec.com>
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
Cc: linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>
Message-ID: <20170627223352.IOO3FwxjHS2TdkWjtwSFhXSTn39Mj6_9m9xHeGMqVEA@z>

--VkVuOCYP9O7H3CXI
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Paul,

On Mon, Nov 07, 2016 at 11:18:02AM +0000, Paul Burton wrote:
> -#define __invoke_copy_from_user(to, from, n)				\
> -({									\
> -	register long __cu_ret_r __asm__("$2");				\
> -	register void *__cu_to_r __asm__("$4");				\
> -	register const void __user *__cu_from_r __asm__("$5");		\
> -	register long __cu_len_r __asm__("$6");				\
> -									\
> -	__cu_to_r = (to);						\
> -	__cu_from_r = (from);						\
> -	__cu_len_r = (n);						\
> -	__asm__ __volatile__(						\
> -	".set\tnoreorder\n\t"						\
> -	__MODULE_JAL(__copy_user)					\
> -	".set\tnoat\n\t"						\
> -	__UA_ADDU "\t$7, %1, %2\n\t"					\

I believe __UA_ADDU is no longer used, so could now be removed from the
top of uaccess.h.

Cheers
James

--VkVuOCYP9O7H3CXI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEd80NauSabkiESfLYbAtpk944dnoFAllS3UUACgkQbAtpk944
dnq9JxAAt7oa8QlMygd8VYnzJN6kclMjFpHYme/IAMSPZLePuRWFTm09aXwc8lHy
Vjeu1oBFU8vyjZoST1bBrtvJGMg6T8Fpp2h7GNVYr7dcUBp6E1FmuliBa4Kedky8
VFCEi7t/h+RRUiVVJbTqlPXs/bT+Xxr1u9QC/9mPYwzLIKEc6C5q1m+dhA8lJ6wK
UAYrUVw6Lygc+pxHnGhPVc+ws+afA8ez2TZHj/SPzkEO7CmoSR721E6t3CS2pZRh
X3XM21uTm1dV10NgtiSFq5ih/wEXGvMbUAlQCmbW0NjvumkIVgVtHJJLmlLDpp1G
zvIrndEPKpr4EvAtk777pkNKdQUkDiFzjAnNUcPFdHPryX23KT+ewGv24oxyUaz1
zfX/TmM5h83LceaXGC1JOGuZxwOknV63UhinjnjGCE4S/+8ZW7FJuyXUUShZyqIi
nKHU8kjO/9SEyBbIMCA1NB1yYPrcFiNCWu+h30AhSYyVMfep+Rzwd5ooYVvI7alq
IFnOJj2fRZPSStb5HsXW0pjIQWpAZw3R2/74Xawt8hjVvyzWv5E1lSgR7soISw2G
XhutvNG3hRY5lCRSvcv0FrHJG3FKT+vLvA10znRCfetDdGQpFItqoJExSKaetOGT
rEz2YafUIu6s+UiIYd6EsKypSeZLBJRIKDvCjqAm5afJOTHc9JU=
=M1QJ
-----END PGP SIGNATURE-----

--VkVuOCYP9O7H3CXI--
