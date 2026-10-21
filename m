Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792610732;
	b=ugQpjrSI9kS50kSMF2AmKFrKijpvc/VmmHLtT+NNF/fj0ti2stAkep6F/E1DF7Gp1VEE
	 To+f24NFpp7n9QFVEdOxNBT2Xg8WayG8BWMO/DRamt167B1LqQ9rJlIFLlE0x3ryHLqq2
	 ECPdI8RmsPup41W/prf1zXqx/GHmHVoH4Mg4q/klMFLbKdP6aNmzgIPaRwTUYpx9I1d5B
	 frvb8Dm+vK5jFeH1sboFhL056U9i/qjLyLdewAXTnOSLaz/OmLRMS57N/5q2+jBdXW7Gh
	 vI1sFeUeR/HK5Sy1BEj+LXKsgSPt16x6VZxHSObdkYNIW0i2ukuhHrq87RFFD4ZlIoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792610732;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=hFz37OzHFfKhRB9A+anaW0bFtAmqfq+k0A79Dv84kvw=;
	b=1AItQGYuMpUcHWf2GvHbp9/nOf/P6y4+9dlbb1CibAabqX8G7+vd9OkSgZSPthePj5RD
	 NSOucn/u+dHPV+aHutwXXjoVcFokQ6WDN7KG0S2DN6kzH4hjslm9TejvaiCRip+eEXvE5
	 Pm03NCZU+2jkDh897Plk4p8Ei74x3fPcVZwR8bvseTKS2GMfuayno0uYmjOFLQv6PjSxF
	 9H5HRns4truEd08m9kM8YTipgz2Yn2PN3wON8DHGZwJuqEfiBRzCrG8UvjBl6CGE8a6oc
	 XhgkNP5J1Xn63U8qgob9Np6dpBghdCyZyX5MpCw4wANmpgznpg6Djui6lM/gKtRHEQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eT6HCHkx;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEFBD606A323;
	Wed, 21 Oct 2026 19:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eT6HCHkx
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95C2A1F000C7;
	Wed, 21 Oct 2026 19:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792610731;
	bh=hFz37OzHFfKhRB9A+anaW0bFtAmqfq+k0A79Dv84kvw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=eT6HCHkx62escgcIwOuwo9D0xHBwxDZFvpJVs9FJYO3J1lrJTlc7iNNYR4eCSa6t8
	 KDmGVSaJMePZpw5vNpcY1gS0qiRCXNKEkrOgROsX+L96iTHpjR+raoICtumOoW0/f4
	 MLIM+SvkKWcUJRS/FRx2gduPB9M09bZmIKuyih5EuMVQFM16g4Lhjaa/KMQVuArXBk
	 ytoFP1bCu8bBeQEmpq1jMrhgQA3m6Pg4XjQ40YghYk/Jl6r5uZdZhsjQRrTu4zgOmw
	 q2jP5rqc0HsGj6dbZ53hv61WFKMAkqeXo7ybgKgt0FLiw3wZmST+TcBwgkVXyp3f/F
	 M4RDNUBbHMaYA==
From: Imre Kaloz <kaloz@kernel.org>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-mips@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] MIPS: sgi-ip32: Report the real CRIME revision
Date: Wed, 21 Oct 2026 21:24:17 +0200
Message-ID: <20261021192418.7246-4-kaloz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261021192418.7246-1-kaloz@kernel.org>
References: <20261021192418.7246-1-kaloz@kernel.org>
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

CRIME_ID's low nibble reads 1 on both rev 1.1 and 1.4 chips, so it does
not give the revision. ID 0xa has it in bits 63:32, and ID 0xb is rev
1.5. Decode it, and drop the unused CRIME_ID_REV.

Signed-off-by: Imre Kaloz <kaloz@kernel.org>
---
 arch/mips/include/asm/ip32/crime.h |  2 +-
 arch/mips/sgi-ip32/crime.c         | 26 +++++++++++++++++++++-----
 2 files changed, 22 insertions(+), 6 deletions(-)

diff --git a/arch/mips/include/asm/ip32/crime.h b/arch/mips/include/asm/ip32/crime.h
index 16c94a27beba..8f87b15b772b 100644
--- a/arch/mips/include/asm/ip32/crime.h
+++ b/arch/mips/include/asm/ip32/crime.h
@@ -22,7 +22,7 @@ struct sgi_crime {
 #define CRIME_ID_MASK			0xff
 #define CRIME_ID_IDBITS			0xf0
 #define CRIME_ID_IDVALUE		0xa0
-#define CRIME_ID_REV			0x0f
+#define CRIME_ID_IDVALUE_B		0xb0
 #define CRIME_REV_PETTY			0x00
 #define CRIME_REV_11			0x11
 #define CRIME_REV_13			0x13
diff --git a/arch/mips/sgi-ip32/crime.c b/arch/mips/sgi-ip32/crime.c
index b8a0e4cfa9ce..a24424437c6b 100644
--- a/arch/mips/sgi-ip32/crime.c
+++ b/arch/mips/sgi-ip32/crime.c
@@ -27,7 +27,9 @@ EXPORT_SYMBOL_GPL(mace);
 
 void __init crime_init(void)
 {
-	unsigned int id, rev;
+	static const char * const revs[] = { "1.1", "1.3", "1.4" };
+	const char *rev;
+	u64 id;
 	const int field = 2 * sizeof(unsigned long);
 
 	set_io_port_base((unsigned long) ioremap(MACEPCI_LOW_IO, 0x2000000));
@@ -35,10 +37,24 @@ void __init crime_init(void)
 	mace = ioremap(MACE_BASE, sizeof(struct sgi_mace));
 
 	id = crime->id;
-	rev = id & CRIME_ID_REV;
-	id = (id & CRIME_ID_IDBITS) >> 4;
-	printk(KERN_INFO "CRIME id %1x rev %d at 0x%0*lx\n",
-	       id, rev, field, (unsigned long) CRIME_BASE);
+	/* The revision of ID 0xa is in the upper word; 0xb is rev 1.5. */
+	switch (id & CRIME_ID_IDBITS) {
+	case CRIME_ID_IDVALUE:
+		rev = revs[min_t(u64, id >> 32, ARRAY_SIZE(revs) - 1)];
+		break;
+	case CRIME_ID_IDVALUE_B:
+		rev = "1.5";
+		break;
+	case 0x00:
+		rev = "Petty";
+		break;
+	default:
+		rev = "?";
+		break;
+	}
+	pr_info("CRIME id %1x rev %s at 0x%0*lx\n",
+		(unsigned int)(id & CRIME_ID_IDBITS) >> 4, rev, field,
+		(unsigned long)CRIME_BASE);
 }
 
 irqreturn_t crime_memerr_intr(int irq, void *dev_id)
-- 
2.47.3

