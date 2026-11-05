Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.28.147
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793852657;
	b=J0vvS/oBxgwSegjz/H6wRW3yENSCmAozPJ0JZqNmtgZvNHJECLCJ7s5xb7iKEHVBXDcc
	 ORpfFSJtV2PmVNTnsq0IPk3iVWPSJvkW+8aywCLBunEdpgx2KirLPlO3w2CQvY+q4VAMq
	 c79VKrwMcUOV9n/G4APDxQraFyY9JQonb28+WE9AD194avucbkC43eeD0PRH9S/QaHSkE
	 krd9zxEzIHcM7PYVpixcSD5LFHzW6kQscf9C97xKaYoZl3jJgs7Aeedz+hnyXGh9ZzgGg
	 gcMEQtvpxowCuPwgUPfxh9d/YPh385QdBaKgf1QcVsmo+suVHLuj5p0EtXTovhY/cUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793852657;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Tqg0mNDgtVX0/7x/JTynwxPqPSZjuIwiBYY1AOgSyRQ=;
	b=z/7JD6jh9D1+Vi+qM7Rt42j6yLuDmmM8ujbodU/pqLF+rlE1cBwfU0sVGsRVTVWtZYHh
	 GcbP1Xjvd207Q0hI5Yyux42Pq/1XEf7FLdDQ7K/B4kH2/HowTB3Rqp5YFUzaQBx6rjAwL
	 nfrudg3VF31Bh7QWWdfq47Itff4qCOwbj+9vws9Siw/s6fKvyEi6fPXcQ0L2OM74eZclv
	 Xnv1vY7UnGJWQtKk/o5bY6AdoMjIc0NT8/dx4G8fShMaJQS3u9ONI/F2kVq87GAXTKWpq
	 nUdDNTuXe0SLal/e7xMs5U8H+SOUWmFIzx2Gj1LJSHMQrVD7Tno5IS9YOBLlJPq0JKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=xiaopeng.com;
	spf=pass smtp.mailfrom=xiaopeng.com;
	dkim=pass header.d=xiaopeng.com header.i=@xiaopeng.com header.a=rsa-sha256 header.s=default header.b=ZcjlZh42;
	arc=none smtp.remote-ip=115.124.28.147
Received: from out28-147.mail.aliyun.com (out28-147.mail.aliyun.com [115.124.28.147])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D88E606A328;
	Thu,  5 Nov 2026 04:24:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D88E606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=xiaopeng.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xiaopeng.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=xiaopeng.com header.i=@xiaopeng.com header.a=rsa-sha256 header.s=default header.b=ZcjlZh42
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xiaopeng.com; s=default;
	t=1793852646; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=Tqg0mNDgtVX0/7x/JTynwxPqPSZjuIwiBYY1AOgSyRQ=;
	b=ZcjlZh42CxKZH1HtCOhKfUPSkZdI1KOfrwsyiRTTdGzzloYd+cDRiUS7WRIeMdizaFp8oM8SxEjM22s9K0y+K8sqgC0YfLdhP4KpuUpGDffXap9G/n0ehFDxDqf246k11mPD51XYpCnPq8tbINYU7ms1I2q0KOBkwUeEO8PvZ+Y=
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.1131425|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.0022107-0.000197108-0.997592;FP=13709712853670911552|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033037034184;MF=zhugl3@xiaopeng.com;NM=1;PH=DS;RN=10;RT=10;SR=0;TI=SMTPD_---.jxGRs2q_1793852645;
Received: from DESKTOP-UL5U09E.xiaopeng.local(mailfrom:zhugl3@xiaopeng.com fp:SMTPD_---.jxGRs2q_1793852645 cluster:ay29)
          by smtp.aliyun-inc.com;
          Thu, 05 Nov 2026 12:24:05 +0800
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
Subject: [PATCH v2 1/2] mtd: rawnand: ingenic: validate BCH error index in jz4725b_correct()
Date: Thu,  5 Nov 2026 12:24:04 +0800
Message-ID: <20261105042405.71352-1-zhugl3@xiaopeng.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261105040153.66597-1-zhugl3@xiaopeng.com>
References: <20261105040153.66597-1-zhugl3@xiaopeng.com>
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

The JZ4725B BCH controller reports each corrected bit error as an
index into the codeword it was asked to decode, in the INDEX0/INDEX1
fields of the BCH_BHERR registers. These fields are 13 bits wide, but
nothing in jz4725b_correct() checks the reported index against the
size of the data buffer being corrected:

    buf[(bit >> 3)] ^= BIT(bit & 0x7);

With data or ECC coming from an untrusted flash, the decoder can
report an index that points past the end of the data buffer, and the
above statement then flips a bit outside the buffer.

Skip the correction when the reported index does not point into
the data area.  A bitflip in the parity bytes does not affect the
data, so rejecting the page for it would fail reads that are
perfectly correctable, and an index beyond the codeword has no
buffer to update in the first place.

Fixes: 3e6ac2ad90b3 ("mtd: rawnand: ingenic: Add support for the JZ4725B")
Signed-off-by: Weibin Liu <liuwb@xiaopeng.com>
---
Changes in v2: skip the correction for an index that does not point
into the data area instead of failing the page with -EBADMSG.  A
correctable bitflip in the ECC bytes leaves the data valid, and the
early exit also dropped the error entries that followed it.  This
matches how jz4740_ecc_correct() treats its indexes.

Verified with a userspace replica of the correction loop: with
params->size = 512, an index of 4099 (parity area) followed by a
data-area index of 100 in the same BHERR register is now corrected
(v1 returned -EBADMSG and left the data error unfixed), the field
maximum (0x1fff) produces no write outside the buffer, and in-range
indexes keep correcting as before.

 drivers/mtd/nand/raw/ingenic/jz4725b_bch.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/mtd/nand/raw/ingenic/jz4725b_bch.c b/drivers/mtd/nand/raw/ingenic/jz4725b_bch.c
index 2d0e0a2192ae..9b1c3d4e5f6a 100644
--- a/drivers/mtd/nand/raw/ingenic/jz4725b_bch.c
+++ b/drivers/mtd/nand/raw/ingenic/jz4725b_bch.c
@@ -259,6 +259,10 @@ static int jz4725b_correct(struct ingenic_ecc *bch,
 			bit = (reg & BCH_BHERR_INDEX0_MASK) >> BCH_BHERR_INDEX0_SHIFT;
 		}
 
+		/* Skip indexes outside the data area. */
+		if (bit >= params->size * 8)
+			continue;
+
 		buf[(bit >> 3)] ^= BIT(bit & 0x7);
 	}
 
-- 
2.50.1

