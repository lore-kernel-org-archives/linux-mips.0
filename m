Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=62.149.156.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794187083;
	b=kgQydss+v0Q12yOiRsYyQFjdf79DPWDh47a9lFMo5ufhp2X7fXrsCvilO0LTSvrG69d/
	 zaXJLL8ImAOdQ6EXzCaNeWI0vM2VqrSSBE5yt5TS2s+/E78rOE98dBTiumvSz2vae47Ph
	 Q4aP//RPHZCcu16AOOL2Egr1JeZZijYNuZo7b2tYJpQAznxPs3lUe9M2nrY/2MVCSFGaV
	 za7Rjwg9C2scWMuUPq2GnEiDaO1NoW7vyriwC+skMW7ZTuAuNvvmymNbHAY0O00XiwIPa
	 qkjzKIvI9UWEqTqvCy8IxelADxjIr5cfgb0aBE3Ieq/dT2raUpFFbCVkXZgRV/vLgfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794187083;
	h=DMARC-Filter:Received:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-CMAE-Envelope;
	bh=YADi5JHNDL7gmxn4zVxgEn6Eod6iMH/dgspSAx72LGw=;
	b=0uqGNThWEUqWxwaByAHQE3e+CnXb0hYU2M37+822BPR4/qKOQE0QL8eSeqmDu6h1LC6U
	 rl8UXdtzYMzWzSp+hPdP+0MkCrXzvmLoEIT6/fEr1xZnzg8OQ2koIydJ1ZnS5xTaIzh+n
	 n+4Ov48lDBAPonJlAL/VdiGKuKY1mtTjJ02sQTPVoqk5cAc+kJTUQdZv6nBZDKsxxu6jD
	 tlp21WKIZMagRG7DNObx9QoMyO7FKLuih+inMNqqls1SILAhvI2TOPRnOAkIk6yV7cUz8
	 sKye48F6/Cjh/en1YduX+jo5in2bgwclW2B9cUHM/CwEojeJRUBYinDr2Mv6r0Mob3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mythread.it;
	spf=pass smtp.mailfrom=mythread.it;
	dkim=pass header.d=mythread.it header.i=@mythread.it header.a=rsa-sha256 header.s=a1 header.b=a+I7f2J8;
	arc=none smtp.remote-ip=62.149.156.116
