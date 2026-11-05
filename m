Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.28.148
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793852657;
	b=a5wdEIbwkimdQOXkMGAtd+dtkrWb/EBDiYLM6yQoANWhhfrxF+Egtbx6sDLIcDSqzG8c
	 g+ZOP3BUkPI/kTFjlEUp0P99zTx2EJc5E818hIOuxRzjYiSW2u0bX9QvAIwKD1OCECDuT
	 x4Ugw3fVP1Rh3zdDjE3Qpzsg76AXakLC2WqeqnUzTTRtc5/YOCixFN/Tw/uFgXri+uvPS
	 0GgpHISw7yL0K0xonzIBQidNAuvu5jX/fiPeWkod0jrNNsEJYTkPBO1hIe5VhXxVmBC25
	 d0+dxMrNKGNSKoJ57G8bK4CHCpej1xKpSdFJE3ARL6UEYrSUSHGq9SKZXUeTzHFUCkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793852657;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=n0Vzpk2EZXCbyFbAz1f5biSJVSpGee9cNxpBryGeFZk=;
	b=QYZ3dbivpgMPDXZ3RQvFt9zKzjmhS2t2AUH7f2A/LiSlQJwWM4FAYFYtHSHN2fx8HrGs
	 DPofMGvSqU5qyTiNa2AtNCHanLuvZ6nYYmRKq0WuK5ZSRvct6SUHVg5IbAiNBY9PGdqvn
	 LSm2zPQFHNl+1V8f+BlrR92NLkLLvVG7Bp2glrBVPtCnv58MWNdrhzKej4NH17xmOacZt
	 NkgTFVgO628xuoAg3tjROi3YwlWUVADPxuVir0ak0XigD05EmUbiVKU9FcIlVwpSjrDWk
	 M4Qhje3IqTaJGot37WBJYdx13KOlyjU7Mf8loaIpSV1KKX585KePjPW7v8t+HXMfrog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=xiaopeng.com;
	spf=pass smtp.mailfrom=xiaopeng.com;
	dkim=pass header.d=xiaopeng.com header.i=@xiaopeng.com header.a=rsa-sha256 header.s=default header.b=Y30G1+xh;
	arc=none smtp.remote-ip=115.124.28.148
Received: from out28-148.mail.aliyun.com (out28-148.mail.aliyun.com [115.124.28.148])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB8F0606A329;
	Thu,  5 Nov 2026 04:24:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB8F0606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=xiaopeng.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xiaopeng.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=xiaopeng.com header.i=@xiaopeng.com header.a=rsa-sha256 header.s=default header.b=Y30G1+xh
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xiaopeng.com; s=default;
	t=1793852647; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=n0Vzpk2EZXCbyFbAz1f5biSJVSpGee9cNxpBryGeFZk=;
	b=Y30G1+xhNvYBGVc8iXd/deOvE+e+v9FH8m6mcp7j1rQDpWhHyiOTnBMrhlSn4FlsxtSLaEBQcRXDvEmg+pKVwaNHjz9OvAIQ5kdT/6Fm3Q0ncniP7jYCvXcrxKjTp2K8zdu+42zS9wYCJL3kNW1C0hgj2n+ya4sgzF5tmo6pt5M=
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.1897756|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.00566328-0.000578767-0.993758;FP=13214382902636795604|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033025068124;MF=zhugl3@xiaopeng.com;NM=1;PH=DS;RN=10;RT=10;SR=0;TI=SMTPD_---.jxGRs3X_1793852646;
Received: from DESKTOP-UL5U09E.xiaopeng.local(mailfrom:zhugl3@xiaopeng.com fp:SMTPD_---.jxGRs3X_1793852646 cluster:ay29)
          by smtp.aliyun-inc.com;
          Thu, 05 Nov 2026 12:24:06 +0800
From: Guanglei Zhu <zhugl3@xiaopeng.com>
To: Paul Cercueil <paul@crapouillou.net>,
	Harvey Hunt <harveyhuntnexus@gmail.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mips@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	zhugl3@xiaopeng.com,
	Weibin Liu <liuwb@xiaopeng.com>
Subject: [PATCH v2 2/2] mtd: rawnand: ingenic: validate BCH error index in jz4780_correct()
Date: Thu,  5 Nov 2026 12:24:05 +0800
Message-ID: <20261105042405.71352-2-zhugl3@xiaopeng.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261105042405.71352-1-zhugl3@xiaopeng.com>
References: <20261105040153.66597-1-zhugl3@xiaopeng.com>
 <20261105042405.71352-1-zhugl3@xiaopeng.com>
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

From: Weibin Liu <liuwb@xiaopeng.com>

The JZ4780 BCH controller reports each corrected bit error as a byte
pair index, in the INDEX field of the BCH_BHERR registers. The field
is 11 bits wide, but nothing in jz4780_correct() checks the reported
index against the size of the data buffer being corrected:

    buf[(index * 2) + 0] ^= mask;
    buf[(index * 2) + 1] ^= mask >> 8;

With data or ECC coming from an untrusted flash, the decoder can
report an index that points past the end of the data buffer, and the
above statements then flip bits outside the buffer.

Skip the correction when the reported index does not point into
the data area.  A bitflip in the parity bytes does not affect the
data, so rejecting the page for it would fail reads that are
perfectly correctable, and an index beyond the codeword has no
buffer to update in the first place.

Fixes: ae02ab00aa3c ("mtd: nand: jz4780: driver for NAND devices on JZ4780 SoCs")
Signed-off-by: Weibin Liu <liuwb@xiaopeng.com>
---
Changes in v2: skip the correction for an index that does not point
into the data area instead of failing the page with -EBADMSG.  A
correctable bitflip in the ECC bytes leaves the data valid, and the
early exit also dropped the error entries that followed it.  This
matches how jz4740_ecc_correct() treats its indexes.

Verified with a userspace replica of the correction loop: with
params->size = 512, an index of 256 (first parity word) or at the
field maximum (0x7ff) produces no write outside the data buffer,
and in-range indexes keep correcting as before.

 drivers/mtd/nand/raw/ingenic/jz4780_bch.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/mtd/nand/raw/ingenic/jz4780_bch.c b/drivers/mtd/nand/raw/ingenic/jz4780_bch.c
index 12b5b0484fe9..3a4c5d6e7f8a 100644
--- a/drivers/mtd/nand/raw/ingenic/jz4780_bch.c
+++ b/drivers/mtd/nand/raw/ingenic/jz4780_bch.c
@@ -216,6 +216,10 @@ static int jz4780_correct(struct ingenic_ecc *bch,
 						BCH_BHERR_MASK_SHIFT;
 			index = (reg & BCH_BHERR_INDEX_MASK) >>
 						BCH_BHERR_INDEX_SHIFT;
+			/* Skip indexes outside the data area. */
+			if ((index * 2) + 1 >= params->size)
+				continue;
+
 			buf[(index * 2) + 0] ^= mask;
 			buf[(index * 2) + 1] ^= mask >> 8;
 		}
-- 
2.50.1

