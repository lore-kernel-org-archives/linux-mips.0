Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=81.169.146.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792956086;
	b=TQPlMmBVrDtYoj5Hty/47doJZhgaPeyWzFKHMaHs/nPzQu+Pn6aEzaqpEnJKjQEbAasK
	 Jwp+8iPGQ20S4ep9VJE0k8Do2bYZS4rFBHAKG2kbuPpPPCVKkhAZppDdNAO30FpyedN50
	 YYAJqYnkWAxaAUDfT4k9iSRaF44g+VjCNXhb4KrfsHg+XbCrOOZT6FkIPaPqTyGWdUINH
	 aHSUFJJYaakSwSvuf+ibYW+kcbsWKihTTheDIeTFt9ntVQr445MSm+5QI/PajDqCDjmPO
	 sPhxZaas3wPoY0JlIveMzg1otUTMNisbVEPOcrJazlNLasiCPpDq3n+aU0uU25yzALw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792956086;
	h=DMARC-Filter:X-RZG-CLASS-ID:DKIM-Signature:DKIM-Signature:X-RZG-AUTH:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:Content-Type;
	bh=kBErXiEOP/79beVj5W4B4d4p4pEbYxNmlg1r35zfpIM=;
	b=Q/ktna7pJE1b1fhd0KDeT30mgJHEIeNVuwEqiwG6tCLGFc+V5OzpQ/ls1hprbg23I4y+
	 HmQsWL5npPAaI8jgxwJCutlMqVJExzgDf9MDVJgnkL+PVucwH9psu/VgK5c9zZ0A7umvE
	 4ERSI4HSkQGq/+OouXQDM3nN4QT7STUysiQ8gVVsH1zP1fulwafeJEDo3N/X8ZY8qGn7y
	 8W6YIcC9zlnb63l4VRe+FiOcvcpe5gMNfd2XTYi8hS/cqDaTxAUDsstJ8kmCAwtBeK+lU
	 GpkLhDsh6AJ0HV9vFPns0kTfqMX7nGJWxpys8usUh+zA59KzTbOx+uHUMuSui/84TxA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=goldelico.com;
	spf=pass smtp.mailfrom=goldelico.com;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=FJzRl1Co;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=eU1+7+Bc;
	arc=pass header.oldest-pass=0 smtp.remote-ip=81.169.146.175
Received: from mo4-p03-ob.smtp.rzone.de (mo4-p03-ob.smtp.rzone.de [81.169.146.175])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5DC1606A325;
	Sun, 25 Oct 2026 19:21:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5DC1606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=goldelico.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goldelico.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=FJzRl1Co;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=eU1+7+Bc
