Received: from xmbghk7.mail.qq.com (xmbghk7.mail.qq.com [43.163.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4764030DEDC;
	Tue, 14 Jul 2026 13:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=43.163.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784035574; cv=none; b=XSaY4T8akyM0OaQ3Gt29GiqLHQmFJ9rNJ+o1moah3go0i+MXIBEJAe6mXqBoQODQywySxM3O+nqfEZOfnlRSSo+BnGfbr0ZyENnEaHodmID5F89X5JFxJTRBNaO9B+YL4/RWeLO9yVDswvX6fT44IxhZM36NAcMRcvp2qleXGaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784035574; c=relaxed/simple;
	bh=mnCTh4jZt5OhB9uum6Rs2IcLYyiCnm1NPitm74CcRdw=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=bpo8uGAmPHZ/L6xLuw+ae1PY+xt5Q6QJgtWF8w4O5ydt9EC6su0LF1O/F4ojLmhAAnkbghKXceNWD7ijfxvH9N4B0I109FRcP/tQ45y4KBr0ouFuhyjZThnMiDSimRlnumOF18m2zz7BmALsc3cqqmWCQU7rgJieoz4lAozHgHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=r+T5AWTK; arc=none smtp.client-ip=43.163.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="r+T5AWTK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1784035568; bh=WurAMj8fUbRUs3bWo+DMDLXzNYehd2ALO5JAyAdGhCU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=r+T5AWTKXpKii6TELGiR2V9m8vIXAtVkzhbKc9zZfevxcApmflOcCnWdHIxnFKntA
	 qfyBWDqDX2P1DtzyBhUSjUuSXizMEStJNbeYu52qXFWHPzwZh917accpfOVGrnNBGe
	 TGXwkbODYVQsgeBVZjpLl0QI/fm0HFviDt6Tixik=
Received: from localhost.localdomain ([116.128.244.169])
	by newxmesmtplogicsvrsza53-0.qq.com (NewEsmtp) with SMTP
	id 683A6032; Tue, 14 Jul 2026 21:26:03 +0800
X-QQ-mid: xmsmtpt1784035565t2pip2drd
Message-ID: <tencent_296C6E48B9034EBD75B25CEDA27B86815D08@qq.com>
X-QQ-XMAILINFO: M07Ulnfy3VHKIO0g8FFgT6sscs/VXsdgh9uha8aSYrF8TjDk3B49oJTg5d6ZPV
	 Z5yf3tVd8BDAV0sWIcn4a4P4VrByKOGR+uuicpMM6YoiD6sgzJoPxNdcGY6q51KSKCXEcTsTkY6n
	 NDSRNa9fbrUbXiFY5ESquB0eZgGYFdTz52FbD87bXovXr2NyWShdmF1mmEaqZy4spNOxiI3qs5r2
	 PtjUC4DmWlte63DAECz4M49Mm5VILM34pQHiGOjSb123O5BRQLnI3bsL1eR8TlM5zeVazPtJfFKf
	 X1PfA0FVgnfOBCubm+bBAM4QT+RPBd42aIY25P3xDf5YLgU5xqIrJVZZBM+AIeE3fjzjSo9kiBX0
	 P9KY7b81S75wCmOnGAeo1GCA4gW95GVMaA6ECzQoSqJj7eoUwU3ZEP5gS9psjpsGPlpW9C7qcSO4
	 WWloVDtUFtH36J6FZ5H5eektQ8nFAPcj0VlgHoR3aL8AapqRR4KLz0Ieob+dbrRpNrZXXzXh/BjD
	 ntCHKiiXyW5k6n9z+55qsOhUkNiMs3irgrMgQ6GLLG/V2wqAraBrDhlM5MWXC3t8e4eV9PfkHAs5
	 M97fxc1FyBqrouEKEuvJlFcpVsXWBCEoZg6VXl/csCW2VWL2QYcJGQaEMF23LSg88GwkGneYscZk
	 jZuTVEYMOft8hfygP78RwaLvQIvnRT74ajj0+VMJ0574408VBUkWmmoyziBUPXBa/coMElXQZAyi
	 kuFKdsMNh9IXj29S3uALb0etyMHinlDw8nJKhwP6Q0abkXY3Yy+z/+Rwv0EJMYh9N1XKpfVpjTOE
	 23mOUFwfGdhDeImdquLtna4KpJQsiyLkN+Oui6r5muVuvOJMSu+XnqR2isMlbLC5mLx/UdDFEv6P
	 XWYYxr/HgsBC6j0Ql3g8/peo1Ulw197g5ExiUD6hs2k8TfquUr/JAosng06DJAXAmmvnkZ6l7bG0
	 Lqnzn3nyICBjofd34hRY5V+anmhaMiSxQnRIGa7t4srUKvqpxR0N57Lt2/vkwpYI6RF8FF1T+0vG
	 cnYjY58akfHlcZJFCN292mM7QfSCwdu5jVyhes/w==
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
From: Haofeng Li <920484857@qq.com>
To: tglx@kernel.org
Cc: linux-kernel@vger.kernel.org,
	Haofeng Li <13266079573@163.com>,
	Haofeng Li <lihaofeng@kylinos.cn>,
	Huacai Chen <chenhuacai@kernel.org>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Jianmin Lv <lvjianmin@loongson.cn>,
	Marc Zyngier <maz@kernel.org>,
	linux-mips@vger.kernel.org
Subject: [PATCH 06/16] irqchip/loongson-liointc: unmap per-core iomaps on error
Date: Tue, 14 Jul 2026 21:24:42 +0800
X-OQ-MSGID: <20260714132453.3302672-4-920484857@qq.com>
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

For revision > 1, liointc_init() maps per-core ISR regions with
of_iomap(). out_iounmap only unmapped the main base, leaking successful
per-core mappings on later failures.

On the error path, iounmap any core_isr entry that is not an offset into
the main base mapping.

Fixes: 0858ed035a85 ("irqchip/loongson-liointc: Add ACPI init support")
Signed-off-by: Haofeng Li <lihaofeng@kylinos.cn>
---
 drivers/irqchip/irq-loongson-liointc.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/irqchip/irq-loongson-liointc.c b/drivers/irqchip/irq-loongson-liointc.c
index cf44a333b9c8..6451d8b466ce 100644
--- a/drivers/irqchip/irq-loongson-liointc.c
+++ b/drivers/irqchip/irq-loongson-liointc.c
@@ -312,6 +312,14 @@ static int liointc_init(phys_addr_t addr, unsigned long size, int revision,
 out_free_domain:
 	irq_domain_remove(domain);
 out_iounmap:
+	if (revision > 1) {
+		for (i = 0; i < LIOINTC_NUM_CORES; i++) {
+			void __iomem *core_base = base + LIOINTC_REG_INTC_STATUS(i);
+
+			if (priv->core_isr[i] && priv->core_isr[i] != core_base)
+				iounmap(priv->core_isr[i]);
+		}
+	}
 	iounmap(base);
 out_free_priv:
 	kfree(priv);
-- 
2.25.1

