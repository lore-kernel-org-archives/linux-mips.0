Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=62.149.156.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793820658;
	b=yx98otA+Pv7kLGNqoTfSAOmGsuzOfyv1FAAPLH/KBppw4mnd0oTGTyhLqHN7B46TtL5F
	 AoZIUg/HhyM562HlKdRa0PDnGo5BWDYuBR1C369G8zSBK1R5TlkCX1dVDmEFtPwfvIK0F
	 nSUJwBc7+9fsB+9CG/BOW5ngljlP044A3WUteaEcS+iF1rfTbuocNn+LwurSKOHBQf2df
	 AWuZAA7YYgHzx/bOizUQONrcBm3Y0SzawKBtXnhoPnWCYe/iRPCczTZpUhRSYf9HJe5mw
	 7Mo5YbAQ4i38dQdv+rAsE8zzNNGli2vwOoQVqlmy6yjmnQBGTcB/ju135vNfFub+bfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793820658;
	h=DMARC-Filter:Received:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-CMAE-Envelope;
	bh=ZFjZwgWXMMUeUImq+nMkn7q20q4nGNcTmulvFIWoIac=;
	b=gmPESY1rTok15WuITSBOyYJ0Y2lNAOh4TdQNgEM2QRcqMAu6lkBXm/IUPx0wNPSQb39+
	 xTxrRTjRxBivdgO1wCJPmbDKtWMqUh+nvZ2duGt5Z3jTl3QiWnEoG9rakY2rwYbBly22t
	 xm56Xkyv80Pe2OFlICFaScLL4QBvO5WM6aeJyMX1IIebSzFgDowMVp6vrUIj9C9j0tKb3
	 WTGoaVCqXR4oujaGi7vmApKT1C+eB/se0weIofQMaw7Tz2qd98q8mp90ZmU/QSl9eLnLq
	 ej1Zy35xjEKEmLaW6EaWWlpqhADhaq5SNO43dKqoMD8WMbkLeS/qa4HHYCqwDNZeHlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mythread.it;
	spf=pass smtp.mailfrom=mythread.it;
	dkim=pass header.d=mythread.it header.i=@mythread.it header.a=rsa-sha256 header.s=a1 header.b=VGbnbn9I;
	arc=none smtp.remote-ip=62.149.156.56
