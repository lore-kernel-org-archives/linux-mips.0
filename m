Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794239329;
	b=OeBkiSPuRylwC0v9CIQm+cfJ1HZTH1XlJA/At1Lue/08BfJB0TsuzO+z6JG5LOgmYwHs
	 bfDoNGzoDhQ85jQbGdW6+dYQU25X1ZjJDnCQIQu+90GqQIMt4cOU+7OI86PZDoe/2DZwI
	 o+n8jUb84FGQtzQn/QgZYxfUPdJ5exC/Z3N05MAhT6fVb9pzJkqSX6scJuQuB3r+HRFnq
	 BD8oVgsI8fte3ZFK+gOs4IiYjvK8HuHN8xIXm46ahlUdIpWwQQJoflHcGjvLmY9DpoJ5B
	 DmzxxE1cbeP9RZeYt36gdYPYmMrKRMI5nvgCmzu4qRJ8JqnctbqlP28MsAQ+4tjIolA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794239329;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=mw5sGlo+sYSIwlVNPbD+avONLlNpfVW3zWxwZsVrLa4=;
	b=rrsyAiUM/de5BdWMP0QQSvC1fycPnG26Bel96/ZSA9p5McXcM2WmmkqOoEqMvNe796nn
	 390giwGks6gOlTgalSLwUfoXSnFOqhgw1sWIYY78ZQ8z23q5Sm2S19ul8z4qYFtIg/fn1
	 YDK+fMpiybchVc7LIt0gB+so21XzZTAqPzjql3/8F3Oa3HJ6d4THY3G9F1VUrQS4JDHRv
	 he4lj0/cSdQgKFHoquTI0P7kQLYa5tl1l3SU/wE/HY6r5UP9z7tLKHBmnR+4xvZvxExbm
	 CbYPYcM5VNABHhf/OF5J3PY6HWROdQ8oR2iQCPr8LROgVo3FMbSFqXSwqymmHuL286g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=SIW0ISNM;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AB05606A32A
	for <linux-mips@vger.kernel.org>; Mon,  9 Nov 2026 15:48:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9AB05606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=SIW0ISNM
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a2d6d01ecbso6131445e9.0
        for <linux-mips@vger.kernel.org>; Mon, 09 Nov 2026 07:48:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794239326; x=1794844126; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mw5sGlo+sYSIwlVNPbD+avONLlNpfVW3zWxwZsVrLa4=;
        b=SIW0ISNMv2fl1sjufrOFIA6++IPG6f2Tmf9tjvcyL05Y6fdt2IcA1t4pIJelOHchwW
         diLqIkj29FloZ8IiecwCSTRm2dlZ6stxIS5ri80IfFOx1fBKZIClWuuqyI6HzbNJRISc
         LW1P/b7VlxZ+CGq20/avNR8GvQDXk+GEbK2UIwsKsYWRs1+l1iZmeYb5S7oyNdQ/wH69
         DnbA9IM8dtnBvs/BWT4/Eu7/CX+t4HHeJDOb4kfxeeDLS804strMgSsbGtcHBYRj6oA6
         LA5SVoccT5ulZdka0FauV5N+Dk6TgpVQS88oV7pcBQr9uFdxT5RItZUQCw2IdRaw1Kpa
         Ylfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794239326; x=1794844126;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mw5sGlo+sYSIwlVNPbD+avONLlNpfVW3zWxwZsVrLa4=;
        b=yrUU9Ltf6uo+M3sw/IwV/isDtxo25pkaLRWLNTkIztiYFAFgzli6EqGXyjLqRxXlL2
         IHfb3RQ3cm8i1Apm044M5zLv+cDIdt7dpq9MdPnpE7lz1wlXWpj1wolps+zEpWaZki1U
         6km/bpk9CLUVYCbMW48LBGqc3Z/5wnj7k2XSffgkdqnvggTwmkWAAuWkt4d4YUfQmYrW
         rCVYAEZ23W7GasTlKmqPZZWeBtrdF+7iz7cwtsyAsJLoAN6YaikFUI7U+6pELT1TMWGE
         qNpq36GdVUCQm1FacY/kwEFwfymywosc2AvmAgAuXmLzEZQ04a8F1+cGZPr55gVbzbTe
         5r/g==