Received: from smtpcmd11116.aruba.it (smtpcmd11116.aruba.it [62.149.156.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40D5C606A337
	for <linux-mips@vger.kernel.org>; Mon,  9 Nov 2026 01:18:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40D5C606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mythread.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mythread.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mythread.it header.i=@mythread.it header.a=rsa-sha256 header.s=a1 header.b=a+I7f2J8
Received: from [127.0.0.1] ([87.16.49.252])
	by Aruba SMTP with ESMTPSA
	id QE1AxMsH06VShQE1CxPowU; Mon, 09 Nov 2026 02:17:54 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mythread.it; s=a1;
	t=1794187074; bh=yKEwiWyXNdu7Byr0SDfh44A04O560CGI5mFriu3xPTA=;
	h=From:Date:Subject:MIME-Version:Content-Type:To;
	b=a+I7f2J8DJBorOs9+wqseCn/Wo6P8O1T7FX5jalgLVon4GuA5RGyR2Hatcuvp3F7L
	 G0RQH74GlUogBEpniWZA+fT4HLrHg2/MTeuvjbBDyT1aUlWwSmrwUWv9SrP0BwcZgN
	 RaXnEHDfIMDfstq8V8zwSnQfM37GCRRJg/Xxuo+Lbelkoyh1A3PD1uE2NiR3SqFB4v
	 BjahnQhNLv73Z+u3H6Wb6q7hKjOrcXv1EBtRtn9kY3Opad14u52dvv2uQ7MNCa9bjI
	 gNW2F67X5YRsfSP4SSNoNsfogUPmYP7qK+jXFVOfRZY6wpjmqro3edhGkYaod0pSkS
	 omsQqnw6fMEoA==
From: Alessio Ferri <alessio.ferri@mythread.it>
Date: Mon, 09 Nov 2026 02:17:55 +0100
Subject: [PATCH wireless-next v4 05/10] bcma: extract SPROM revision 11
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
Message-Id: <20261109-bcma-ac-rev1-v4-5-de1262c18b54@mythread.it>
References: <20261109-bcma-ac-rev1-v4-0-de1262c18b54@mythread.it>
In-Reply-To: <20261109-bcma-ac-rev1-v4-0-de1262c18b54@mythread.it>
To: =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>, 
 Michael Buesch <m@bues.ch>
Cc: vit9696 <vit9696@protonmail.com>, ville+git@takio.fi, egc112@msn.com, 
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mips@vger.kernel.org, Alessio Ferri <alessio.ferri@mythread.it>, 
 b43-dev@lists.infradead.org
X-Mailer: b4 0.15.2
X-CMAE-Envelope: MS4xfA0SHnp7/o1kd6yqNJOwxQ9vhGBL4ANMkZqJ/MlRU6NcbLTLJG6wQLJXR978HuYWEYipWWphXGxbozZm8p1w++CcEwuVs3pTkD1lBJ20cKs7x66LY7ZO
 lPPxLcppsYWEvc99HGnRnIC1KkYsC01OvWhZjoF/A16my8XfcvPZtQinQ6hyBPO/54IZ57QV5xdcM4Cs2fG7IUipQQ3UyGsuZ/zSXSby5FILX0qafbbGO0s2
 lJyGypyqM5VPyry4Ig6v819AhE5kzGniuKo+kLbJqeAtozKB6ffkUgvuCRTaLm7+Q7V+5QN4gE2pGL0AGwffg9h0/VoBw3JAKiZjd3Ipe0WVfCgxB1BOh69R
 MRv+wSUc4/Ab1VnwNi7LQ57g0F53Qbmbk2v4s0EvLv29tM00yMnMLi6zhSQy0jWpm9SrVS847vMEtoc9SHjv6a/bgJBL8cz4NnEs/D2REzNpbRwn1oyKCn3F
 ylYWEYsSklBQcXBVXSj93DAHrMOimmP33IBBzA==

Add bcma_sprom_extract_r11() and have bcma_sprom_get() route SPROM
revision 11 to it instead of bcma_sprom_extract_r8(). Add the struct
ssb_sprom fields it fills: per-chain power info and rx gains, FEM
configuration, TSSI floor, rpcal, power detector offsets, per-rate
power offsets, temperature words and antenna gain in quarter dB.

Header fields use the rev 8 masks at their rev 11 offsets. The layout
follows bcmsrom_tbl.h and bcmsrom_fmt.h from bcmdhd; offsets checked
against SPROM dumps of BCM4352 and BCM4360 boards.

Signed-off-by: Alessio Ferri <alessio.ferri@mythread.it>
---
 drivers/bcma/sprom.c         | 207 ++++++++++++++++++++++++++++++++++++++++++-
 include/linux/ssb/ssb.h      |  71 +++++++++++++++
 include/linux/ssb/ssb_regs.h | 103 +++++++++++++++++++++
 3 files changed, 380 insertions(+), 1 deletion(-)

diff --git a/drivers/bcma/sprom.c b/drivers/bcma/sprom.c
index e668ad796..339111519 100644
--- a/drivers/bcma/sprom.c
+++ b/drivers/bcma/sprom.c
@@ -474,6 +474,208 @@ static void bcma_sprom_extract_r8(struct bcma_bus *bus, const u16 *sprom)
 	     SSB_SPROM8_TEMPDELTA_HYSTERESIS_SHIFT);
 }
 
