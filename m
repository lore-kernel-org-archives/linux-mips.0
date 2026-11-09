Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=62.149.156.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794187083;
	b=n64IlTq7Zyo0PbieAvmyBfrFbbTe6qL5RXR10V0KhMzGGlgDVkWzPKn+hGlwi9rXM5Kd
	 qXjPuD241RLGRccQsBF97fqU4Fv/z9slcb6DqWZvJOMvMl3Ayb6MH5bhz8BGWZKE2VVg2
	 URmOHW5K95aFE7QmoFx3pa8yIrZiHk+vofw+DvOSXLLuBb0LkBI86vu2hCw0j6nBzobdp
	 j4mnQl4jCnPv4qzh2zTKrRu84Vq2VMwje91gyKC/afdPmU8pTSKtwwpSeseWwzB/m/bey
	 PxIJrxYpYQD4+Hf+8M+rSkL4tJBOWLIT4r5ARFFs1nXsPZKT90Tiga/kT5Xpz8CEnyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794187083;
	h=DMARC-Filter:Received:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-CMAE-Envelope;
	bh=L9yVg9Dns9TXyCl3tZh58imRF0IzhV3F6rzySjd7bsY=;
	b=dPznQAEMi9ntZyLaU1l1MSocRG4PYrDMGCIZJjweLAHkDZ+GSjBstXiAZPi0E9mcNStk
	 kOz1OqqY435NoUXwiZKmfGf9Ml22I/Ek1NezE5DOMET7qvL5SHYHGd5/bS/HN1t2fFqJz
	 oFPuY6KHL6x/0FkhexU8Njf2wvFA2KvI95KcZjn5JVbWS4yxOqZEWPydSDa0BdOSftqPA
	 w4zJh0q3uUhbp0YVygoHoq5sW4iYNgHzr8hsHg5flARa2uginPUgwAD6gWLFsAwp9XHNK
	 ByByHDyYtIpbQjubOKp1AkJ4+ARmqRbBxrbXlqbGpkoHG+juIiZWJER31ctQb2kJvvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mythread.it;
	spf=pass smtp.mailfrom=mythread.it;
	dkim=pass header.d=mythread.it header.i=@mythread.it header.a=rsa-sha256 header.s=a1 header.b=mhp8J9i3;
	arc=none smtp.remote-ip=62.149.156.116
