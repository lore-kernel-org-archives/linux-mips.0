Received: from xmbghk7.mail.qq.com (xmbghk7.mail.qq.com [43.163.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F76C30DEDC;
	Tue, 14 Jul 2026 13:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=43.163.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784035763; cv=none; b=eNZD7ENx7HU1x1ZUb9DxGoXBKv4vJNI0C8Pn7lcTmozXxuAmUtZC3agMQqZJ5m3bWS3rsC5J162bfHUM0nyp0VME2pCFtMkVB0Yiea6kVmv/iOoYa+H2v6Yh6j0FJ6ya5wSM8RHEdLvRWUmcU4QZliW7X8Qv31GqW4lSar+jyPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784035763; c=relaxed/simple;
	bh=2DV3SGD5VJF5E5b5U9AnI7Q5dQ7RkmRWvRYDFAj2DZ0=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=sEwLT2olSjax3+9hdw1bDGM1imwe6tAdpphg/6rDD5Od51KP0KFW9CQR2CFNL2J/wywm6E/JEna+K7Z/Y481xmzGeX7qu5w5JtFRQbQAGJGYRxZs3wO5KZxEADwOluUbNepp0JyYiRoG/bmt09wg4z6d4zWs11xU0CAdoYl/AEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=aP2FGaaG; arc=none smtp.client-ip=43.163.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="aP2FGaaG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1784035757; bh=DfAGBFN1HzmjdfMz4mnFBDT39QhLYZeyDovAvQ0bzmo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=aP2FGaaGanXThKbPK1+wRZjnq7HB0yWEb2VoLLTSBnjjVcLXTw+uvKvkFey2zzASq
	 /3k5UnXT/mgbyIlslJiXWbkGfd/Ot/fJHbo4aMvXSlpF7qJTz+UGEBZXrkHEb6Tfz5
	 puMcIGC7wkkW8fXBv4x7whkEYMtzkbNfEbmaHMhE=
Received: from localhost.localdomain ([116.128.244.169])
	by newxmesmtplogicsvrsza63-0.qq.com (NewEsmtp) with SMTP
	id 74E34E85; Tue, 14 Jul 2026 21:29:14 +0800
X-QQ-mid: xmsmtpt1784035754tj1hnu6eu
Message-ID: <tencent_E96C92486B0354BDDEB220ED1A7B06811908@qq.com>
X-QQ-XMAILINFO: MXi6VldghLL77DcBFIGwMklig4M9MJyBXNbrRlJirYHMRy3yQM0gjoAsN9ZyY8
	 xVz8hDCpsWAx8ZGOwGa7Ea16u9aZKjpDJHW5d7GlGrSZdHNwPMxCtHFk7hyZfthMaiZ9U80WKlm7
	 DLvzHLFL3LbuVrbfESik3OnXlOf0OI17ljAVtMyUzigRzF3QFbTPNf1lcG9gkQr0OVwaafymrbhD
	 Xvd/27MPR7Hh3D0qXQQGDhbyU5XBaj88x9Fyz846CO6c8OclphX4UUIqKOve1Q0KQLIjumSosDV1
	 ke5EBOHdOnry7otW4KWits9DLcqxo0O265lxH7ANSkqHi9oYxOQ1lvdPg7w8issBJrl1tnMdTilo
	 TfR29t0D+xzrtK4FztBTmvMcd8CiczaDGiZD0KmS8CNOwNmCP3SszzPVdFwxB3kydXhDS4IpjXTC
	 0mQegacFON+QlhTG+ZHFwVBulZIeOm5A1x+x2kX25CN/UbwwF9P3QcDKeKM9qGpF2Qdp09j3jFIU
	 knmERcqMmarYfzK9DNp/ZRkEauuZzaEdpBvZCltkOXjuZ2SSa/+YbD3ODgkcWot3QlTpL1jP1omV
	 7PDCueAp2JtpRD3FZs2F/4/7eqWYKvS7cDVMq7ml4nKRpu2UmJboXFd27Z9KYQOCZGkun5CqV/PG
	 pfGVT9X1njnoZCJa6tDtgp4BPglZemepEIS5qKXfARhpR2KkB0V8+mRxTtanQSEWTl/gFcfNUbuH
	 gZ6Q/W/mBaQlSGa5Rkw+POUytIrNbXrZbHzsZsdIvbVw8U0sQ8k0+lxKTijiqIS/kEz7RYqo/KhX
	 UzQS2bK+blFoKgTnm7BlNBlSoxfvf41vpZnmkHBtyW0ZgSY32jrCKqOBBkiGHLtFIMK5NNnxkU7Q
	 lKW/ZaU+i8SnQmli+JiOlhhq3RW2y0BwOtBcOfgUtKahXdJLxIPk0XK80KtThFc+n7WvGaagbgmm
	 pWxQGXjTilE1mAMaS50TIDXsxfIVUEt2WGjH5fVxk8zMqL8H50DBJjFmPC/3unkZ6YLkE7DiwXKM
	 HpQJPPVteJ5Q0Y5M0moOU149qIHrEBicKdlIF8Kg==
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
From: Haofeng Li <920484857@qq.com>
To: tglx@kernel.org
Cc: linux-kernel@vger.kernel.org,
	Haofeng Li <13266079573@163.com>,
	Haofeng Li <lihaofeng@kylinos.cn>,
	Huacai Chen <chenhuacai@kernel.org>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Marc Zyngier <maz@kernel.org>,
	Binbin Zhou <zhoubinbin@loongson.cn>,
	linux-mips@vger.kernel.org
Subject: [PATCH 11/16] irqchip/loongson-eiointc: preserve live state on cascade failure
Date: Tue, 14 Jul 2026 21:24:47 +0800
X-OQ-MSGID: <20260714132453.3302672-9-920484857@qq.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260714132453.3302672-1-920484857@qq.com>
References: <20260714122351.3274006-1-lihaofeng@kylinos.cn>
 <20260714132453.3302672-1-920484857@qq.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Haofeng Li <lihaofeng@kylinos.cn>

eiointc_init() publishes priv through the IRQ domain, chained
handlers, eiointc_priv[], syscore operations, and CPU hotplug state.
If subsequent cascade initialization fails, jumping to
out_free_handle frees priv and its fwnode while all of those users
remain live.

Cascade initialization may also have created PCH PIC, MSI, or LPC
child domains before reporting an error, so removing the EIOINTC
parent at that point is not a safe rollback.

After eiointc_init() succeeds, keep the published controller alive and
propagate the cascade error without freeing it. Before ownership is
transferred, validate the parent mapping and dispose it if
eiointc_init() fails. Preserve the actual error code on all cleanup
paths.

Fixes: a3f1132c4c6b ("irqchip/loongson-eiointc: Add DT init support")

Signed-off-by: Haofeng Li <lihaofeng@kylinos.cn>
---
 drivers/irqchip/irq-loongson-eiointc.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/irqchip/irq-loongson-eiointc.c b/drivers/irqchip/irq-loongson-eiointc.c
index a9e8b481d31d..d2310a1ebbd6 100644
--- a/drivers/irqchip/irq-loongson-eiointc.c
+++ b/drivers/irqchip/irq-loongson-eiointc.c
@@ -580,7 +580,7 @@ static int __init eiointc_init(struct eiointc_priv *priv, int parent_irq,
 int __init eiointc_acpi_init(struct irq_domain *parent,
 				     struct acpi_madt_eio_pic *acpi_eiointc)
 {
-	int parent_irq, ret;
+	int parent_irq, ret = -ENOMEM;
 	struct eiointc_priv *priv;
 	int node;
 
@@ -599,10 +599,12 @@ int __init eiointc_acpi_init(struct irq_domain *parent,
 	priv->node = acpi_eiointc->node;
 	priv->parent_hwirq = acpi_eiointc->cascade;
 	parent_irq = irq_create_mapping(parent, acpi_eiointc->cascade);
+	if (!parent_irq)
+		goto out_free_handle;
 
 	ret = eiointc_init(priv, parent_irq, acpi_eiointc->node_map);
 	if (ret < 0)
-		goto out_free_handle;
+		goto out_dispose_mapping;
 
 	if (cpu_has_flatmode)
 		node = early_cpu_to_node(acpi_eiointc->node * CORES_PER_EIO_NODE);
@@ -612,18 +614,17 @@ int __init eiointc_acpi_init(struct irq_domain *parent,
 	acpi_set_vec_parent(node, priv->eiointc_domain, msi_group);
 
 	ret = acpi_cascade_irqdomain_init();
-	if (ret < 0)
-		goto out_free_handle;
-
 	return ret;
 
+out_dispose_mapping:
+	irq_dispose_mapping(parent_irq);
 out_free_handle:
 	irq_domain_free_fwnode(priv->domain_handle);
 	priv->domain_handle = NULL;
 out_free_priv:
 	kfree(priv);
 
-	return -ENOMEM;
+	return ret;
 }
 
 static int __init eiointc_of_init(struct device_node *of_node,
-- 
2.25.1

