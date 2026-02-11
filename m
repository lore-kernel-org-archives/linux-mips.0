Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4E5E35DCE6;
	Wed, 11 Feb 2026 09:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770803080; cv=none; b=hDxY+h5KplgEGfXL9nW3i60ay5ngwXPQ/5Q2Hr6hpGATzTnx1LKmAt1MG8q05e/sI+7iDUsb1SRO/JSzzAZukLmoui6gtGtyvxYcoSvgurnggc7cYf0YfeFdk7c5Rz69If8Wd+L/OH7Mxn6o04UJMH1kMhE+cqH/gLC3HLoJztQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770803080; c=relaxed/simple;
	bh=/CeqxqPUnQJzjFvzJniNuf9u59MDwcOFw9vAHhBJwHY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Xwqj6OVURANYlgvx9YHUrBw4CD1Qix7jLf+VZjH4/Tjoa3KtAw8aNcMhOVV5yLjXDtPcAVyMFUFkLKwAzVde/jwXxMFhXp0Tnzc+wEbVogaCozgsAaUFPWxT+ceWBMWmpfNE8fb1c3OVkecd6zR05GBRtm/ycKriNByxCt7xQ8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from edelgard.fodlan.icenowy.me (unknown [112.94.101.168])
	by APP-01 (Coremail) with SMTP id qwCowAAHsm1rT4xph_KtBw--.27918S7;
	Wed, 11 Feb 2026 17:44:21 +0800 (CST)
From: Icenowy Zheng <zhengxingda@iscas.ac.cn>
To: Thomas Gleixner <tglx@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Huacai Chen <chenhuacai@kernel.org>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: Yao Zi <me@ziyao.cc>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org,
	Icenowy Zheng <zhengxingda@iscas.ac.cn>
Subject: [PATCH v2 5/7] irqchip/loongson-pch-lpc: enable building on MIPS Loongson64
Date: Wed, 11 Feb 2026 17:44:06 +0800
Message-ID: <20260211094408.3463916-6-zhengxingda@iscas.ac.cn>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260211094408.3463916-1-zhengxingda@iscas.ac.cn>
References: <20260211094408.3463916-1-zhengxingda@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qwCowAAHsm1rT4xph_KtBw--.27918S7
X-Coremail-Antispam: 1UD129KBjvdXoW7XF4DKr18CF47Jw43Jr4fKrg_yoW3CrX_C3
	4Y9Fs7JF17CryUJryrGF4fZryjkayqgr92kF4Yqw1fX3WxXw1xWw1UZay5JF13WFyrWFna
	v3yxurn7Ar1ayjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbv8FF20E14v26rWj6s0DM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI8067AKxVWUAVCq3wA2048vs2
	IY020Ec7CjxVAFwI0_Xr0E3s1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28E
	F7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr
	1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1l
	e2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI
	8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwAC
	jcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka0x
	kIwI1lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_
	Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1V
	AY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAI
	cVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIx
	AIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2
	KfnxnUUI43ZEXa7VUbPC7UUUUUU==
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/

As the driver can now support OF-based platforms, it's now possible to
use it on MIPS Loongson64 machines.

Drop the requirement of LOONGARCH for this driver, to allow build on
both MIPS-based and LoongArch-based Loongson systems.

Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
---
 drivers/irqchip/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index f07b00d7fef90..f2eee2bd61dd0 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -761,7 +761,6 @@ config LOONGSON_PCH_MSI
 
 config LOONGSON_PCH_LPC
 	bool "Loongson PCH LPC Controller"
-	depends on LOONGARCH
 	depends on MACH_LOONGSON64 || LOONGARCH
 	default MACH_LOONGSON64
 	select IRQ_DOMAIN_HIERARCHY
-- 
2.52.0

