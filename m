Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=62.149.156.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793058838;
	b=DaKUib1wWYns61RU+8gan24Qd7I2QT5IFInT5N2njf6mdRKmfnijnhby77wyW6aSM6wb
	 OI5xueoNxO0bEdEEvD7//4ts/BShO0fdyTv5HndjzrzR0JJP7mMuWO3Rp/kZdHxozdiH1
	 DksYAY5K13LFfkqlhbGuLdQSHiaomLx+jNWuQazGMA1e9W9/ril51wCsAgCQ3VR7seaXU
	 ipphbhSVXoFMhzuBqBMdBVR9DZ7MfCmvd+9GhXwwxUcZqXB3eX4MgPhbjDSab+uS2UfcC
	 LGxzRMQbczTBkUipPUXX8QKC3LullV2fMlyiPo8LuvDRbuBOcSz+Rwqjk9pnGam3lSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793058838;
	h=DMARC-Filter:Received:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-CMAE-Envelope;
	bh=+zLzPHUEZEXW6y82jyuBw/xnc6RohWzjfgDA3uNjT2M=;
	b=A2kHnuMOGomomFITE/bRtD/PDGutH1/Ri5YI3hWgGJCy3evfVvA7r+PTKj/9BUTIiOjk
	 myDE6ZAMJwS5lo2Di1fBwxF3wSis4+nLRcvC2M4DTW79Bnt4j/N3GXo1CsS3G0SbhBVyN
	 YPWnJNHjN2wG6I0Xe5HjYWNoWmIE25RBS5P8jJFcOM+gGKVJingpp/XQOzrHBPT3Dfa/G
	 6HxshLJqGN7FH+gR09O7cfTZnL1fVhn1mB53B9p/S6L77privDfV1KrtOtBuAbtTV/Ysr
	 yhSA792pMLZ5rEvA7WL8RGOjUOQqlWzJivPIfEoKXVUiZhJcO2U5weVEybuXj/IXKgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mythread.it;
	spf=pass smtp.mailfrom=mythread.it;
	dkim=pass header.d=mythread.it header.i=@mythread.it header.a=rsa-sha256 header.s=a1 header.b=JNJbq7AC;
	arc=none smtp.remote-ip=62.149.156.101
