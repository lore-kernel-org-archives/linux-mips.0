Received: from xmbghk7.mail.qq.com (xmbghk7.mail.qq.com [43.163.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C0752BEC23;
	Tue, 14 Jul 2026 13:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=43.163.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784035697; cv=none; b=TAwV0nNq3pwpaNIDv7bet72DTPXNBa1gvltkhnFpASfbg1SmT6xw+2HahAxhAeCDjblvZjTC9UVupPhiU26/OOnpr6YMGKBw3oeecR2XFHf57jWN3HkZlXNJJ7KNm+/Wdwhe+gtHpXccVspaa8FRGzkpGbLbXXIcFSHbTmSNo+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784035697; c=relaxed/simple;
	bh=T/OBsfjWk8J9caJeb/SwsmruuJ9gfComWrD5lkIm0U4=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=BAaa/Q0WiOMQ4oHICHWNpuYAyM3ZZsWIbOhzQlGZ/mjzq01mu6uZ/271dOdQW1AkfYhVC1oKYVRGoIsW1thgZtWomD0Gbx4K+F6McYptXVZpnbcmos2mqMSzHXJJpcmrVPsdfGEx82LrzlCTtci4+ariJQlU9abN5r8l83OFQiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=hFGqlFNp; arc=none smtp.client-ip=43.163.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="hFGqlFNp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1784035693; bh=mIDDr/5aKoeEeRHun54+8LLtK/KtHlM0s33+71yD/Ck=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=hFGqlFNpP1MkA/ie002I5PjDDhm/kGvwCVyTvGLIIqJQpW/fX70CRIZq/QYmE2tY9
	 TVvtWMVnQSlr0PD0RgfVWF/Pd3kOgNwBk5kZdNaV8PvP7lNM6IZ/YPfRXHbCc6pWxZ
	 WD0Q5Bxrc15u3Snw5y76D4PivG0pF76s3CAhjLkc=
Received: from localhost.localdomain ([116.128.244.169])
	by newxmesmtplogicsvrsza63-0.qq.com (NewEsmtp) with SMTP
	id 70B1EC6E; Tue, 14 Jul 2026 21:28:11 +0800
X-QQ-mid: xmsmtpt1784035691trakmqpe3
Message-ID: <tencent_880FD85090AE06087ABB6451DAE1F77A0309@qq.com>
X-QQ-XMAILINFO: N6IfSeM/PG+tgzThJ5S2joI2g0emFTRGs2MqDsz8A7PS6FlyoGIQsrcpTNI62y
	 dh5FKnZZsPe5LS9Iryk5SLk46dkJwrGW+eER0c2qM5CpTMBkyUHWwdxpOmM6GmqtQFXjOpij5d9/
	 dwpOg/CVar2kUwuwS+YVvcxeOxqLWwT2K6S+MWxPr/LeDB18JJIVQjoltk9kG+2wG5f3kio9s7t5
	 Nkfa2Zlv7aC6Mjh22EFVfE2j/DfPYXYLJYANvCt394Zf/Od/JpG4eUFAx4gsgd0TctNo1wNMbebz
	 ug4SaXSqiMrbAXy6JwbRAQySQj0MBqBUio2z+cqegN1zuyKDjUfmR5pHViIYtcbdVeXawa6SMSVC
	 0cgaddJpKdxlvNwerU6sy3ZC/TfzYiLNvR4oDCkM0zwGZjMTbmxHC2CzDy5gvCrIcsF2hVhk1Ofx
	 vspE/48dTBpzMPBlQKmLDRNuqiNrUseTqWukwPLp3KNKWGQUkEYe9DDN+zASFXvcqdAjTuFm16qy
	 v1FpbYzPSrZYazfCndQ816J/49xhdMBflbTEPi/1qUwBHQMiWP9QS+xqsk0QY0UQ6BtxBybCattW
	 XZsssmHpBElxoNlqxrNKbo7r1yA8IIFrqQ7UVyLt9bBSBgT1T8zRm6KE+H9SNPymB8Cmj6N3CgOF
	 iOXIPxXNyf4DyXY3GpqR3tHMFweFIvjRm10RUPrPa7+T6wpFcI9+3QooynrUaJwuZiBbReZ7dIEN
	 rleX1lPqJDZJDhXdhz+6Tg7VgZgtyyu1H1ogNtWzR4/Tu+zDCp49oQO2lrIEXKPKSIXp85vgPYcV
	 etNcHkcPSOYMvv/DPQtDARglG8GeJrGBp3hLZ4xCO7ytBfog42zAify/AbSttDndS8Z855ICRyaG
	 EyLHrQApEzXwa2zrtkdumevxQ+7zL537HcRFNDPXBxHXm0YTwH3lT9XpBw8PI3lfAEjAqjXIa+V6
	 f42YyS7m9YPhutMu3oeq0fQfT1u9bDtlKsM66BCbaCrD8ElsCYL6vxvuxL0YbD854UH4Ew7bHmiV
	 5OIos+pMeUn0xxmR64yNyetU6gwJ1VtKVe34bVndwRJrO3fHoPwvMErtB7fWKnkCJakSCtlB4PiI
	 2slH1v3Qx/xlqDt9tWJSueRKzIBLwojAsejzkX4LoA9wjo8ks=
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
From: Haofeng Li <920484857@qq.com>
To: tglx@kernel.org
Cc: linux-kernel@vger.kernel.org,
	Haofeng Li <13266079573@163.com>,
	Haofeng Li <lihaofeng@kylinos.cn>,
	Caleb James DeLisle <cjd@cjdns.fr>,
	linux-mips@vger.kernel.org
Subject: [PATCH 09/16] irqchip/econet: clean up VEIC initialization
Date: Tue, 14 Jul 2026 21:24:45 +0800
X-OQ-MSGID: <20260714132453.3302672-7-920484857@qq.com>
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

When cpu_has_veic is set, econet_cpu_init() failure returns without
tearing down the already created IRQ domain, ioremap, memory region,
or parent IRQ mapping. The parent interrupt-controller node obtained
while finding the IPI domain also retains an OF node reference on both
success and failure.

Drop the parent node reference after the domain lookup and route VEIC
initialization failures through the existing resource cleanup labels
after removing the IRQ domain.

Fixes: 2ee2a685ee83 ("irqchip/econet-en751221: Support MIPS 34Kc VEIC mode")

Signed-off-by: Haofeng Li <lihaofeng@kylinos.cn>
---
 drivers/irqchip/irq-econet-en751221.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-econet-en751221.c b/drivers/irqchip/irq-econet-en751221.c
index 2ca5d901866f..f6f890b3f881 100644
--- a/drivers/irqchip/irq-econet-en751221.c
+++ b/drivers/irqchip/irq-econet-en751221.c
@@ -378,6 +378,7 @@ static int __init econet_cpu_init(struct device_node *node)
 	}
 
 	econet_intc.ipi_domain = irq_find_matching_host(parent_intc, DOMAIN_BUS_IPI);
+	of_node_put(parent_intc);
 	if (!econet_intc.ipi_domain) {
 		pr_err("%pOF: Failed to find parent %s\n", node, "IPI domain");
 		return -ENODEV;
@@ -459,7 +460,7 @@ static int __init econet_intc_of_init(struct device_node *node, struct device_no
 		ret = econet_cpu_init(node);
 
 		if (ret)
-			return ret;
+			goto err_remove_domain;
 	} else {
 		irq_set_chained_handler_and_data(irq, econet_intc_from_parent, domain);
 	}
@@ -468,6 +469,8 @@ static int __init econet_intc_of_init(struct device_node *node, struct device_no
 
 	return 0;
 
+err_remove_domain:
+	irq_domain_remove(domain);
 err_unmap:
 	iounmap(econet_intc.membase);
 err_release:
-- 
2.25.1