Received: from smtpcmd0756.aruba.it (smtpcmd0756.aruba.it [62.149.156.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B495760952BC
	for <linux-mips@vger.kernel.org>; Wed,  4 Nov 2026 19:30:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B495760952BC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mythread.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mythread.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mythread.it header.i=@mythread.it header.a=rsa-sha256 header.s=a1 header.b=VGbnbn9I
Received: from [192.168.1.237] ([94.34.125.0])
	by Aruba SMTP with ESMTPSA
	id Ogh3xxDlIuuRMOgh4xJX8D; Wed, 04 Nov 2026 20:30:47 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mythread.it; s=a1;
	t=1793820647; bh=S3t5THEPm4Z2y07MGmsk9jSFXBuD/p+MU4aF9dN4Gco=;
	h=From:Date:Subject:MIME-Version:Content-Type:To;
	b=VGbnbn9IEgMKw05F7E+K2cZGyjJqpaVuWN5Xdm35FCz9qBT1tB4vhURl6hcYEQ75Q
	 X5aaQHexC2669zhlWrM9Q/wUt828fY3NSrl62RPOXNjcbKng+y49UxzpDRPNF7ziTZ
	 X4ktORxcSCbiNm/34qfLYi6zql2+3qNbNyNbaIzjizeMbKfPRRySAMz61CjDJTT2xe
	 S+AvjLl+OKePrIbDqD9fXoBu8O3x5rM16NdFNSdfrCERfOJSdx8nP4o+NofGp4+TbM
	 RfWM4qOJ4lElfFqTldXxfTJuHEMXRb0gmdM7nVt4ZFN9Tjj9xkYzBs2kw1dBMLNNxG
	 MjoQ6lXBvhhsA==
From: Alessio Ferri <alessio.ferri@mythread.it>
Date: Wed, 04 Nov 2026 20:30:46 +0100
Subject: [PATCH v4 3/5] bcma: scan: accept wrapper-less cores on
 wrapper-less backplanes
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261104-bcm6362-wlan-v4-3-f001f6d75dc3@mythread.it>
References: <20261104-bcm6362-wlan-v4-0-f001f6d75dc3@mythread.it>
In-Reply-To: <20261104-bcm6362-wlan-v4-0-f001f6d75dc3@mythread.it>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Jonas Gorski <jonas.gorski@gmail.com>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, 
 Alessio Ferri <alessio.ferri@mythread.it>
X-Mailer: b4 0.14.3
X-CMAE-Envelope: MS4xfBvkpWepbH7IU9x6gOlcj2XdseRrzIEwzb8aMq9Ie9uZi12I486TIMfZq51vhX63e5Jkoijj9q3DFpapXqB7SAE/cGbhf1JOjRdHXt1KHRrQjv4HvgX7
 a2bhn/2Mt7wiWjSdUPCUJoFsIh0SaMOOmifuPAAnzzPnBpkMCmKv68cj7qByu8X2F7+MAqabVLBdwah15tr9nPXAnZRjBmTNhv3+Q7NYFhYmMhwkYUnuMKsl
 iYt/pKbevs+YSC3tNq/R0Tgo1aY6Q2h47we/NOfJ5gGSitnGVZYyNhD8dNDHbN7UEe3t/onYdmSbeDZY+KBCFNWcc48pKnKBL5KXeiFQN18KgiD/OdOUgMAn
 30xmGiSOKg/k78firSUfV2VAyeg/UPaPMKk5/57Q51oFqZOUU5Vbiy4pxAoZIwUaFQTU4RbPC0Uy2KCJtOF7C4AkBdzd2sjPuUoRwBJwY4Vs+M/O0iVaylVY
 MUF6kkr0sxPe+2BDqQp3PpNJ9RmSBeDjsC2zoAL8Biw5V1A8fsY6mianKpCFbItWDiZvqPb3esRnpQ52TtOzF5+Av4EPNxA0evbhG8B235dxlbYgNJ0DAImg
 AogSxD7bUubk9Wenez8RMtlZ70BebuhviSzfHzmSnzi+bsKPf4zmDDLzUZ3hWpGVw0uVsN+5qa8hRIsxqA8UUpCkiPiIwzXQpt6ZPo4VJl/dZA==

The scan drops every component that publishes no master or slave
wrapper in the EROM (NMW = NSW = 0), apart from a few known cores,
because without a wrapper bcma has no agent registers to gate and
crash. Since usually bcma is loaded early, it ends as a loop-crash.

Some backplanes, such as the integrated WLAN of the BCM6362, have
no wrappers on any core. ChipCommon and the 802.11 core are gated
through a SoC-level register block owned by the host driver, whose
aread32/awrite32 ops emulate the agent registers, and core 0x837
needs no gating.

Add a wrapperless flag to struct bcma_bus, set by the host driver
before bcma_init_bus(), and accept these cores without wrappers when
it is set. Other hosts keep rejecting them.

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
Signed-off-by: Alessio Ferri <alessio.ferri@mythread.it>
---
 drivers/bcma/scan.c       | 6 ++++++
 include/linux/bcma/bcma.h | 2 ++
 2 files changed, 8 insertions(+)

diff --git a/drivers/bcma/scan.c b/drivers/bcma/scan.c
index 983a62ddeebb..ef880b635971 100644
--- a/drivers/bcma/scan.c
+++ b/drivers/bcma/scan.c
@@ -318,6 +318,12 @@ static int bcma_get_next_core(struct bcma_bus *bus, u32 __iomem **eromptr,
 		case BCMA_CORE_GCI:
 		/* Not used yet: case BCMA_CORE_OOB_ROUTER: */
 			break;
+		case BCMA_CORE_CHIPCOMMON:
+		case BCMA_CORE_80211:
+		case BCMA_CORE_SHIM:
+			if (bus->wrapperless)
+				break;
+			fallthrough;
 		default:
 			bcma_erom_skip_component(bus, eromptr);
 			return -ENXIO;
diff --git a/include/linux/bcma/bcma.h b/include/linux/bcma/bcma.h
index 7ab2b21e7238..5dcf877e2872 100644
--- a/include/linux/bcma/bcma.h
+++ b/include/linux/bcma/bcma.h
@@ -365,6 +365,8 @@ struct bcma_bus {
 
 	/* Backplane registers, EROM included, are big-endian */
 	bool big_endian;
+	/* Cores have no DMP wrappers, the host ops handle agent accesses */
+	bool wrapperless;
 };
 
 static inline u32 bcma_read8(struct bcma_device *core, u16 offset)

-- 
2.56.0

