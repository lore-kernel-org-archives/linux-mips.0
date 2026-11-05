Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.28.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793851323;
	b=v9KdtI5LBaUctNx1U0H903mI+isk7YvhTHT1SLeM9Lh17grgPh3+PH9ruYrGKkN5aCys
	 TvkIrNBpBi7nLD7EwnBWA+3M4dUIOa4I6WolB4eUh+Ao2WJ1HM6zuzKFre5+dWXHYqP3s
	 pn6fyX6juHgTtVkhdiR49T/ncY/uAhCNZmlzfLPPcZkm+/GdSY+f5evDVXSIpV7jk2fF+
	 OJzLnsVLJArHlHiWr3BXxAjEe9duHQ/COQu5DX33GvZIznoS/oHsLhXmIE0mnPGi54BtH
	 jWtrTkSu4aut5Xrx70BAcd0YMsZrgpIenMbCLtG3I/DLmyPFoE3jiHFR9PX8KOOqg9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793851323;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=LW2nxoDQfkvtC3DewNXRVRw+G95NHkM+AwCYQizL5w4=;
	b=rdvgE7LuONQXfunLqLb0iN+CLRvAr2fmox0BOWyqoMN/DGGU7j+X/1W1jsQSxsyjuM9c
	 GvhNEHbFuUECUoCKPcd/53eHMYd/q6UBj1g1eBLhP9vNrU/ckphIKVTCe7iMZCho2acHp
	 j8/lX/o611heXW+1Yzj1vmmJemOCJ/FBE28paJTCxSLcRwIecK9WkuWMBvYJu9RlFB4pT
	 TSSuJSMhcASRmOZ4WOLfKnSIfX0LWWwzKNIjFJrLBPNC5XBgt5EdHSEUPUGUCeS0z+x23
	 B1DstPEc8iS5Rdm1UWy4yBbAXDvVDbaG8JZFTw0EXvogBvahxZT7TJaE0xQThtrngRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=xiaopeng.com;
	spf=pass smtp.mailfrom=xiaopeng.com;
	dkim=pass header.d=xiaopeng.com header.i=@xiaopeng.com header.a=rsa-sha256 header.s=default header.b=KuMgghNj;
	arc=none smtp.remote-ip=115.124.28.52
Received: from out28-52.mail.aliyun.com (out28-52.mail.aliyun.com [115.124.28.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DECDF606D805;
	Thu,  5 Nov 2026 04:02:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DECDF606D805
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=xiaopeng.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xiaopeng.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=xiaopeng.com header.i=@xiaopeng.com header.a=rsa-sha256 header.s=default header.b=KuMgghNj
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xiaopeng.com; s=default;
	t=1793851314; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=LW2nxoDQfkvtC3DewNXRVRw+G95NHkM+AwCYQizL5w4=;
	b=KuMgghNjGfuu4dOKYq3mXT7FP6RKKabDW1VG+W8yzoM+O9bqkDcu2I05L4KGC8gBC/HaWUPfjonEX11Lr+LIvptn6LyLU4+xzEVA/q0ms+jrvdanxecMJ4nQFS/kT7zxOaBvzF8S0MWJqRk91Cj/6S2+lZn0GaN6zrJDPWSrEck=
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.1151963|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.0112819-0.000850659-0.987867;FP=13710838753577918036|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033025068124;MF=zhugl3@xiaopeng.com;NM=1;PH=DS;RN=10;RT=10;SR=0;TI=SMTPD_---.jxDoTFC_1793851313;
Received: from DESKTOP-UL5U09E.xiaopeng.local(mailfrom:zhugl3@xiaopeng.com fp:SMTPD_---.jxDoTFC_1793851313 cluster:ay29)
          by smtp.aliyun-inc.com;
          Thu, 05 Nov 2026 12:01:53 +0800
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
Subject: [PATCH 1/2] mtd: rawnand: ingenic: validate BCH error index in jz4725b_correct()
Date: Thu,  5 Nov 2026 12:01:52 +0800
Message-ID: <20261105040153.66597-1-zhugl3@xiaopeng.com>
X-Mailer: git-send-email 2.43.0
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
report an index that points past the end of the data buffer, either
into the parity area of the codeword or beyond it entirely, and the
above statement then flips a bit outside the buffer.

Reject the page with -EBADMSG when the reported index does not fit
in the data area.

Fixes: 3e6ac2ad90b3 ("mtd: rawnand: ingenic: Add support for the JZ4725B")
Signed-off-by: Weibin Liu <liuwb@xiaopeng.com>
---

Verified with a userspace replica of the correction loop: with
params->size = 512, an index pointing into the parity area (bit =
4099) or at the field maximum (0x1fff) flips bits past the data
buffer (ASAN heap-buffer-overflow); in-range indices keep
correcting as before.

 drivers/mtd/nand/raw/ingenic/jz4725b_bch.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/mtd/nand/raw/ingenic/jz4725b_bch.c b/drivers/mtd/nand/raw/ingenic/jz4725b_bch.c
index 2d0e0a2192ae..727f135f381e 100644
--- a/drivers/mtd/nand/raw/ingenic/jz4725b_bch.c
+++ b/drivers/mtd/nand/raw/ingenic/jz4725b_bch.c
@@ -259,6 +259,11 @@ static int jz4725b_correct(struct ingenic_ecc *bch,
 			bit = (reg & BCH_BHERR_INDEX0_MASK) >> BCH_BHERR_INDEX0_SHIFT;
 		}
 
+		if (bit >= params->size * 8) {
+			ret = -EBADMSG;
+			goto out;
+		}
+
 		buf[(bit >> 3)] ^= BIT(bit & 0x7);
 	}
 
-- 
2.50.1