Received: from smtpcmd11116.aruba.it (smtpcmd11116.aruba.it [62.149.156.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 821A4606A33C
	for <linux-mips@vger.kernel.org>; Mon,  9 Nov 2026 01:18:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 821A4606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mythread.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mythread.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mythread.it header.i=@mythread.it header.a=rsa-sha256 header.s=a1 header.b=mhp8J9i3
Received: from [127.0.0.1] ([87.16.49.252])
	by Aruba SMTP with ESMTPSA
	id QE1AxMsH06VShQE1CxPowp; Mon, 09 Nov 2026 02:17:55 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mythread.it; s=a1;
	t=1794187075; bh=bjvPV3NSTCVSNl0OtlPJZDSOPt/osUZq1yYCSFkkiKM=;
	h=From:Date:Subject:MIME-Version:Content-Type:To;
	b=mhp8J9i3VW0ckOXQFCxsMaxsVrQmSyBva6pnrCbQw+zI0SWUJfjsKpg9b/wbUfvVH
	 rA5oJcA8H/BribghHPIxT7TLjHzSZEa4LdEL8V0ESPdOTVUTpkUtz2d1xF65dAgLN8
	 3VxtL7LfxOJ4bonitSxrZw0aKPoteKom0BEW+0X1JTDi0XCjCp46I08MZmwBnBEh2x
	 hCBqiXpgKTHisFYVw88y238IJJn8EpvQSA8+V5SbcYd639WVomHNXcNYb3j0yxr/+F
	 dHCD0Sj1DRXpx8C9ougfaimluNXKiL99AwYkRdoDSE7fWhbJMhm1k/yuNi8dw7Wko2
	 GoU1l3grFYUsA==
From: Alessio Ferri <alessio.ferri@mythread.it>
Date: Mon, 09 Nov 2026 02:17:56 +0100
Subject: [PATCH wireless-next v4 06/10] firmware: bcm47xx_sprom: read the
 SPROM revision 11 fields from NVRAM
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
Message-Id: <20261109-bcma-ac-rev1-v4-6-de1262c18b54@mythread.it>
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

For sromrev=11, read from NVRAM the fields bcma_sprom_extract_r11()
fills, under the names Broadcom's driver uses: the scalars along with
the other revision-dependent entries, and the per-chain power info, rx
gains and power detector offsets, tssifloor5g and the antenna gain in
bcm47xx_fill_sprom_path_r11(). Read there the rx gain errors and noise
levels too, which rev 11 keeps per chain, with one list for the 5 GHz
sub-bands. A list is taken only if it parses whole.

Boards that keep the SPROM of their radios in NVRAM, such as Northstar
routers with BCM4360, get these fields through the SPROM fallback.

Signed-off-by: Alessio Ferri <alessio.ferri@mythread.it>
---
 drivers/firmware/broadcom/bcm47xx_sprom.c | 168 +++++++++++++++++++++++++++++-
 1 file changed, 166 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/broadcom/bcm47xx_sprom.c b/drivers/firmware/broadcom/bcm47xx_sprom.c
index bca03fd85..956ce2099 100644
--- a/drivers/firmware/broadcom/bcm47xx_sprom.c
+++ b/drivers/firmware/broadcom/bcm47xx_sprom.c
@@ -94,6 +94,38 @@ NVRAM_READ_VAL(u32)
 
 #undef NVRAM_READ_VAL
 
+/* A comma-separated list of n values, taken only if it parses whole. */
+#define NVRAM_READ_ARRAY(type)						\
+static bool nvram_read_ ## type ## _array(const char *prefix,		\
+					  const char *postfix,		\
+					  const char *name, type val[],	\
+					  unsigned int n, bool fallback)	\
+{									\
+	char buf[128], *p = buf, *tok;					\
+	type var[12];							\
+	unsigned int i = 0;						\
+									\
+	if (n > ARRAY_SIZE(var))					\
+		return false;						\
+	if (get_nvram_var(prefix, postfix, name, buf, sizeof(buf),	\
+			  fallback) < 0)				\
+		return false;						\
+	while (i < n && (tok = strsep(&p, ",")) != NULL) {		\
+		if (kstrto ## type(strim(tok), 0, &var[i]))		\
+			return false;					\
+		i++;							\
+	}								\
+	if (i != n)							\
+		return false;						\
+	memcpy(val, var, n * sizeof(val[0]));				\
+	return true;							\
+}
+
+NVRAM_READ_ARRAY(u8)
+NVRAM_READ_ARRAY(u16)
+
+#undef NVRAM_READ_ARRAY
+
 static void nvram_read_u32_2(const char *prefix, const char *name,
 			     u16 *val_lo, u16 *val_hi, bool fallback)
 {
@@ -368,7 +400,50 @@ static void bcm47xx_sprom_fill_auto(struct ssb_sprom *sprom,
 	ENTRY(0x00000600, u16, pre, "legofdm40duppo", legofdm40duppo, 0, fb);
 	ENTRY(0x00000700, u8, pre, "pcieingress_war", pcieingress_war, 0, fb);
 
-	/* TODO: rev 11 support */
+	ENTRY(0xfffff800, u8, pre, "subband5gver", subband5gver, 0, fb);
+	ENTRY(0xfffff800, u8, pre, "tssiposslope2g", tssiposslope2g, 0, fb);
+	ENTRY(0xfffff800, u8, pre, "epagain2g", epagain2g, 0, fb);
+	ENTRY(0xfffff800, u8, pre, "pdgain2g", pdgain2g, 0, fb);
+	ENTRY(0xfffff800, u8, pre, "tworangetssi2g", tworangetssi2g, 0, fb);
+	ENTRY(0xfffff800, u8, pre, "papdcap2g", papdcap2g, 0, fb);
+	ENTRY(0xfffff800, u8, pre, "femctrl", femctrl, 0, fb);
+	ENTRY(0xfffff800, u8, pre, "tssiposslope5g", tssiposslope5g, 0, fb);
+	ENTRY(0xfffff800, u8, pre, "epagain5g", epagain5g, 0, fb);
+	ENTRY(0xfffff800, u8, pre, "pdgain5g", pdgain5g, 0, fb);
+	ENTRY(0xfffff800, u8, pre, "tworangetssi5g", tworangetssi5g, 0, fb);
+	ENTRY(0xfffff800, u8, pre, "papdcap5g", papdcap5g, 0, fb);
+	ENTRY(0xfffff800, u8, pre, "gainctrlsph", gainctrlsph, 0, fb);
+	ENTRY(0xfffff800, u16, pre, "tssifloor2g", tssifloor2g, 0, fb);
+	ENTRY(0xfffff800, u16, pre, "rpcal2g", rpcal2g, 0, fb);
+	ENTRY(0xfffff800, u16, pre, "rpcal5gb0", rpcal5gb[0], 0, fb);
+	ENTRY(0xfffff800, u16, pre, "rpcal5gb1", rpcal5gb[1], 0, fb);
+	ENTRY(0xfffff800, u16, pre, "rpcal5gb2", rpcal5gb[2], 0, fb);
+	ENTRY(0xfffff800, u16, pre, "rpcal5gb3", rpcal5gb[3], 0, fb);
+	ENTRY(0xfffff800, u16, pre, "dot11agofdmhrbw202gpo", dot11agofdmhrbw202gpo, 0, fb);
+	ENTRY(0xfffff800, u16, pre, "ofdmlrbw202gpo", ofdmlrbw202gpo, 0, fb);
+	ENTRY(0xfffff800, u32, pre, "mcsbw805glpo", mcsbw805glpo, 0, fb);
+	ENTRY(0xfffff800, u32, pre, "mcsbw805gmpo", mcsbw805gmpo, 0, fb);
+	ENTRY(0xfffff800, u32, pre, "mcsbw805ghpo", mcsbw805ghpo, 0, fb);
+	ENTRY(0xfffff800, u16, pre, "mcslr5glpo", mcslr5gpo[0], 0, fb);
+	ENTRY(0xfffff800, u16, pre, "mcslr5gmpo", mcslr5gpo[1], 0, fb);
+	ENTRY(0xfffff800, u16, pre, "mcslr5ghpo", mcslr5gpo[2], 0, fb);
+	ENTRY(0xfffff800, u16, pre, "sb20in40hrpo", sb20in40hrpo, 0, fb);
+	ENTRY(0xfffff800, u16, pre, "sb20in40lrpo", sb20in40lrpo, 0, fb);
+	ENTRY(0xfffff800, u16, pre, "sb20in80and160hr5glpo", sb20in80and160hr5gpo[0], 0, fb);
+	ENTRY(0xfffff800, u16, pre, "sb20in80and160hr5gmpo", sb20in80and160hr5gpo[1], 0, fb);
+	ENTRY(0xfffff800, u16, pre, "sb20in80and160hr5ghpo", sb20in80and160hr5gpo[2], 0, fb);
+	ENTRY(0xfffff800, u16, pre, "sb20in80and160lr5glpo", sb20in80and160lr5gpo[0], 0, fb);
+	ENTRY(0xfffff800, u16, pre, "sb20in80and160lr5gmpo", sb20in80and160lr5gpo[1], 0, fb);
+	ENTRY(0xfffff800, u16, pre, "sb20in80and160lr5ghpo", sb20in80and160lr5gpo[2], 0, fb);
+	ENTRY(0xfffff800, u16, pre, "sb40and80hr5glpo", sb40and80hr5gpo[0], 0, fb);
+	ENTRY(0xfffff800, u16, pre, "sb40and80hr5gmpo", sb40and80hr5gpo[1], 0, fb);
+	ENTRY(0xfffff800, u16, pre, "sb40and80hr5ghpo", sb40and80hr5gpo[2], 0, fb);
+	ENTRY(0xfffff800, u16, pre, "sb40and80lr5glpo", sb40and80lr5gpo[0], 0, fb);
+	ENTRY(0xfffff800, u16, pre, "sb40and80lr5gmpo", sb40and80lr5gpo[1], 0, fb);
+	ENTRY(0xfffff800, u16, pre, "sb40and80lr5ghpo", sb40and80lr5gpo[2], 0, fb);
+	ENTRY(0xfffff800, u16, pre, "dot11agduphrpo", dot11agduphrpo, 0, fb);
+	ENTRY(0xfffff800, u16, pre, "dot11agduplrpo", dot11agduplrpo, 0, fb);
+
 	ENTRY(0x00000700, u8, pre, "rxgainerr2ga0", rxgainerr2ga[0], 0, fb);
 	ENTRY(0x00000700, u8, pre, "rxgainerr2ga1", rxgainerr2ga[1], 0, fb);
 	ENTRY(0x00000700, u8, pre, "rxgainerr2ga2", rxgainerr2ga[2], 0, fb);
@@ -388,7 +463,6 @@ static void bcm47xx_sprom_fill_auto(struct ssb_sprom *sprom,
 	ENTRY(0xfffffe00, u8, pre, "sar2g", sar2g, 0, fb);
 	ENTRY(0xfffffe00, u8, pre, "sar5g", sar5g, 0, fb);
 
-	/* TODO: rev 11 support */
 	ENTRY(0x00000700, u8, pre, "noiselvl2ga0", noiselvl2ga[0], 0, fb);
 	ENTRY(0x00000700, u8, pre, "noiselvl2ga1", noiselvl2ga[1], 0, fb);
 	ENTRY(0x00000700, u8, pre, "noiselvl2ga2", noiselvl2ga[2], 0, fb);
@@ -481,6 +555,93 @@ static void bcm47xx_fill_sprom_path_r45(struct ssb_sprom *sprom,
 	}
 }
 
+static void bcm47xx_fill_sprom_path_r11(struct ssb_sprom *sprom,
+					const char *prefix, bool fallback)
+{
+	const struct {
+		const char *band;
+		struct ssb_sprom_rxgains *rx;
+	} rxgains[] = {
+		{ "2g",  &sprom->rxgains_2g },
+		/* rxgains5g* is the low 5 GHz sub-band */
+		{ "5g",  &sprom->rxgains_5gl },
+		{ "5gm", &sprom->rxgains_5gm },
+		{ "5gh", &sprom->rxgains_5gh },
+	};
+	char postfix[2], name[sizeof("rxgains5gmtrelnabypa")];
+	u8 agbg0 = 0, aga0 = 0, v5g[4];
+	int i, b;
+
+	for (i = 0; i < ARRAY_SIZE(sprom->pdoffset40ma); i++) {
+		struct ssb_sprom_core_pwr_info *pwr_info;
+
+		pwr_info = &sprom->core_pwr_info[i];
+
+		snprintf(postfix, sizeof(postfix), "%i", i);
+		nvram_read_u8(prefix, postfix, "maxp2ga",
+			      &pwr_info->maxp2ga, 0, fallback);
+		nvram_read_u16_array(prefix, postfix, "pa2ga", pwr_info->pa2ga,
+				     ARRAY_SIZE(pwr_info->pa2ga), fallback);
+		nvram_read_u8_array(prefix, postfix, "maxp5ga",
+				    pwr_info->maxp5ga,
+				    ARRAY_SIZE(pwr_info->maxp5ga), fallback);
+		nvram_read_u16_array(prefix, postfix, "pa5ga", pwr_info->pa5ga,
+				     ARRAY_SIZE(pwr_info->pa5ga), fallback);
+		nvram_read_u16(prefix, postfix, "pdoffset40ma",
+			       &sprom->pdoffset40ma[i], 0, fallback);
+		nvram_read_u16(prefix, postfix, "pdoffset80ma",
+			       &sprom->pdoffset80ma[i], 0, fallback);
+		nvram_read_u8(prefix, postfix, "pdoffset2g40ma",
+			      &sprom->pdoffset2g40ma[i], 0, fallback);
+
+		nvram_read_u8(prefix, postfix, "rxgainerr2ga",
+			      &sprom->rxgainerr2ga[i], 0, fallback);
+		if (nvram_read_u8_array(prefix, postfix, "rxgainerr5ga", v5g,
+					ARRAY_SIZE(v5g), fallback)) {
+			sprom->rxgainerr5gla[i] = v5g[0];
+			sprom->rxgainerr5gma[i] = v5g[1];
+			sprom->rxgainerr5gha[i] = v5g[2];
+			sprom->rxgainerr5gua[i] = v5g[3];
+		}
+		nvram_read_u8(prefix, postfix, "noiselvl2ga",
+			      &sprom->noiselvl2ga[i], 0, fallback);
+		if (nvram_read_u8_array(prefix, postfix, "noiselvl5ga", v5g,
+					ARRAY_SIZE(v5g), fallback)) {
+			sprom->noiselvl5gla[i] = v5g[0];
+			sprom->noiselvl5gma[i] = v5g[1];
+			sprom->noiselvl5gha[i] = v5g[2];
+			sprom->noiselvl5gua[i] = v5g[3];
+		}
+
+		for (b = 0; b < ARRAY_SIZE(rxgains); b++) {
+			struct ssb_sprom_rxgains *rx = rxgains[b].rx;
+
+			snprintf(name, sizeof(name), "rxgains%selnagaina",
+				 rxgains[b].band);
+			nvram_read_u8(prefix, postfix, name, &rx->elnagain[i],
+				      0, fallback);
+			snprintf(name, sizeof(name), "rxgains%strisoa",
+				 rxgains[b].band);
+			nvram_read_u8(prefix, postfix, name, &rx->triso[i],
+				      0, fallback);
+			snprintf(name, sizeof(name), "rxgains%strelnabypa",
+				 rxgains[b].band);
+			nvram_read_u8(prefix, postfix, name, &rx->trelnabyp[i],
+				      0, fallback);
+		}
+	}
+
+	nvram_read_u16_array(prefix, NULL, "tssifloor5g", sprom->tssifloor5g,
+			     ARRAY_SIZE(sprom->tssifloor5g), fallback);
+
+	nvram_read_u8(prefix, NULL, "pdoffset2g40mvalid",
+		      &sprom->pdoffset2g40mvalid, 0, fallback);
+	nvram_read_u8(prefix, NULL, "agbg0", &agbg0, 0, fallback);
+	nvram_read_u8(prefix, NULL, "aga0", &aga0, 0, fallback);
+	sprom->antenna_gain_qdb[0] = ssb_sprom_antgain_qdb(agbg0);
+	sprom->antenna_gain_qdb[1] = ssb_sprom_antgain_qdb(aga0);
+}
+
 static bool bcm47xx_is_valid_mac(u8 *mac)
 {
 	return mac && !(mac[0] == 0x00 && mac[1] == 0x90 && mac[2] == 0x4c);
@@ -586,6 +747,9 @@ void bcm47xx_fill_sprom(struct ssb_sprom *sprom, const char *prefix,
 	case 9:
 		bcm47xx_fill_sprom_path_r4589(sprom, prefix, fallback);
 		break;
+	case 11:
+		bcm47xx_fill_sprom_path_r11(sprom, prefix, fallback);
+		break;
 	}
 
 	bcm47xx_sprom_fill_auto(sprom, prefix, fallback);

-- 
2.34.1