X-Forwarded-Encrypted: i=1; AL+hErFomvu8QjuccPjlqy0Vm0AaTi4+oIvgbtTGIvreTNixUXmzKGNI2nkPHDN9XEfup0AaZPcQV/JIiaVr@vger.kernel.org
X-Gm-Message-State: APuU4Z9jCsNM9ktCwybe1QZOX1oAetMPxDLZ1CnA8+761PF/NHIAPIus
	0IAKhHogz6e1uKP6Q9hqoZZCjD7CoQYe2/TVAcP9a+wkH/Yl8e0VjfGWWJximorhARs=
X-Gm-Gg: AYBFou17+maWlWIckbSo5ImFqQKYzyR4itUA2KxLloKRpaC0nJl+vmGppbkq5kIUYdn
	UNLLcN9k2hHB2sN3zIV8+BmY1PnbasFHJMpbk81h2DZojQ/yG/4UuNgUapWrSfN5cIov5KVQ4A+
	zonKCtPJRSWBEKSncCmXEZFz0iZKpc3QpUK0PLX784OgDYMmvD+jvHOJ2p7NRm8DvBhLLjsg12x
	qD4WEEEeIKgDBy05CP7iK69uQGJnYm570Z9xiaAv58Rr/RDrngeBPbn5ZgByBcRxVzeiNOOXfaQ
	0+3JBTaQmkzjI+qGFxA0ogCqpaSEnpbbTz8VCdHedGlLFOm8uM8mdHZv5otiJOYFEyhfyFwOMR5
	DJXffH3YVLLNmV6YO4CbT7FCFIEP8dNJzhZlqmXREo2MlKi1tbGEaUbGFsfISs1075b8yENhaM2
	sYy/OxhRnNVfdsYP78KINrlskDssr6CuqepmrLYinSnd+7M3jMgDPS9Ft0F4CxU2vgsH6q+hCQ4
	B4ju97TbSFtesrQuLm7i9PT/62USK/Zd7DBNmE9UyD/xhmHwKPxzL8B3EIZeGny7YRUkhi+Vs/S
	bm+x8evFL098Q/H7zxvV3z9VF2mLQAJd6AyQ9wYoXue0JkecEkPa6Z2KiDcolk1bDha1FNe7lRp
	HIn2oqY5fr6vTvw==
X-Received: by 2002:a05:600c:1c02:b0:4a2:74f:46c1 with SMTP id 5b1f17b1804b1-4b9633cee71mr101104485e9.8.1794239325803;
        Mon, 09 Nov 2026 07:48:45 -0800 (PST)
Received: from localhost (p200300f65f19a90407b2ef73b14b6bb2.dip0.t-ipconnect.de. [2003:f6:5f19:a904:7b2:ef73:b14b:6bb2])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4b96cd012e1sm136079025e9.8.2026.11.09.07.48.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 07:48:45 -0800 (PST)
Date: Mon, 9 Nov 2026 16:48:44 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Sasha Levin <sashal@kernel.org>
Cc: Nicolas Schier <nsc@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Harald Freudenberger <freude@linux.ibm.com>, Holger Dengler <dengler@linux.ibm.com>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Huacai Chen <chenhuacai@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	linux-kbuild@vger.kernel.org, linux-s390@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
	"kernelci.org bot" <bot@kernelci.org>
Subject: Re: [PATCH 1/2] s390/pkey: Include <linux/device-id/ap.h> for struct
 ap_device_id
Message-ID: <avHpQIREsJRjpD3R@monoceros>
References: <cover.1792144769.git.u.kleine-koenig@baylibre.com>
 <179416565740.60865.16102443399828949110.b4-review@b4>
 <66e4ee9c7f9b4bc48fcee92a94b6bb6d92fe1ad2.1794233316.git.sashal@kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="u6xfg7yl6qbdwrvq"
Content-Disposition: inline
In-Reply-To: <66e4ee9c7f9b4bc48fcee92a94b6bb6d92fe1ad2.1794233316.git.sashal@kernel.org>


