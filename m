Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=62.149.156.121
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794187084;
	b=zYhjK8GaEMnSmgtvS4KYprbTOIvsUNYjJwn96rJZJ7pte7bjGmjQuZH6jYkAM+ijN9E6
	 c2kcFvNtuntdp6foTcnI5t30eticIX74Hq0xvyvSGvQHjEE2HUUndDoxQIgBqrPGTqxfB
	 8V8qNKe8fvmBNvon4kc6mVZGQnNGQR9h4T17PATRbvuJzoK11SgNn/nCFy2AO+DcLSlBG
	 pvCPrgZ+jrVM4g9dlq7mreYlAKyANtL4E8iYlkzDbvq+Vx1tHQitto7HWPZ4Ip5exd5CD
	 S2dqK+KfMD2+da5k/2OZadJ/lNo1aKuwo9Am9Vk2iF/dV6r9C+7fiwk0jJ3UkAXfm1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794187084;
	h=DMARC-Filter:Received:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-CMAE-Envelope;
	bh=YEqc13wt2HALjaz89i8UrNv1S77qlq72ni9CSRUHi90=;
	b=g5HJnOxOsb8UcuQEeSAIlXGk/Rt32tcGOlxa0gba4WVdMSFN/dJQ2JKgQybKCBlxdqx9
	 HD+oxdH3r90iFf27DdpftYc+L8owPEPzdVj7JGW2tUt2aC1/E9ArCmfLrUNDVTpobAswR
	 +DJw2IkEQmtMpzRap2byPldqsLin6gVJA5IBsi4sTEGCgA8WN2nBoOp+us4biwPd1o/xo
	 eeqt8+ke/TxhSovlvEmi/zTjp+Eqzrrv09A1aShrYuN+7f7U8ZoxxSVdfgfSmUZG4OwlJ
	 /EysD8xP7Qxrkvd0ZyMktmycdtWJXDf1FdtXOr7E+f+RtPY51Il0SbZ4p9yjvDcupBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mythread.it;
	spf=pass smtp.mailfrom=mythread.it;
	dkim=pass header.d=mythread.it header.i=@mythread.it header.a=rsa-sha256 header.s=a1 header.b=MGj3YinP;
	arc=none smtp.remote-ip=62.149.156.121
Received: from smtpcmd11121.aruba.it (smtpcmd11121.aruba.it [62.149.156.121])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E105606D81E
	for <linux-mips@vger.kernel.org>; Mon,  9 Nov 2026 01:18:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E105606D81E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mythread.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mythread.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mythread.it header.i=@mythread.it header.a=rsa-sha256 header.s=a1 header.b=MGj3YinP
Received: from [127.0.0.1] ([87.16.49.252])
	by Aruba SMTP with ESMTPSA
	id QE1AxMsH06VShQE1DxPoxW; Mon, 09 Nov 2026 02:17:55 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mythread.it; s=a1;
	t=1794187075; bh=G+hd6qQfLeLELGBJdeMNPTRelD4TD1iZ3wlVeFjzB6o=;
	h=From:Date:Subject:MIME-Version:Content-Type:To;
	b=MGj3YinPn/xrHtVaZe04poPoBv+hyb6uozi8u0+qHNS3zccwlPIBuasbiWlZKOOlX
	 03G6iiS/vJjiFIlfyLv1PnT4QW+tbM9ht87/NjOK3e1UYOQeKEp72Wt28CRLAjBpl4
	 lTRH2tVJmSx6suP0ybpmQSEbdoXlPUyiNkHL+meZE0piHHAwny9wa/RxiesD1MIEGX
	 qiiz2EwgfZQeZjgntmst8azqkQTBAzO3raQ48PXiU9JOof+fXR6brFdRKEdYklyQ4V
	 +iautpIMDT5BqHpKDeCSy/Lhm6H2mL2JC5e7KiOA80MUXIYZky0sSLfYAzx0+VgJtt
	 A1vWC70gyis0g==
From: Alessio Ferri <alessio.ferri@mythread.it>
Date: Mon, 09 Nov 2026 02:17:58 +0100
Subject: [PATCH wireless-next v4 08/10] firmware: bcm47xx_sprom: read
 boardflags3 from NVRAM over the SPROM
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
Message-Id: <20261109-bcma-ac-rev1-v4-8-de1262c18b54@mythread.it>
References: <20261109-bcma-ac-rev1-v4-0-de1262c18b54@mythread.it>
In-Reply-To: <20261109-bcma-ac-rev1-v4-0-de1262c18b54@mythread.it>
To: =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>, 
 Michael Buesch <m@bues.ch>
Cc: vit9696 <vit9696@protonmail.com>, ville+git@takio.fi, egc112@msn.com, 
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mips@vger.kernel.org, Alessio Ferri <alessio.ferri@mythread.it>, 
 b43-dev@lists.infradead.org
X-Mailer: b4 0.15.2
X-CMAE-Envelope: MS4xfKWjnE3rgRu097RkoPrMJ4MPxysVPF64nqsRxaRlKnggHbOPYLVd9XcCNuAFVy9R604y+t/IyBHWnzCfKnncv95fMU6FS+5VKHSFDHBS0O9kwJWX7Lob
 ptCXaBN4ntFR1EvmyXE0jcPR0A2DQfSOgHtcNN/jCGYjqI583VyMGDRHbVxFBvyTJMkVeiPZv2ZtzMqTD7EOfi8adXMs69O8ZZqIl3u22OU/KSKmhu0Glcpe
 hE6zliytsMNeeBCmC+RtEX2KU5UBmCYYTbw49Uh5g/nwskGuQFJkzxysfnCo5R7Ni/QRd89kUShaeRo4W/KHTBtWvUnEUQVVayt9aoU6yN04gTgYz1aMe4Sn
 DufaRe1wDty1nADLf8tXEqOahMLSYV1YJF9wLdV2R9/U85BpXXksINsklc4WzW+/FLWh3RMphnSy7VaxpJ1NksgtqGdhFanaKQWHOKbCK4pJBFFrOQ8do7rs
 rqjVWvn6/UzNk/Ib2UlJb2oubVW0lE/unCfMJQ==

Read boardflags3 along with ledbh4..ledbh15, so that a value in NVRAM
replaces the word of a SPROM read from the device.

Signed-off-by: Alessio Ferri <alessio.ferri@mythread.it>
---
 drivers/firmware/broadcom/bcm47xx_sprom.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/firmware/broadcom/bcm47xx_sprom.c b/drivers/firmware/broadcom/bcm47xx_sprom.c
index e2c4e3307..7425526c4 100644
--- a/drivers/firmware/broadcom/bcm47xx_sprom.c
+++ b/drivers/firmware/broadcom/bcm47xx_sprom.c
@@ -217,6 +217,9 @@ static void bcm47xx_sprom_fill_nvram_only(struct ssb_sprom *sprom,
 		nvram_read_u8(prefix, NULL, name, &sprom->gpio_ext[i], 0xff,
 			      fallback);
 	}
+
+	nvram_read_u32(prefix, NULL, "boardflags3", &sprom->boardflags3, 0,
+		       fallback);
 }
 
 /* This is one-function-only macro, it uses local "sprom" variable! */

-- 
2.34.1

