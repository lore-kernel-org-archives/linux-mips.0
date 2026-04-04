Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E5682F0C7E;
	Sun,  5 Apr 2026 02:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775356335; cv=none; b=L4MJxzBCMToj3xmXfWZRjcf89KIpKyzJwy/2q8whOIS6Ax5S5bwjnUIqMn4CIrxe1PxUgd1+NlCGGZKSvqFxAFsqiW1rN1Mvhpl29/BCAm1B9LjtiqRVTYHSysgTM7ffd1yEbrF4BcAA8ypDArlmR1Jg+5ktvseJUuiRYPQ3VYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775356335; c=relaxed/simple;
	bh=d4etwWXMhDwgGLFSO6gPnnoGiL4LwaiZ9KNe8jnrALA=;
	h=From:Date:Message-ID:To:Cc:In-Reply-To:References:Subject; b=d6lFhkrYXmouWuXKNmPvy+c3FLihNHRhFtsVw5waVVtX1XYVtejxybBvk4CmrpgN3Nxbi+DNNOiWgWaF+82lHsVQYxhM8PAxoF41WvOytVj+/RtbxNovavDyKwL0gXQ7bNojwjfqm7lziKSQO+ZA6L9kCZJRFRxf32dCOhSX9Kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from 0007-MIPS-malta-init-bound-default-console-command-line-a.eml (unknown [111.196.245.197])
	by APP-01 (Coremail) with SMTP id qwCowAD3oGyrydFpYVU5DA--.18667S2;
	Sun, 05 Apr 2026 10:32:11 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
Date: Sat, 4 Apr 2026 22:06:17 +0800
Message-ID: <20260405102007.7-mips-cmdline-pengpeng@iscas.ac.cn>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, pengpeng@iscas.ac.cn
In-Reply-To: <20260405102000.0-mips-cmdline-series-pengpeng@iscas.ac.cn>
References: <20260405102000.0-mips-cmdline-series-pengpeng@iscas.ac.cn>
Subject: [PATCH 7/8] MIPS: malta-init: bound default console command-line
 append
X-CM-TRANSID:qwCowAD3oGyrydFpYVU5DA--.18667S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Kw47ur48ZrWkJFykXFyUtrb_yoW8Gw4kpF
	4qyFnxK34rXFyY9a43ZFy8Xr1rCasYy343tF1Yyw4xW3ZxAFW0van3Gw45Z3yUXr48G3W8
	CFZ0qFy7Ca13Ar7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvK14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2jI8I6cxK6x804I0_Grv_XF1l8cAvFVAK0II2c7
	xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE
	2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjc
	xK6I8E87Iv6xkF7I0E14v26F4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40E
	FcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUAVWUtwAv7VC2z280aVAFwI0_Gr
	0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IE
	rcIFxwCY1x0262kKe7AKxVWUAVWUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbV
	WUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF
	67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUCVW8JwCI42
	IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF
	0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxh
	VjvjDU0xZFpf9x0JUxcTPUUUUU=
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>

console_config() appends a synthesized console= option to fw_getcmdline()
with unchecked strcat() when the firmware command line does not already
provide one. If the existing command line is near full, that append can
overflow the fixed command-line buffer.

Switch the default console append to bounded concatenation.

Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 arch/mips/mti-malta/malta-init.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/arch/mips/mti-malta/malta-init.c b/arch/mips/mti-malta/malta-init.c
index 82b0fd8576a2..fb782b1a3f6e 100644
--- a/arch/mips/mti-malta/malta-init.c
+++ b/arch/mips/mti-malta/malta-init.c
@@ -78,13 +78,14 @@ static void __init console_config(void)
 		setup_earlycon(console_string);
 	}
 
-	if ((strstr(fw_getcmdline(), "console=")) == NULL) {
-		sprintf(console_string, " console=ttyS0,%d%c%c%c", baud,
-			parity, bits, flow);
-		strcat(fw_getcmdline(), console_string);
-		pr_info("Config serial console:%s\n", console_string);
+	if ((strstr(fw_getcmdline(), "console=")) == NULL) {
+		sprintf(console_string, " console=ttyS0,%d%c%c%c", baud,
+			parity, bits, flow);
+		strlcat(fw_getcmdline(), console_string,
+			COMMAND_LINE_SIZE);
+		pr_info("Config serial console:%s\n", console_string);
+	}
 	}
-}
 #endif
 
 static void __init mips_nmi_setup(void)
-- 
2.50.1 (Apple Git-155)