+static void bcma_sprom_unpack_rxgains(struct ssb_sprom_rxgains *out,
+				      int chain, u8 packed)
+{
+	out->trelnabyp[chain] = (packed >> 7) & 0x01;
+	out->triso[chain]     = (packed >> 3) & 0x0f;
+	out->elnagain[chain]  =  packed       & 0x07;
+}
+
+static void bcma_sprom_extract_r11(struct bcma_bus *bus, const u16 *sprom)
+{
+	static const u16 pwr_info_offset[] = {
+		SSB_SPROM11_PWR_INFO_CORE0,
+		SSB_SPROM11_PWR_INFO_CORE1,
+		SSB_SPROM11_PWR_INFO_CORE2,
+	};
+	u16 v;
+	int i, j;
+
+	BUILD_BUG_ON(ARRAY_SIZE(pwr_info_offset) >
+		     ARRAY_SIZE(bus->sprom.core_pwr_info));
+
+	/* Header: rev-11 offsets, rev-8 masks/shifts. */
+	for (i = 0; i < 3; i++) {
+		v = sprom[SPOFF(SSB_SPROM11_IL0MAC) + i];
+		*(((__be16 *)bus->sprom.il0mac) + i) = cpu_to_be16(v);
+	}
+
+	SPEX(board_rev, SSB_SPROM8_BOARDREV, ~0, 0);
+	SPEX(board_type, SSB_SPROM1_SPID, ~0, 0);
+	SPEX(boardflags_lo, SSB_SPROM8_BFLLO, ~0, 0);
+	SPEX(boardflags_hi, SSB_SPROM8_BFLHI, ~0, 0);
+	SPEX(boardflags2_lo, SSB_SPROM8_BFL2LO, ~0, 0);
+	SPEX(boardflags2_hi, SSB_SPROM8_BFL2HI, ~0, 0);
+	SPEX32(boardflags3, SSB_SPROM11_BFL3, ~0, 0);
+
+	SPEX(country_code, SSB_SPROM11_CCODE, ~0, 0);
+	SPEX(gpio0, SSB_SPROM11_GPIOA, SSB_SPROM8_GPIOA_P0, 0);
+	SPEX(gpio1, SSB_SPROM11_GPIOA, SSB_SPROM8_GPIOA_P1,
+	     SSB_SPROM8_GPIOA_P1_SHIFT);
+	SPEX(gpio2, SSB_SPROM11_GPIOB, SSB_SPROM8_GPIOB_P2, 0);
+	SPEX(gpio3, SSB_SPROM11_GPIOB, SSB_SPROM8_GPIOB_P3,
+	     SSB_SPROM8_GPIOB_P3_SHIFT);
+	SPEX(ant_available_a, SSB_SPROM11_ANTAVAIL, SSB_SPROM8_ANTAVAIL_A,
+	     SSB_SPROM8_ANTAVAIL_A_SHIFT);
+	SPEX(ant_available_bg, SSB_SPROM11_ANTAVAIL, SSB_SPROM8_ANTAVAIL_BG,
+	     SSB_SPROM8_ANTAVAIL_BG_SHIFT);
+	SPEX(txchain, SSB_SPROM11_TXRXC, SSB_SPROM8_TXRXC_TXCHAIN,
+	     SSB_SPROM8_TXRXC_TXCHAIN_SHIFT);
+	SPEX(rxchain, SSB_SPROM11_TXRXC, SSB_SPROM8_TXRXC_RXCHAIN,
+	     SSB_SPROM8_TXRXC_RXCHAIN_SHIFT);
+	SPEX(antswitch, SSB_SPROM11_TXRXC, SSB_SPROM8_TXRXC_SWITCH,
+	     SSB_SPROM8_TXRXC_SWITCH_SHIFT);
+	SPEX(subband5gver, SSB_SPROM11_SUBBAND5GVER, 0x00ff, 0);
+
+	SPEX(tssiposslope2g, SSB_SPROM11_FEM_CFG1,
+	     SSB_SPROM11_FEM_TSSIPOSSLOPE, 0);
+	SPEX(epagain2g, SSB_SPROM11_FEM_CFG1, SSB_SPROM11_FEM_EPAGAIN,
+	     SSB_SPROM11_FEM_EPAGAIN_SHIFT);
+	SPEX(pdgain2g, SSB_SPROM11_FEM_CFG1, SSB_SPROM11_FEM_PDGAIN,
+	     SSB_SPROM11_FEM_PDGAIN_SHIFT);
+	SPEX(tworangetssi2g, SSB_SPROM11_FEM_CFG1,
+	     SSB_SPROM11_FEM_TWORANGETSSI, SSB_SPROM11_FEM_TWORANGETSSI_SHIFT);
+	SPEX(papdcap2g, SSB_SPROM11_FEM_CFG1, SSB_SPROM11_FEM_PAPDCAP,
+	     SSB_SPROM11_FEM_PAPDCAP_SHIFT);
+	SPEX(femctrl, SSB_SPROM11_FEM_CFG1, SSB_SPROM11_FEM_CTRL,
+	     SSB_SPROM11_FEM_CTRL_SHIFT);
+	SPEX(tssiposslope5g, SSB_SPROM11_FEM_CFG2,
+	     SSB_SPROM11_FEM_TSSIPOSSLOPE, 0);
+	SPEX(epagain5g, SSB_SPROM11_FEM_CFG2, SSB_SPROM11_FEM_EPAGAIN,
+	     SSB_SPROM11_FEM_EPAGAIN_SHIFT);
+	SPEX(pdgain5g, SSB_SPROM11_FEM_CFG2, SSB_SPROM11_FEM_PDGAIN,
+	     SSB_SPROM11_FEM_PDGAIN_SHIFT);
+	SPEX(tworangetssi5g, SSB_SPROM11_FEM_CFG2,
+	     SSB_SPROM11_FEM_TWORANGETSSI, SSB_SPROM11_FEM_TWORANGETSSI_SHIFT);
+	SPEX(papdcap5g, SSB_SPROM11_FEM_CFG2, SSB_SPROM11_FEM_PAPDCAP,
+	     SSB_SPROM11_FEM_PAPDCAP_SHIFT);
+	SPEX(gainctrlsph, SSB_SPROM11_FEM_CFG2,
+	     SSB_SPROM11_FEM_GAINCTRLSPH, SSB_SPROM11_FEM_GAINCTRLSPH_SHIFT);
+
+	SPEX(tssifloor2g, SSB_SPROM11_TSSIFLOOR_2G,
+	     SSB_SPROM11_TSSIFLOOR_MASK, 0);
+	for (i = 0; i < 4; i++)
+		SPEX(tssifloor5g[i], SSB_SPROM11_TSSIFLOOR_5GL + i * 2,
+		     SSB_SPROM11_TSSIFLOOR_MASK, 0);
+
+	for (i = 0; i < ARRAY_SIZE(pwr_info_offset); i++) {
+		struct ssb_sprom_core_pwr_info *p = &bus->sprom.core_pwr_info[i];
+		u16 base = pwr_info_offset[i];
+
+		p->maxp2ga = sprom[SPOFF(base + SSB_SPROM11_PWR_MAXP2GA)] & 0xff;
+
+		for (j = 0; j < 3; j++)
+			p->pa2ga[j] = sprom[SPOFF(base + SSB_SPROM11_PWR_PA2GA) + j];
+
+		v = sprom[SPOFF(base + SSB_SPROM11_PWR_MAXP5GA)];
+		p->maxp5ga[0] = v & 0xff;
+		p->maxp5ga[1] = (v >> 8) & 0xff;
+		v = sprom[SPOFF(base + SSB_SPROM11_PWR_MAXP5GA) + 1];
+		p->maxp5ga[2] = v & 0xff;
+		p->maxp5ga[3] = (v >> 8) & 0xff;
+
+		for (j = 0; j < 12; j++)
+			p->pa5ga[j] = sprom[SPOFF(base + SSB_SPROM11_PWR_PA5GA) + j];
+
+		v = sprom[SPOFF(base + SSB_SPROM11_PWR_RXGAINS0)];
+		bcma_sprom_unpack_rxgains(&bus->sprom.rxgains_5gm, i,  v       & 0xff);
+		bcma_sprom_unpack_rxgains(&bus->sprom.rxgains_5gh, i, (v >> 8) & 0xff);
+		v = sprom[SPOFF(base + SSB_SPROM11_PWR_RXGAINS1)];
+		bcma_sprom_unpack_rxgains(&bus->sprom.rxgains_2g,  i,  v       & 0xff);
+		bcma_sprom_unpack_rxgains(&bus->sprom.rxgains_5gl, i, (v >> 8) & 0xff);
+	}
+
+	SPEX(rpcal2g,    SSB_SPROM11_RPCAL_2G,  ~0, 0);
+	SPEX(rpcal5gb[0], SSB_SPROM11_RPCAL_5GL, ~0, 0);
+	SPEX(rpcal5gb[1], SSB_SPROM11_RPCAL_5GM, ~0, 0);
+	SPEX(rpcal5gb[2], SSB_SPROM11_RPCAL_5GH, ~0, 0);
+	SPEX(rpcal5gb[3], SSB_SPROM11_RPCAL_5GU, ~0, 0);
+
+	SPEX(pdoffset2g40ma[0], SSB_SPROM11_PDOFFSET2G40M,
+	     SSB_SPROM11_PDOFFSET2G40M_MA0, SSB_SPROM11_PDOFFSET2G40M_MA0_SHIFT);
+	SPEX(pdoffset2g40ma[1], SSB_SPROM11_PDOFFSET2G40M,
+	     SSB_SPROM11_PDOFFSET2G40M_MA1, SSB_SPROM11_PDOFFSET2G40M_MA1_SHIFT);
+	SPEX(pdoffset2g40ma[2], SSB_SPROM11_PDOFFSET2G40M,
+	     SSB_SPROM11_PDOFFSET2G40M_MA2, SSB_SPROM11_PDOFFSET2G40M_MA2_SHIFT);
+	SPEX(pdoffset2g40mvalid, SSB_SPROM11_PDOFFSET2G40M,
+	     SSB_SPROM11_PDOFFSET2G40M_VALID,
+	     SSB_SPROM11_PDOFFSET2G40M_VALID_SHIFT);
+
+	for (i = 0; i < 3; i++) {
+		bus->sprom.pdoffset40ma[i] =
+			sprom[SPOFF(SSB_SPROM11_PDOFFSET40MA) + i];
+		bus->sprom.pdoffset80ma[i] =
+			sprom[SPOFF(SSB_SPROM11_PDOFFSET80MA) + i];
+	}
+
+	SPEX(cckbw202gpo,           SSB_SPROM11_CCKBW202GPO,           ~0, 0);
+	SPEX(cckbw20ul2gpo,         SSB_SPROM11_CCKBW20UL2GPO,         ~0, 0);
+	SPEX32(mcsbw202gpo,         SSB_SPROM11_MCSBW202GPO,           ~0, 0);
+	SPEX32(mcsbw402gpo,         SSB_SPROM11_MCSBW402GPO,           ~0, 0);
+	SPEX(dot11agofdmhrbw202gpo, SSB_SPROM11_DOT11AGOFDMHRBW202GPO, ~0, 0);
+	SPEX(ofdmlrbw202gpo,        SSB_SPROM11_OFDMLRBW202GPO,        ~0, 0);
+	SPEX32(mcsbw205glpo,        SSB_SPROM11_MCSBW205GLPO,          ~0, 0);
+	SPEX32(mcsbw405glpo,        SSB_SPROM11_MCSBW405GLPO,          ~0, 0);
+	SPEX32(mcsbw805glpo,        SSB_SPROM11_MCSBW805GLPO,          ~0, 0);
+	SPEX32(mcsbw205gmpo,        SSB_SPROM11_MCSBW205GMPO,          ~0, 0);
+	SPEX32(mcsbw405gmpo,        SSB_SPROM11_MCSBW405GMPO,          ~0, 0);
+	SPEX32(mcsbw805gmpo,        SSB_SPROM11_MCSBW805GMPO,          ~0, 0);
+	SPEX32(mcsbw205ghpo,        SSB_SPROM11_MCSBW205GHPO,          ~0, 0);
+	SPEX32(mcsbw405ghpo,        SSB_SPROM11_MCSBW405GHPO,          ~0, 0);
+	SPEX32(mcsbw805ghpo,        SSB_SPROM11_MCSBW805GHPO,          ~0, 0);
+
+	SPEX(mcslr5gpo[0],          SSB_SPROM11_MCSLR5GLPO,            ~0, 0);
+	SPEX(mcslr5gpo[1],          SSB_SPROM11_MCSLR5GMPO,            ~0, 0);
+	SPEX(mcslr5gpo[2],          SSB_SPROM11_MCSLR5GHPO,            ~0, 0);
+	SPEX(sb20in40hrpo,          SSB_SPROM11_SB20IN40HRPO,          ~0, 0);
+	SPEX(sb20in40lrpo,          SSB_SPROM11_SB20IN40LRPO,          ~0, 0);
+	SPEX(sb20in80and160hr5gpo[0], SSB_SPROM11_SB20IN80AND160HR5GLPO, ~0, 0);
+	SPEX(sb20in80and160hr5gpo[1], SSB_SPROM11_SB20IN80AND160HR5GMPO, ~0, 0);
+	SPEX(sb20in80and160hr5gpo[2], SSB_SPROM11_SB20IN80AND160HR5GHPO, ~0, 0);
+	SPEX(sb20in80and160lr5gpo[0], SSB_SPROM11_SB20IN80AND160LR5GLPO, ~0, 0);
+	SPEX(sb20in80and160lr5gpo[1], SSB_SPROM11_SB20IN80AND160LR5GMPO, ~0, 0);
+	SPEX(sb20in80and160lr5gpo[2], SSB_SPROM11_SB20IN80AND160LR5GHPO, ~0, 0);
+	SPEX(sb40and80hr5gpo[0],    SSB_SPROM11_SB40AND80HR5GLPO,      ~0, 0);
+	SPEX(sb40and80hr5gpo[1],    SSB_SPROM11_SB40AND80HR5GMPO,      ~0, 0);
+	SPEX(sb40and80hr5gpo[2],    SSB_SPROM11_SB40AND80HR5GHPO,      ~0, 0);
+	SPEX(sb40and80lr5gpo[0],    SSB_SPROM11_SB40AND80LR5GLPO,      ~0, 0);
+	SPEX(sb40and80lr5gpo[1],    SSB_SPROM11_SB40AND80LR5GMPO,      ~0, 0);
+	SPEX(sb40and80lr5gpo[2],    SSB_SPROM11_SB40AND80LR5GHPO,      ~0, 0);
+	SPEX(dot11agduphrpo,        SSB_SPROM11_DOT11AGDUPHRPO,        ~0, 0);
+	SPEX(dot11agduplrpo,        SSB_SPROM11_DOT11AGDUPLRPO,        ~0, 0);
+
+	SPEX(tempthresh, SSB_SPROM11_THERMAL, SSB_SPROM8_THERMAL_TRESH,
+	     SSB_SPROM8_THERMAL_TRESH_SHIFT);
+	SPEX(tempoffset, SSB_SPROM11_THERMAL, SSB_SPROM8_THERMAL_OFFSET,
+	     SSB_SPROM8_THERMAL_OFFSET_SHIFT);
+	SPEX(rawtempsense, SSB_SPROM11_RAWTS, SSB_SPROM8_RAWTS_RAWTEMP,
+	     SSB_SPROM8_RAWTS_RAWTEMP_SHIFT);
+	SPEX(measpower, SSB_SPROM11_RAWTS, SSB_SPROM8_RAWTS_MEASPOWER,
+	     SSB_SPROM8_RAWTS_MEASPOWER_SHIFT);
+	SPEX(tempsense_slope, SSB_SPROM11_OPT_CORRX,
+	     SSB_SPROM8_OPT_CORRX_TEMP_SLOPE,
+	     SSB_SPROM8_OPT_CORRX_TEMP_SLOPE_SHIFT);
+	SPEX(tempcorrx, SSB_SPROM11_OPT_CORRX, SSB_SPROM8_OPT_CORRX_TEMPCORRX,
+	     SSB_SPROM8_OPT_CORRX_TEMPCORRX_SHIFT);
+	SPEX(tempsense_option, SSB_SPROM11_OPT_CORRX,
+	     SSB_SPROM8_OPT_CORRX_TEMP_OPTION,
+	     SSB_SPROM8_OPT_CORRX_TEMP_OPTION_SHIFT);
+	SPEX(phycal_tempdelta, SSB_SPROM11_TEMPDELTA,
+	     SSB_SPROM8_TEMPDELTA_PHYCAL,
+	     SSB_SPROM8_TEMPDELTA_PHYCAL_SHIFT);
+	SPEX(temps_period, SSB_SPROM11_TEMPDELTA, SSB_SPROM8_TEMPDELTA_PERIOD,
+	     SSB_SPROM8_TEMPDELTA_PERIOD_SHIFT);
+	SPEX(temps_hysteresis, SSB_SPROM11_TEMPDELTA,
+	     SSB_SPROM8_TEMPDELTA_HYSTERESIS,
+	     SSB_SPROM8_TEMPDELTA_HYSTERESIS_SHIFT);
+
+	bus->sprom.antenna_gain_qdb[0] =
+		ssb_sprom_antgain_qdb(sprom[SPOFF(SSB_SPROM11_AGBG10)] & 0xff);
+	bus->sprom.antenna_gain_qdb[1] =
+		ssb_sprom_antgain_qdb(sprom[SPOFF(SSB_SPROM11_AGBG2A0)] >> 8);
+}
+
 /*
  * Indicates the presence of external SPROM.
  */
