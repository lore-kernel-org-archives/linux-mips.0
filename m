Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.28.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793851319;
	b=k+cOEbBVH9QacOa/P/O9fb4r9nPqw3M4Gm8UuL2nnTDGnDyQ1s0ir7ZAHTbHAwqWDpvQ
	 xOjGxFwPATDXmNpS7o1KHIu4trImKalCH2+WsMLGibPYPwvk/mWlKni9b31egnVHOkXfn
	 /lXooaVlyPz8bQ0WeJVXrlKiJZst+qmpax6oFI++NTJwsUVPkbvPmUmrgL4LsFLf524kD
	 SM169dHsmTQwsY+zQDhShlcj49xuWI+W/UAfyIWmipMcyrkCs/pIEY556D5meoG/wdnQQ
	 sbeDavfZrGVscKYVshvY0EG8rgjnTBDmePFFkRYNOTX4VaRtlC7jKFQ058eJFR6jJFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793851319;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=a04bwAD3CWa8jx8Sccj/WRN3FIlsMNLG3H8MqdlBKlw=;
	b=5Q1zfvh+nRoSEiaGJg48oB8S60XMs4vTHCssgQGQPFcc+fP5QjTFQNBLbgcjQUzfyWAV
	 mmO37XIBqquNsq8/A9UO1oN5jJKuwVBxDuLshGhWH807ZlFsrzzHl1JOsONYn5yTd+fJa
	 aS9SfaS/+OXlaGTulRXWNXMdtjJhdsvaaGCrnyEvrW+bQJ4Ujib1dulY6l2/wGQcRslq7
	 XFmmF/Hb2jLMwu0XFbPtGrUI38BeoHLBYmzvAJOYZ/j2K57294suCv/TjsU4gErHSkjTx
	 70Q7B23zG4C30OxuBxFOvrw2CTxatrMupiliJDeRtmBrplFq/IRvI0LUKgOQrR0my8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=xiaopeng.com;
	spf=pass smtp.mailfrom=xiaopeng.com;
	dkim=pass header.d=xiaopeng.com header.i=@xiaopeng.com header.a=rsa-sha256 header.s=default header.b=ATE2wn4E;
	arc=none smtp.remote-ip=115.124.28.50
Received: from out28-50.mail.aliyun.com (out28-50.mail.aliyun.com [115.124.28.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAFFB606A335;
	Thu,  5 Nov 2026 04:01:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CAFFB606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=xiaopeng.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xiaopeng.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=xiaopeng.com header.i=@xiaopeng.com header.a=rsa-sha256 header.s=default header.b=ATE2wn4E
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xiaopeng.com; s=default;
	t=1793851315; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=a04bwAD3CWa8jx8Sccj/WRN3FIlsMNLG3H8MqdlBKlw=;
	b=ATE2wn4EF/nTmyPmoncoQhIKGa1lllRdszaofbssQsZMJgRq12YsWVqSUXLQXmvWlw5xKBT4sQaoAjKz2aEUj0UlReiekhJpslMmZJcrbq2hnGB9oeR3hsDu898FtPMElKE99CKW3yD7oEkwleI3cmpkJnijtqmOmJYWuQ6Smy8=
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.1582222|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.0131348-0.000717347-0.986148;FP=13791973953732560476|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam011083099174;MF=zhugl3@xiaopeng.com;NM=1;PH=DS;RN=10;RT=10;SR=0;TI=SMTPD_---.jxDoTG0_1793851314;
Received: from DESKTOP-UL5U09E.xiaopeng.local(mailfrom:zhugl3@xiaopeng.com fp:SMTPD_---.jxDoTG0_1793851314 cluster:ay29)
          by smtp.aliyun-inc.com;
          Thu, 05 Nov 2026 12:01:54 +0800
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
Subject: [PATCH 2/2] mtd: rawnand: ingenic: validate BCH error index in jz4780_correct()
Date: Thu,  5 Nov 2026 12:01:53 +0800
Message-ID: <20261105040153.66597-2-zhugl3@xiaopeng.com>
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

The JZ4780 BCH controller reports each corrected bit error as a byte
pair index, in the INDEX field of the BCH_BHERR registers. The field
is 11 bits wide, but nothing in jz4780_correct() checks the reported
index against the size of the data buffer being corrected:

    buf[(index * 2) + 0] ^= mask;
    buf[(index * 2) + 1] ^= mask >> 8;

With data or ECC coming from an untrusted flash, the decoder can
report an index that points past the end of the data buffer, and the
above statements then flip bits outside the buffer.

Reject the page with -EBADMSG when the reported index does not fit in
the data area.

Fixes: ae02ab00aa3c ("mtd: nand: jz4780: driver for NAND devices on JZ4780 SoCs")
Signed-off-by: Weibin Liu <liuwb@xiaopeng.com>
---

Verified with a userspace replica of the correction loop: with
params->size = 512, an index of 256 (first parity word) or at the
field maximum (0x7ff) flips bits past the data buffer (ASAN
heap-buffer-overflow); in-range indices keep correcting as before.

 drivers/mtd/nand/raw/ingenic/jz4780_bch.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/mtd/nand/raw/ingenic/jz4780_bch.c b/drivers/mtd/nand/raw/ingenic/jz4780_bch.c
index 12b5b0484fe9..204bc853c1b4 100644
--- a/drivers/mtd/nand/raw/ingenic/jz4780_bch.c
+++ b/drivers/mtd/nand/raw/ingenic/jz4780_bch.c
@@ -216,6 +216,11 @@ static int jz4780_correct(struct ingenic_ecc *bch,
 						BCH_BHERR_MASK_SHIFT;
 			index = (reg & BCH_BHERR_INDEX_MASK) >>
 						BCH_BHERR_INDEX_SHIFT;
+			if ((index * 2) + 1 >= params->size) {
+				ret = -EBADMSG;
+				goto out;
+			}
+
 			buf[(index * 2) + 0] ^= mask;
 			buf[(index * 2) + 1] ^= mask >> 8;
 		}
-- 
2.50.1