Received: from smtpcmd10101.aruba.it (smtpcmd10101.aruba.it [62.149.156.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB368606A32F
	for <linux-mips@vger.kernel.org>; Mon, 26 Oct 2026 23:53:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB368606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mythread.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mythread.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mythread.it header.i=@mythread.it header.a=rsa-sha256 header.s=a1 header.b=JNJbq7AC
Received: from [127.0.0.1] ([79.43.52.162])
	by Aruba SMTP with ESMTPSA
	id LUVexsCYFW41bLUVhxjBes; Tue, 27 Oct 2026 00:53:49 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mythread.it; s=a1;
	t=1793058829; bh=xYkuKLvrYMhAaMvR2HnGbB2PYayNisrGA+rKA9q8dS4=;
	h=From:Date:Subject:MIME-Version:Content-Type:To;
	b=JNJbq7ACitcqHLEjBzGQlMwiVcIxtt2znaZVdQBy070uPX27rXEX2M9Zpa92yZXTE
	 REQo8xVIwRsDvGCwCm6rSa3Mx+4jcWuKFY8KKBQcXOI9EX16Je1PnUW5FOlVHNqIW8
	 bOZky+DUoSf1+KvUnQiBX+Hu6RIk3vHd40AIRcDAfM5EKA4KRfCheV4H1+n3tTZE1C
	 HbduuqDiH3lz4EDtL8QvpAedR8BwZBruhNUqR5ZKCGGvd0Rc+XxgMbralEJ6aam3Cr
	 JLja+YUAXR1uw98C7W0YFnLXO0JF/b/TlX42r6WovZlsAyC1Nl4ef7E9E4IZvIb5Vr
	 Y0zvuVUuz9KUA==
From: Alessio Ferri <alessio.ferri@mythread.it>
Date: Tue, 27 Oct 2026 00:53:47 +0100
Subject: [PATCH wireless-next v2 4/8] bcma: chipcommon: enable asynchronous
 GPIO interrupts
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
Message-Id: <20261027-bcma-ac-rev1-v2-4-b69b61c31920@mythread.it>
References: <20261027-bcma-ac-rev1-v2-0-b69b61c31920@mythread.it>
In-Reply-To: <20261027-bcma-ac-rev1-v2-0-b69b61c31920@mythread.it>
To: =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>, 
 Michael Buesch <m@bues.ch>, vit9696 <vit9696@protonmail.com>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mips@vger.kernel.org, Alessio Ferri <alessio.ferri@mythread.it>
X-Mailer: b4 0.15.2
X-CMAE-Envelope: MS4xfJTF5XyttIODpSGvzr+IyNa5pZ6s2Iy93f1vGuHU8PAc+2JXCCQEW+VJahQHRKzZfMSpaIsScInpp4Undro0Spc37izaQYfBvFAPBlQNo89WRv+nuTjG
 kITyRDM9iZU5OIkvS5gbAKWxP+yzx9AmUyCM4B4J/Ww6OaDA1q2rHLMsw9+Uq2JZaeIWm+oOthTEqx8wKINYYwO7d3Z05lIMo06PonQNuFRLWJQ+ANlXqvHd
 K9Ukfqd/gfb1eUrLm7VO3SeEnU6Jm3gSRwK1dwjJ6Wy8FmshmJGvFlTEPLFEA4BT9ROpzH5aI4EOnGaa7P5hE3jv8FFgfdcUNPBn4F3dkUgDbhJuGTFJQ+VV
 d0ZPgj44gQuvpaj6XmirDY1BNwcq8/5Cw5Ts4+wrhM4qYZuaHN4=

Set CORECTL_ASYNCGPIO on chipcommon rev 21 and later, as Broadcom's
driver does at attach, so that GPIO interrupts are generated without the
backplane clock.

Signed-off-by: Alessio Ferri <alessio.ferri@mythread.it>
---
 drivers/bcma/driver_chipcommon.c            | 3 +++
 include/linux/bcma/bcma_driver_chipcommon.h | 1 +
 2 files changed, 4 insertions(+)

diff --git a/drivers/bcma/driver_chipcommon.c b/drivers/bcma/driver_chipcommon.c
index fd91a39f0..f5e1b5415 100644
--- a/drivers/bcma/driver_chipcommon.c
+++ b/drivers/bcma/driver_chipcommon.c
@@ -227,6 +227,9 @@ void bcma_core_chipcommon_init(struct bcma_drv_cc *cc)
 			((leddc_on << BCMA_CC_GPIOTIMER_ONTIME_SHIFT) |
 			 (leddc_off << BCMA_CC_GPIOTIMER_OFFTIME_SHIFT)));
 	}
+
+	if (cc->core->id.rev >= 21)
+		bcma_cc_set32(cc, BCMA_CC_CORECTL, BCMA_CC_CORECTL_ASYNCGPIO);
 	cc->ticks_per_ms = bcma_chipco_watchdog_ticks_per_ms(cc);
 
 	cc->setup_done = true;
diff --git a/include/linux/bcma/bcma_driver_chipcommon.h b/include/linux/bcma/bcma_driver_chipcommon.h
index 45c37b6bd..b761801d6 100644
--- a/include/linux/bcma/bcma_driver_chipcommon.h
+++ b/include/linux/bcma/bcma_driver_chipcommon.h
@@ -54,6 +54,7 @@
 #define BCMA_CC_CORECTL			0x0008
 #define  BCMA_CC_CORECTL_UARTCLK0	0x00000001	/* Drive UART with internal clock */
 #define	 BCMA_CC_CORECTL_SE		0x00000002	/* sync clk out enable (corerev >= 3) */
+#define  BCMA_CC_CORECTL_ASYNCGPIO	0x00000004	/* GPIO IRQs without backplane clock */
 #define  BCMA_CC_CORECTL_UARTCLKEN	0x00000008	/* UART clock enable (rev >= 21) */
 #define BCMA_CC_BIST			0x000C
 #define BCMA_CC_OTPS			0x0010		/* OTP status */

-- 
2.34.1

