Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.119.170.32
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792971721;
	b=LIVcXPbjya9tviIktxiykIAqD11dPVF1flyBWbFSeqVJsbexX+anExuaRsAgQLT1ZXt/
	 hJ2D7AS2S+d0VjgmJziAJ0x4yA8mpTIO0FMxNTWWMGCX/+AQHr52j6CSnFL9nrgKtP+09
	 HN5DqXU5Wy0VqxkCi0Ju4jKCnMsl9p5kabKmFJpCd1yqLv+1Yhy+b2tnt8pFBLtWhkUJQ
	 quEIGUbAVS9wiS4Q95C8y04wF0tJexRhoUMktjJqYAo8oDPmJnTSZaLc4p1U1EiaY2eBn
	 mrjdYJ+xVQj5pc5kaXVpVbhrW2G2h94NK7mjkbFo/KbxvTwxXd13aIfbdw7C8FqhlZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792971721;
	h=DMARC-Filter:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Autocrypt:Content-Type:Content-Transfer-Encoding:
	 MIME-Version;
	bh=UvpkNdofNcORp/+nKrUhMJFvycWlzFIV8ydP42YGg9o=;
	b=GEKsQ/Y+LAwiDPUv9N5L1JZDyFyXgSWDTby12mpVVm7VTosKDuSCAnJA/2jWKF5qNMHn
	 OG5DA8MC2BP27a6xOXhrMM8TFltDkBM5iveyWltNhHBeeZUDNhDiWkRAfV4ZVVuiuoB3g
	 lCIxOviXB3CfIqatj8CUaiBdFtoDN3wFwR0p/qmlFBGibE4r/qDxBYW94TAOzU+rCWqeK
	 6dBidIGspehB1b86m9FcgamW46DmJ4qLb2u2z2mt9tWwguYGY7JFRwf0PMIvocioDhEWb
	 B145QekCzda35245fK17FmZ+fIymsKTjpGHAAcHvYvyku9EiRtP2Kpw/rQiN/eTgwaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=crapouillou.net;
	spf=pass smtp.mailfrom=crapouillou.net;
	arc=none smtp.remote-ip=185.119.170.32
Received: from aposti.net (aposti.net [185.119.170.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06FA0606A31A;
	Sun, 25 Oct 2026 23:42:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06FA0606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=crapouillou.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crapouillou.net
Message-ID: <089587a1ac49395ef5d15b59c5ff5c9bf8ab68f6.camel@crapouillou.net>
Subject: Re: [PATCH 1/6] MIPS: Ingenic: Fix inverted MIPS_NO_APPENDED_DTB
 logic in Kconfig
From: Paul Cercueil <paul@crapouillou.net>
To: "H. Nikolaus Schaller" <hns@goldelico.com>, Thomas Bogendoerfer	
 <tsbogend@alpha.franken.de>, Paul Burton <paulburton@kernel.org>, "Maciej
 W. Rozycki" <macro@orcam.me.uk>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
	letux-kernel@openphoenux.org, kernel@pyra-handheld.com
Date: Mon, 26 Oct 2026 00:41:53 +0100
In-Reply-To: <7733ca05b6a245e5a9ad414cc754ccc9ece6dc85.1792956055.git.hns@goldelico.com>
References: <cover.1792956055.git.hns@goldelico.com>
	 <7733ca05b6a245e5a9ad414cc754ccc9ece6dc85.1792956055.git.hns@goldelico.com>
Autocrypt: addr=paul@crapouillou.net; prefer-encrypt=mutual;
 keydata=mQENBF0KhcEBCADkfmrzdTOp/gFOMQX0QwKE2WgeCJiHPWkpEuPH81/HB2dpjPZNW03ZM
 LQfECbbaEkdbN4YnPfXgcc1uBe5mwOAPV1MBlaZcEt4M67iYQwSNrP7maPS3IaQJ18ES8JJ5Uf5Uz
 FZaUawgH+oipYGW+v31cX6L3k+dGsPRM0Pyo0sQt52fsopNPZ9iag0iY7dGNuKenaEqkYNjwEgTtN
 z8dt6s3hMpHIKZFL3OhAGi88wF/21isv0zkF4J0wlf9gYUTEEY3Eulx80PTVqGIcHZzfavlWIdzhe
 +rxHTDGVwseR2Y1WjgFGQ2F+vXetAB8NEeygXee+i9nY5qt9c07m8mzjABEBAAG0JFBhdWwgQ2VyY
 3VlaWwgPHBhdWxAY3JhcG91aWxsb3UubmV0PokBTgQTAQoAOBYhBNdHYd8OeCBwpMuVxnPua9InSr
 1BBQJdCoXBAhsDBQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAAAoJEHPua9InSr1BgvIH/0kLyrI3V0f
 33a6D3BJwc1grbygPVYGuC5l5eMnAI+rDmLR19E2yvibRpgUc87NmPEQPpbbtAZt8On/2WZoE5OIP
 dlId/AHNpdgAtGXo0ZX4LGeVPjxjdkbrKVHxbcdcnY+zzaFglpbVSvp76pxqgVg8PgxkAAeeJV+ET
 4t0823Gz2HzCL/6JZhvKAEtHVulOWoBh368SYdolp1TSfORWmHzvQiCCCA+j0cMkYVGzIQzEQhX7U
 rf9N/nhU5/SGLFEi9DcBfXoGzhyQyLXflhJtKm3XGB1K/pPulbKaPcKAl6rIDWPuFpHkSbmZ9r4KF
 lBwgAhlGy6nqP7O3u7q23hRU=
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi Nikolaus,

Le dimanche 25 octobre 2026 =C3=A0 20:20 +0100, H. Nikolaus Schaller a
=C3=A9crit=C2=A0:
> Correct the inverted conditional selection of BUILTIN_DTB for
> MACH_INGENIC.
>=20
> Currently, the Kconfig logic forcefully selects BUILTIN_DTB when
> MIPS_NO_APPENDED_DTB is enabled (i.e., when no DTB should be appended
> to the image). This unintended behavior prevents turning off the
> built-in DTB fallback, which is required when the kernel should use
> a DTB provided directly by the bootloader.
>=20
> Fix this by reversing the polarity using the logical NOT operator.
>=20
> Fixes: f0f4a753079c ("MIPS: generic: Add support for Ingenic SoCs")
> Fixes: 15205fc05482 ("MIPS: ingenic: Add support for appended
> devicetree")
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>

The original code is not an 'unintended behaviour', it works as it was
designed to work: if the kernel is not configured for an appended DTB,
then a DTB should be built-in. This is because on Ingenic SoCs at
least, at the time this code was written no bootloader was passing the
DTB to the kernel.

I understand your usecase (which is very reasonnable) but this fix as-
is only fixes things for you, while breaking every other board.

I'd suggest to fix it by adding a proper description to BUILTIN_DTB (so
that it can be selected from the UI or a defconfig), then update all
arch/mips/configs/ for Ingenic based boards to enable
CONFIG_BUILTIN_DTB=3Dy unless they rely on the appended DTB
functionality. Then this "select BUILTIN_DTB if MIPS_NO_APPENDED_DTB"
Kconfig dependency can be retired.

Cheers,
-Paul
