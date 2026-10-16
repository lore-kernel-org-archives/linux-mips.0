Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39D374D7942;
	Fri, 16 Oct 2026 14:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792160071; cv=none; b=ishNK2G3qDHQuQFdfzFbUM7pMYJOpOOFIVZ/JyhTffL0crbwI56wtJmYQfkmwgoTt+ojRNpiraKfgOhQofrpqqfR7YJrBmi0yRk/r6HE8f3jiOrcFpshwol/tbfW2282NQcm7WjWRf9Ydu4j9XJbEM89aggkrif13ZJALDNq34g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792160071; c=relaxed/simple;
	bh=hjvh3xHm6j7/TTcN2LdWhnZTknM/UVlMxbzU1TAfpUE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kj4KychZB8I9+LDnh4ss4Q7A5mm1ipFEZJL+U8k0Zufon2eaAWQyVUB2Kynv5534/197RNebVyyuSZq6KA1m4h24rAreuQFX5wMQytXoFNkPG8sSIv75t2qg5rXkTTXjwoE/jOfY7o+Uhqs561I+IAitJgsN+Y6I4FMKw0EDQBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=Usj5XKq8; arc=none smtp.client-ip=220.197.31.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="Usj5XKq8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=gH
	EwhjQYjgjkExXicIsmoWyaNfl+82iLeyyT9AScVwg=; b=Usj5XKq8oNSBe53MCw
	ylai5kIniyZnGJbPcjFuE9wmPwfrF36SlLzI4/iVuXusu8bNdzlnlBcUaEM/x++I
	Gm0evCMmaZvrBCdNACHUerrkQNZYISDRe1tSIsfFrxxY3OC+8+EL1tCU8fwhXpDF
	g5J+InyNDMKP0TRw/wI+qdp94=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wD3NysnMdJq1dUUAg--.27711S8;
	Fri, 16 Oct 2026 22:14:06 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Huacai Chen <chenhuacai@kernel.org>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Radu Rendec <radu@rendec.net>,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Jiale Yao <yaojiale02@163.com>
Subject: [PATCH 6/6] irqchip/loongson-eiointc: validate MADT BIO-PIC entries
Date: Fri, 16 Oct 2026 22:13:57 +0800
Message-Id: <20261016141357.2793046-7-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261016141357.2793046-1-yaojiale02@163.com>
References: <20261016141357.2793046-1-yaojiale02@163.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3NysnMdJq1dUUAg--.27711S8
X-Coremail-Antispam: 1Uf129KBjvJXoW7Ww18JFy5Jw4rXF48Zw4kXrb_yoW8GF4rpF
	W3Aa9Iyr4UK3y5urn7Ka1DZryrZan5Zay2qFWxuaySvrnxZr1UuF10kF1DurWvy3y8G3W2
	9r4FqF4UuF15AaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pRhiSQUUUUU=
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbCzQ6m4GrSMS6x5wAA30

The BIO-PIC MADT callback reads the controller address before checking
that firmware supplied the complete fixed-size record. A truncated entry
can therefore cause an out-of-bounds read while selecting the parent
domain.

Validate the BIO-PIC record before accessing its address or passing it
to the initialization helper.

Signed-off-by: Jiale Yao <yaojiale02@163.com>
---
 drivers/irqchip/irq-loongson-eiointc.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/irq-loongson-eiointc.c b/drivers/irqchip/irq-loongson-eiointc.c
index a9e8b481d31d..f92e7702195a 100644
--- a/drivers/irqchip/irq-loongson-eiointc.c
+++ b/drivers/irqchip/irq-loongson-eiointc.c
@@ -454,8 +454,14 @@ static int __init pch_pic_parse_madt(union acpi_subtable_headers *header,
 					const unsigned long end)
 {
 	struct acpi_madt_bio_pic *pchpic_entry = (struct acpi_madt_bio_pic *)header;
-	unsigned int node = (pchpic_entry->address >> 44) & 0xf;
-	struct irq_domain *parent = acpi_get_vec_parent(node, pch_group);
+	struct irq_domain *parent;
+	unsigned int node;
+
+	if (BAD_MADT_ENTRY(pchpic_entry, end))
+		return -EINVAL;
+
+	node = (pchpic_entry->address >> 44) & 0xf;
+	parent = acpi_get_vec_parent(node, pch_group);
 
 	if (parent)
 		return pch_pic_acpi_init(parent, pchpic_entry);
-- 
2.34.1