@@ -640,7 +842,10 @@ int bcma_sprom_get(struct bcma_bus *bus)
 		bcma_warn(bus, "Invalid SPROM read from the PCIe card, trying to use fallback SPROM\n");
 		err = bcma_fill_sprom_with_fallback(bus, &bus->sprom);
 	} else {
-		bcma_sprom_extract_r8(bus, sprom);
+		if (bus->sprom.revision == 11)
+			bcma_sprom_extract_r11(bus, sprom);
+		else
+			bcma_sprom_extract_r8(bus, sprom);
 		kfree(sprom);
 	}
 
diff --git a/include/linux/ssb/ssb.h b/include/linux/ssb/ssb.h
index 67cb66f6f..a89bdbf56 100644
--- a/include/linux/ssb/ssb.h
+++ b/include/linux/ssb/ssb.h
@@ -23,6 +23,19 @@ struct ssb_sprom_core_pwr_info {
 	u8 itssi_2g, itssi_5g;
 	u8 maxpwr_2g, maxpwr_5gl, maxpwr_5g, maxpwr_5gh;
 	u16 pa_2g[4], pa_5gl[4], pa_5g[4], pa_5gh[4];
+
+	/* SROM rev 11 */
+	u8 maxp2ga;
+	u8 maxp5ga[4];
+	u16 pa2ga[3];
+	u16 pa5ga[12];
+};
+
+/* Rx gain settings of a band, indexed by chain. SROM rev 11. */
+struct ssb_sprom_rxgains {
+	u8 elnagain[3];
+	u8 triso[3];
+	u8 trelnabyp[3];
 };
 
 struct ssb_sprom {
@@ -192,8 +205,66 @@ struct ssb_sprom {
 	u16 legofdm40duppo;
 	u8 sar2g;
 	u8 sar5g;
+
+	/* SROM rev 11 only. */
+	struct ssb_sprom_rxgains rxgains_2g;
+	struct ssb_sprom_rxgains rxgains_5gl;
+	struct ssb_sprom_rxgains rxgains_5gm;
+	struct ssb_sprom_rxgains rxgains_5gh;
+	u8 subband5gver;
+	/* Antenna gain, quarter dB: [0] agbg0 (2.4 GHz), [1] aga0 (5 GHz). */
+	s8 antenna_gain_qdb[2];
+	u16 dot11agofdmhrbw202gpo;
+	u16 ofdmlrbw202gpo;
+	u32 mcsbw805glpo;
+	u32 mcsbw805gmpo;
+	u32 mcsbw805ghpo;
+	/* TX beamforming RX path calibration, 5 GHz in l, m, h, u order. */
+	u16 rpcal2g;
+	u16 rpcal5gb[4];
+	u16 pdoffset40ma[3];
+	u16 pdoffset80ma[3];
+	u8 pdoffset2g40ma[3];	/* 4 bits, signed */
+	u8 pdoffset2g40mvalid;
+	/* Per-rate-group power offsets, nibbles; [i] is 5 GHz l/m/h. */
+	u16 mcslr5gpo[3];
+	u16 sb20in40hrpo;
+	u16 sb20in40lrpo;
+	u16 sb20in80and160hr5gpo[3];
+	u16 sb20in80and160lr5gpo[3];
+	u16 sb40and80hr5gpo[3];
+	u16 sb40and80lr5gpo[3];
+	u16 dot11agduphrpo;
+	u16 dot11agduplrpo;
+	/* FEM configuration; femctrl selects the FEM control scheme. */
+	u8 tssiposslope2g;
+	u8 epagain2g;
+	u8 pdgain2g;
+	u8 tworangetssi2g;
+	u8 papdcap2g;
+	u8 femctrl;
+	u8 tssiposslope5g;
+	u8 epagain5g;
+	u8 pdgain5g;
+	u8 tworangetssi5g;
+	u8 papdcap5g;
+	u8 gainctrlsph;
+	/* TSSI floor, 0x3ff when not programmed. */
+	u16 tssifloor2g;
+	u16 tssifloor5g[4];
 };
 
+/*
+ * SROM rev 11 antenna gain byte, agbg0 or aga0, in quarter dB: whole dB in
+ * bits [5:0], signed, and quarter dB in bits [7:6].
+ */
+static inline s8 ssb_sprom_antgain_qdb(u8 raw)
+{
+	s8 gain = (s8)((raw & 0x3f) << 2) >> 2;
+
+	return 4 * gain + (raw >> 6);
+}
+
 /* Information about the PCB the circuitry is soldered on. */
 struct ssb_boardinfo {
 	u16 vendor;
diff --git a/include/linux/ssb/ssb_regs.h b/include/linux/ssb/ssb_regs.h
index 210f46494..2546c02c9 100644
--- a/include/linux/ssb/ssb_regs.h
+++ b/include/linux/ssb/ssb_regs.h
@@ -606,6 +606,109 @@
 #define SSB_SPROM8_BW40PO		0x0196
 #define SSB_SPROM8_BWDUPPO		0x0198
 
+/* SROM revision 11. Header fields use the SSB_SPROM8 masks and shifts. */
+#define SSB_SPROM11_BFL3		0x008C	/* boardflags3, 32 bits */
+#define SSB_SPROM11_IL0MAC		0x0090	/* 6 byte MAC address */
+#define SSB_SPROM11_CCODE		0x0096	/* 2 byte country code */
+#define SSB_SPROM11_GPIOA		0x009A	/* ledbh0 low byte, ledbh1 high */
+#define SSB_SPROM11_GPIOB		0x009C	/* ledbh2 low byte, ledbh3 high */
+#define SSB_SPROM11_ANTAVAIL		0x00A0
+#define SSB_SPROM11_AGBG10		0x00A2	/* agbg0 low byte, agbg1 high */
+#define SSB_SPROM11_AGBG2A0		0x00A4	/* agbg2 low byte, aga0 high */
+#define SSB_SPROM11_AGA21		0x00A6	/* aga1 low byte, aga2 high */
+#define SSB_SPROM11_TXRXC		0x00A8
+/* FEM configuration, CFG1 for 2.4 GHz and CFG2 for 5 GHz. */
+#define SSB_SPROM11_FEM_CFG1		0x00AA
+#define SSB_SPROM11_FEM_CFG2		0x00AC
+#define SSB_SPROM11_FEM_TSSIPOSSLOPE	0x0001
+#define SSB_SPROM11_FEM_EPAGAIN		0x000E
+#define SSB_SPROM11_FEM_EPAGAIN_SHIFT	1
+#define SSB_SPROM11_FEM_PDGAIN		0x01F0
+#define SSB_SPROM11_FEM_PDGAIN_SHIFT	4
+#define SSB_SPROM11_FEM_TWORANGETSSI	0x0200
+#define SSB_SPROM11_FEM_TWORANGETSSI_SHIFT	9
+#define SSB_SPROM11_FEM_PAPDCAP		0x0400
+#define SSB_SPROM11_FEM_PAPDCAP_SHIFT	10
+#define SSB_SPROM11_FEM_CTRL		0xF800	/* CFG1: femctrl */
+#define SSB_SPROM11_FEM_CTRL_SHIFT	11
+#define SSB_SPROM11_FEM_GAINCTRLSPH	0xF800	/* CFG2: gainctrlsph */
+#define SSB_SPROM11_FEM_GAINCTRLSPH_SHIFT	11
+/* Temperature words, with the SSB_SPROM8 layout. */
+#define SSB_SPROM11_THERMAL		0x00AE
+#define SSB_SPROM11_RAWTS		0x00B0
+#define SSB_SPROM11_OPT_CORRX		0x00B2
+#define SSB_SPROM11_TEMPDELTA		0x00B8
+/* TSSI floor: 2.4 GHz, then 5 GHz l, m, h, u. */
+#define SSB_SPROM11_TSSIFLOOR_2G	0x00BE
+#define SSB_SPROM11_TSSIFLOOR_5GL	0x00C0
+#define SSB_SPROM11_TSSIFLOOR_MASK	0x03FF
+#define SSB_SPROM11_PDOFFSET2G40M	0x00C8	/* 4 bits per chain */
+#define  SSB_SPROM11_PDOFFSET2G40M_MA0		0x000F
+#define  SSB_SPROM11_PDOFFSET2G40M_MA0_SHIFT	0
+#define  SSB_SPROM11_PDOFFSET2G40M_MA1		0x00F0
+#define  SSB_SPROM11_PDOFFSET2G40M_MA1_SHIFT	4
+#define  SSB_SPROM11_PDOFFSET2G40M_MA2		0x0F00
+#define  SSB_SPROM11_PDOFFSET2G40M_MA2_SHIFT	8
+#define  SSB_SPROM11_PDOFFSET2G40M_VALID	0x8000
+#define  SSB_SPROM11_PDOFFSET2G40M_VALID_SHIFT	15
+#define SSB_SPROM11_PDOFFSET40MA	0x00CA	/* 3 x u16, one per chain */
+#define SSB_SPROM11_PDOFFSET80MA	0x00D0	/* 3 x u16, one per chain */
+#define SSB_SPROM11_SUBBAND5GVER	0x00D6
+
+/* Per-chain power info blocks, 0x28 bytes apart; SSB_SPROM11_PWR_* are
+ * offsets within a block.
+ */
+#define SSB_SPROM11_PWR_INFO_CORE0	0x00D8
+#define SSB_SPROM11_PWR_INFO_CORE1	0x0100
+#define SSB_SPROM11_PWR_INFO_CORE2	0x0128
+
+#define SSB_SPROM11_PWR_MAXP2GA		0x0000	/* u8 in low byte */
+#define SSB_SPROM11_PWR_PA2GA		0x0002	/* 3 x u16 */
+#define SSB_SPROM11_PWR_RXGAINS0	0x0008	/* 5gm (lo) / 5gh (hi) */
+#define SSB_SPROM11_PWR_RXGAINS1	0x000A	/* 2g  (lo) / 5gl (hi) */
+#define SSB_SPROM11_PWR_MAXP5GA		0x000C	/* 2 x u16 -> 4 x u8 */
+#define SSB_SPROM11_PWR_PA5GA		0x0010	/* 12 x u16 */
+
+#define SSB_SPROM11_CCKBW202GPO		0x0150
+#define SSB_SPROM11_CCKBW20UL2GPO	0x0152
+#define SSB_SPROM11_MCSBW202GPO		0x0154
+#define SSB_SPROM11_MCSBW402GPO		0x0158
+#define SSB_SPROM11_DOT11AGOFDMHRBW202GPO 0x015C
+#define SSB_SPROM11_OFDMLRBW202GPO	0x015E
+#define SSB_SPROM11_MCSBW205GLPO	0x0160
+#define SSB_SPROM11_MCSBW405GLPO	0x0164
+#define SSB_SPROM11_MCSBW805GLPO	0x0168
+#define SSB_SPROM11_RPCAL_2G		0x016C
+#define SSB_SPROM11_RPCAL_5GL		0x016E
+#define SSB_SPROM11_MCSBW205GMPO	0x0170
+#define SSB_SPROM11_MCSBW405GMPO	0x0174
+#define SSB_SPROM11_MCSBW805GMPO	0x0178
+#define SSB_SPROM11_RPCAL_5GM		0x017C
+#define SSB_SPROM11_RPCAL_5GH		0x017E
+#define SSB_SPROM11_MCSBW205GHPO	0x0180
+#define SSB_SPROM11_MCSBW405GHPO	0x0184
+#define SSB_SPROM11_MCSBW805GHPO	0x0188
+#define SSB_SPROM11_RPCAL_5GU		0x018C
+#define SSB_SPROM11_MCSLR5GLPO		0x0190
+#define SSB_SPROM11_MCSLR5GMPO		0x0192
+#define SSB_SPROM11_MCSLR5GHPO		0x0194
+#define SSB_SPROM11_SB20IN40HRPO	0x0196
+#define SSB_SPROM11_SB20IN80AND160HR5GLPO 0x0198
+#define SSB_SPROM11_SB40AND80HR5GLPO	0x019A
+#define SSB_SPROM11_SB20IN80AND160HR5GMPO 0x019C
+#define SSB_SPROM11_SB40AND80HR5GMPO	0x019E
+#define SSB_SPROM11_SB20IN80AND160HR5GHPO 0x01A0
+#define SSB_SPROM11_SB40AND80HR5GHPO	0x01A2
+#define SSB_SPROM11_SB20IN40LRPO	0x01A4
+#define SSB_SPROM11_SB20IN80AND160LR5GLPO 0x01A6
+#define SSB_SPROM11_SB40AND80LR5GLPO	0x01A8
+#define SSB_SPROM11_SB20IN80AND160LR5GMPO 0x01AA
+#define SSB_SPROM11_SB40AND80LR5GMPO	0x01AC
+#define SSB_SPROM11_SB20IN80AND160LR5GHPO 0x01AE
+#define SSB_SPROM11_SB40AND80LR5GHPO	0x01B0
+#define SSB_SPROM11_DOT11AGDUPHRPO	0x01B2
+#define SSB_SPROM11_DOT11AGDUPLRPO	0x01B4
+
 /* Values for boardflags_lo read from SPROM */
 #define SSB_BFL_BTCOEXIST		0x0001	/* implements Bluetooth coexistance */
 #define SSB_BFL_PACTRL			0x0002	/* GPIO 9 controlling the PA */

-- 
2.34.1