ARC-Seal: i=1; a=rsa-sha256; t=1792956062; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=huiKNMqQnKGIu/pJm0b+rN+GDGAPO2cqXE6xFEck7mD1iAKG9kI/AY4gHbLkg2Xqix
    maUnJq3JG09rznZEPBYZ2rLlhcdTZE77oKQ1zq+XHplaqXDZZoOk95V+Ec4zrotcZe+o
    zDPHQQmifamGqoJw1DM48R6JyDpZvHpv0dbbMfzbGT6RjStqk9eSAXMTeUiecjormj7O
    O9w1R3I3MZilvb9imvziA+58IvI2owSiF7BJ4hoa45sDR5J7de3w5Zr9LldDQiBBYIvI
    Z4w8a48RtClv+1I78MmCe8hvmZux3noMMTAoJHeElAy4vPnwhbikwk5Exn6CiluHD56T
    mh0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1792956062;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=kBErXiEOP/79beVj5W4B4d4p4pEbYxNmlg1r35zfpIM=;
    b=oBuCEEl5svfrwaCDW3AdZ84dcXbEjbCc51HrkNTdBIEag9OAO5etbAyX8e6IkN2DLY
    MK4DydbidlVF2CrSIsu0dsXAQk6tIqeQhrsLhbuaLjGBWPoqfgQ4PUUNGs3i5KUsQslZ
    zXEzB1AeNwW1yFAMPhg9tRx0ZE7VMVQBb7lnXyQTkVA/QLHMuSCpDsK6V/3eKv35wCch
    Rdqt5q+76jdGgrJj6zMCljfeFLo89KKCHlygXxo1paaPYTD1riDcxngaYB4GSTuisXU8
    lcy87w+Y1cx1tq8dN646XeI+SZPicHYgGFDoBpetBr8KVVOO/CW5lSaJqWNp9PFu65QT
    Tv9g==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo03
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1792956062;
    s=strato-dkim-0002; d=goldelico.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=kBErXiEOP/79beVj5W4B4d4p4pEbYxNmlg1r35zfpIM=;
    b=FJzRl1CoMNU0fFYtk08VlZ0Z5bIpDRRieWdMgK9cO+CmG7dWsbDILU6GuzIJGHvFs3
    epRPXJqHus2wV9OhPgdK09tn1FG8jZ9GceZYWDJ8a+FrWxPscDqmyiJEMB0M37W9rj/Y
    NrwFbD5iOTNxr6zKu7cJUeNNGriaKubV0nsH1B+d1ww+lY6egIuMirr2Xo4eo5IlHt4K
    ZeeMzVf4MqV90DQN0ewG2+5HgWfm9r6N2CTGAw8djLFPn7+imhMjVONfuRCbni6LW9E3
    ta5n0J4Zm/bgoGjQnkbl832itDEbW7kBG18uuLRy3Qqpjm1sUR0XW9yQLK4GDqLKkujM
    lpUw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1792956062;
    s=strato-dkim-0003; d=goldelico.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=kBErXiEOP/79beVj5W4B4d4p4pEbYxNmlg1r35zfpIM=;
    b=eU1+7+BcS98J0wwwckWVrbcDR33yMvnl/RGuUZi4ax3YMFjspGbl8NDaN9UdeujqLW
    9YNHKJNxLg4uQui2a8DQ==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9qVpwcQVkPW4I1HrS2poNy8iNoc+LWkugLIF0fnfvFgpgbBBt2w=="
Received: from iMac.fritz.box
    by smtp.strato.de (RZmta 55.6.3 AUTH)
    with ESMTPSA id Qb56a229PJL2zRC
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Sun, 25 Oct 2026 20:21:02 +0100 (CET)
From: "H. Nikolaus Schaller" <hns@goldelico.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Paul Cercueil <paul@crapouillou.net>,
	Paul Burton <paulburton@kernel.org>,
	"Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	letux-kernel@openphoenux.org,
	kernel@pyra-handheld.com,
	"H. Nikolaus Schaller" <hns@goldelico.com>
Subject: [PATCH 1/6] MIPS: Ingenic: Fix inverted MIPS_NO_APPENDED_DTB logic in Kconfig
Date: Sun, 25 Oct 2026 20:20:50 +0100
Message-ID: <7733ca05b6a245e5a9ad414cc754ccc9ece6dc85.1792956055.git.hns@goldelico.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <cover.1792956055.git.hns@goldelico.com>
References: <cover.1792956055.git.hns@goldelico.com>
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="us-ascii"

Correct the inverted conditional selection of BUILTIN_DTB for
MACH_INGENIC.

Currently, the Kconfig logic forcefully selects BUILTIN_DTB when
MIPS_NO_APPENDED_DTB is enabled (i.e., when no DTB should be appended
to the image). This unintended behavior prevents turning off the
built-in DTB fallback, which is required when the kernel should use
a DTB provided directly by the bootloader.

Fix this by reversing the polarity using the logical NOT operator.

Fixes: f0f4a753079c ("MIPS: generic: Add support for Ingenic SoCs")
Fixes: 15205fc05482 ("MIPS: ingenic: Add support for appended devicetree")
Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 arch/mips/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index d7c67cebe065f..702e2cde68eba 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -128,7 +128,7 @@ config MACH_INGENIC
 	select GPIOLIB
 	select COMMON_CLK
 	select GENERIC_IRQ_CHIP
-	select BUILTIN_DTB if MIPS_NO_APPENDED_DTB
+	select BUILTIN_DTB if !MIPS_NO_APPENDED_DTB
 	select USE_OF
 	select CPU_SUPPORTS_CPUFREQ
 	select MIPS_EXTERNAL_TIMER
-- 
2.56.0