--u6xfg7yl6qbdwrvq
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 1/2] s390/pkey: Include <linux/device-id/ap.h> for struct
 ap_device_id
MIME-Version: 1.0

On Mon, Nov 09, 2026 at 09:14:40AM -0500, Sasha Levin wrote:
> pkey_cca.c and pkey_ep11.c got struct ap_device_id from
> <linux/mod_devicetable.h> by way of <linux/cpufeature.h>. Commit
> cdfdbc11552b ("Move struct cpu_feature to <linux/cpufeature.h>") dropped
> that include, so s390 defconfig no longer builds:
>=20
>   drivers/s390/crypto/pkey_cca.c:22:28: error: array type has incomplete =
element type 'struct ap_device_id'
>   drivers/s390/crypto/pkey_ep11.c:23:28: error: array type has incomplete=
 element type 'struct ap_device_id'
>=20
> Include the header that defines it, as the other AP drivers do.
>=20
> Reported-by: kernelci.org bot <bot@kernelci.org>
> Closes: https://d.kernelci.org/i/maestro:7baaa311bc9c30a8ad43f42c24225ab2=
fead866a
> Fixes: cdfdbc11552b ("Move struct cpu_feature to <linux/cpufeature.h>")
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
>  drivers/s390/crypto/pkey_cca.c  | 1 +
>  drivers/s390/crypto/pkey_ep11.c | 1 +
>  2 files changed, 2 insertions(+)
>=20
> diff --git a/drivers/s390/crypto/pkey_cca.c b/drivers/s390/crypto/pkey_cc=
a.c
> index e8dc2f77c137b..f95d61fd5b090 100644
> --- a/drivers/s390/crypto/pkey_cca.c
> +++ b/drivers/s390/crypto/pkey_cca.c
> @@ -10,6 +10,7 @@
>  #include <linux/init.h>
>  #include <linux/module.h>
>  #include <linux/cpufeature.h>
> +#include <linux/device-id/ap.h>
> =20
>  #include "zcrypt_ccamisc.h"
>  #include "pkey_base.h"

that makes me wonder why there is an ap MODULE_DEVICE_TABLE in
drivers/s390/crypto/pkey_cca.c while that file doesn't seem to contain a
driver for these device IDs.

> diff --git a/drivers/s390/crypto/pkey_ep11.c b/drivers/s390/crypto/pkey_e=
p11.c
> index f99c19323f3d7..f66fc97ad5adc 100644
> --- a/drivers/s390/crypto/pkey_ep11.c
> +++ b/drivers/s390/crypto/pkey_ep11.c
> @@ -10,6 +10,7 @@
>  #include <linux/init.h>
>  #include <linux/module.h>
>  #include <linux/cpufeature.h>
> +#include <linux/device-id/ap.h>
> =20
>  #include "zcrypt_ccamisc.h"
>  #include "zcrypt_ep11misc.h"

Same here.

But anyhow, as a regression fix the change looks fine.

Acked-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>

Thanks
Uwe

--u6xfg7yl6qbdwrvq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmrx61kACgkQj4D7WH0S
/k7BLwf+KHOasy6UJ5/4WPYsMNz61VCTi/ApkQtjeGFvJZN8nJOMNkjXZZ2m6o/9
v6sXIzuel/mee5ClAKlKfK7LsU6rkl8v5zvt4AUHd5FZ+bcPr+FTgq89uVV7oQ0d
2k8GO1XQsb5tYu13Aq/aVsDMaP3vIVc7F8mx5MLT/kcA4euiH3PcSxMrKoReU11Y
MvhCmuYJdWtaOMURKdiU4wt8gTnC3cSnwRKxt12D7Sx4QwdOA8kGqfzB8n5as7kf
coKuS3VS6T60nd9cjqG8Iz/zF5HdiGqtjXTKP8FyMD0uPwfgu1b0TsZudm5c1lLX
FvCSeYh/1tP74frJy0yYDBJ+tCWQfA==
=JUgK
-----END PGP SIGNATURE-----

--u6xfg7yl6qbdwrvq--
