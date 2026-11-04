Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793771943;
	b=D+h31gEYnwQN8kpz6ZL1vTZVvy/f+NV8yiYoJoU6Vaoq0XcwQariNbH9/If5yTIl75xd
	 Y25ethsV50+45bE6O9oKZc/l9ym56N1FEZTB+tdmVidF4sz+tf5gYBmpCQIF6U3my+pyP
	 3dtrXV+9HORmIvFtl7nnfRH6Z9YACnIU7jQupQs/g/wBgHG7EGQQrrez4bOrx2O82Uk7w
	 5pmIsv5/dMeReYDcK8oqkGUPMB0truFPBbuG6L9G26k4T5MrR06VAOE6FDsbDFPxCJwdz
	 WdwBL6Rjcf00V5Oz83bCZt5Knuo3jhDgzimbTQEE2GQtSPHifNDmUn2sze18sX56BWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793771943;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=pExYmEdIIPdLsjT97NoDGGge/io4twUE/VxiyujIbn0=;
	b=ZvyvYAqGqnIcVzhnmAVJwIfpZNU+NKg6QDjEPlZfTy/n27fC7pJUV0jIVRGRvj/OGWQW
	 GpdVQDoAY6zvdWD5ikLW5ECWXu+FSx6zlTZklQ7ibV5bd56VBycLYP55DDiVI3xpJbXpy
	 1Sd8k4mvhS8sGgZ5BHdiEeNds32gBfZtY0qr7LWbVzy5r+/SfENOWhVsIvKq09HCXPP58
	 BGFn0JrqidCrpG/ZFDJgb9badWUSRBR+j8pQMtQ0w53j+ne86kbZlUYx7KFqZK9FaZWxe
	 J0qsxNAEd2FCfbPnb0yt11lIFQRV5N7DSKPYIFy9Y+Ys4h8BkavObp0c2B0UzQDh2xA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="nY/jG0of";
	arc=none smtp.remote-ip=209.85.215.173
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8909606D811
	for <linux-mips@vger.kernel.org>; Wed,  4 Nov 2026 05:59:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8909606D811
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nY/jG0of
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cdab938dc83so143890a12.3
        for <linux-mips@vger.kernel.org>; Tue, 03 Nov 2026 21:59:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793771942; x=1794376742; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pExYmEdIIPdLsjT97NoDGGge/io4twUE/VxiyujIbn0=;
        b=nY/jG0ofkyCD+1il5wmdQz3flThCqp/1PJ9uoPnm+rrNhFaGuhZ7VMKKmRVI7H5CNu
         SToDkLAoBW6x3uQ48wd7NW2wfA2gymuDb4xb/NZh4BcLWfk66vHVDEJuK2v3eAdcYlp9
         slWP0FigYoU4hYQ33xrSs0Po8YA3v1hBitEBzNLYUIpQOOWO5l3KWdLGQIHWtrUWxMAu
         pcMiQA2VcLNFutvpvJRuEx9qMhQgPKM3M06JNYyl/O5H+HqvSObBqEqvLAE1uj/ytQoK
         uNtkXjUc64nO5ArQ3ZgdMc5+XB/ON1wx0h21oWWV8Vz5VbTbQ0FBbRZaaaX8DqpEpaGk
         l50A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793771942; x=1794376742;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pExYmEdIIPdLsjT97NoDGGge/io4twUE/VxiyujIbn0=;
        b=tSem5EtdDBTAbMU0C8zM1r6Mh94tXSfyExKQYa757apl1T8l+7t/24kRfKCHAYg+jH
         c0SFJGIZVWdFfGmqT558UsRB646QysS3fJaV9q1XrOahhkr32Fo2MiXEk/wVob7LgKYu
         LyYz1YhzgkWwTjkWzkL0PqHOdGaZYvh2vXE1wksnyxhlbpGjxFD7lD/DVDjJJA+x0yQY
         ezztURoNxaEzdlQ+PxDK8MzbZ/TiMkGm55UemeqLP4Rl1xdHlGmdnqKDQDcgvnBPSBL+
         KgoMJmn0GwqGBX9ze7NYQOqwFqFdB1IwiE5Tan6yO/1HPTmAOox7r1xIvM8oU8lEYxqZ
         YxfA==
X-Gm-Message-State: APuU4Z8QgjJSSGwQd8A6PPmbar2l51nHjyUkuzoZ/1C+668Noygvs1Gr
	NtlQ9UruNcCb72UIk0XkpSE2/tLVZjaI1dgXvtTOQWievc/IBNxPW3bARFbvbg==
X-Gm-Gg: AYBFou2rsWcYSJJ7AadVryEpkWwsiAaSXjgJlTbG6vfDq/4NGsXYjkxNkzQNV2SFow8
	nUGVdjeIxX3z5hmKaF9EKUEc+5g6Pjxkpisg+d7j3rFE3PzxxHb02QVIFGTWywAX2Cvr5RqkkJx
	S8j5dI+idirOWcdJKoBihcl1zXeQWxMYFgo/eSzYfdK3LGl/qu5WREK3m/An8hjIxavw2gkQSk5
	QsoKedPnfmG0t5dFWi/8lTeP23WDdSnQkGDx2BFk8sZwhOJKY5+7boQY4CSPNlOskvuyIDVpt20
	VJh3ecWzpxe/LhvAciU/n+NFk9ie6MxIg2hxVfi2ICgnN0HhjyxAWvpJFkC5PpuwVEdoV+LqB/V
	ZH9VlOSOpiW5K7GQuARfV/VieJpl6X2z9p58XMPYP1F8QyrQ5OOh/K6U3iKDGQemqFWojfhtpAl
	rh7AzZoyPLuzSO3+5176FIZ/ojIG9UQu5qp9xELNxkASu0nOZI4/H00HWtF+q5eucrzXhOtFBzV
	Iovk3MOGoPJPGjeHWgMbehgAjRrWyzN/pHlurUpnZrKIvrOg+FXMnAtW9hXz+LR4BfRwsUganne
	nP2uzvmol28aO787iskP3z26nQjDnWLGOjaTuU3Mc498VrE0OcZgNOVjpVdavoDt4iKtPwtiQWN
	XZf3xztpvN8N7h6AtGcwk1vZjorI/TUZ73zLn8IW1T+320MBoKO8Z2mlk/wLC99HPdGliQj3H8H
	ONuIg=
X-Received: by 2002:a17:90b:184c:b0:3a6:f1d2:57f3 with SMTP id 98e67ed59e1d1-3ae897d439bmr11767124a91.58.1793771942089;
        Tue, 03 Nov 2026 21:59:02 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c9928c4sm7840110a91.15.2026.11.03.21.59.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 21:59:01 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: linux-mips@vger.kernel.org,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Alban Bedel <albeu@free.fr>,
	Antony Pavlov <antonynpavlov@gmail.com>,
	linux-kernel@vger.kernel.org (open list),
	linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK)
Subject: [PATCH 5/8] clk: ath79: convert to clk_hw based registration
Date: Tue,  3 Nov 2026 21:58:49 -0800
Message-ID: <20261104055852.152340-6-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261104055852.152340-1-rosenp@gmail.com>
References: <20261104055852.152340-1-rosenp@gmail.com>
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

Register the clocks with the clk_hw API and provide them with
of_clk_add_hw_provider() and of_clk_hw_onecell_get(), instead of the
struct clk based clk_register_*() and of_clk_src_onecell_get().

The AR724x and AR933x CPU, DDR and AHB clocks are fixed factors of the
reference clock, but named their parent "ref". That only works when the
reference clock is registered under that name, as the fallback from the
bootstrap pins is, or a device tree fixed clock whose node happens to be
called "ref". With any other node name, the clocks were orphans and ran
at 0 Hz. Give them the reference clock's clk_hw as the parent instead.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/clk/clk-ath79.c | 68 ++++++++++++++++++++++-------------------
 1 file changed, 36 insertions(+), 32 deletions(-)

diff --git a/drivers/clk/clk-ath79.c b/drivers/clk/clk-ath79.c
index 8279d58be318..3afda29377b5 100644
--- a/drivers/clk/clk-ath79.c
+++ b/drivers/clk/clk-ath79.c
@@ -18,17 +18,14 @@
 #include <linux/clk-provider.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
+#include <linux/slab.h>
 #include <dt-bindings/clock/ath79-clk.h>
 
 #include <asm/div64.h>
 
 #include "clk-ath79.h"
 
-static struct clk *clks[ATH79_CLK_END];
-static struct clk_onecell_data clk_data = {
-	.clks = clks,
-	.clk_num = ARRAY_SIZE(clks),
-};
+static struct clk_hw_onecell_data *clk_data;
 
 static const char * const clk_names[ATH79_CLK_END] = {
 	[ATH79_CLK_CPU] = "cpu",
@@ -44,42 +41,44 @@ static const char * __init ath79_clk_name(int type)
 	return clk_names[type];
 }
 
-static void __init __ath79_set_clk(int type, const char *name, struct clk *clk)
+static void __init __ath79_set_clk(int type, const char *name,
+				   struct clk_hw *hw)
 {
-	if (IS_ERR(clk))
+	if (IS_ERR(hw))
 		panic("failed to allocate %s clock structure", clk_names[type]);
 
-	clks[type] = clk;
-	clk_register_clkdev(clk, name, NULL);
+	clk_data->hws[type] = hw;
+	clk_hw_register_clkdev(hw, name, NULL);
 }
 
-static struct clk * __init ath79_set_clk(int type, unsigned long rate)
+static void __init ath79_set_clk(int type, unsigned long rate)
 {
 	const char *name = ath79_clk_name(type);
-	struct clk *clk;
+	struct clk_hw *hw;
 
-	clk = clk_register_fixed_rate(NULL, name, NULL, 0, rate);
-	__ath79_set_clk(type, name, clk);
-	return clk;
+	hw = clk_hw_register_fixed_rate(NULL, name, NULL, 0, rate);
+	__ath79_set_clk(type, name, hw);
 }
 
-static struct clk * __init ath79_set_ff_clk(int type, const char *parent,
-					    unsigned int mult, unsigned int div)
+/* a clock derived from the reference clock by a fixed factor */
+static void __init ath79_set_ff_clk(int type, unsigned int mult,
+				    unsigned int div)
 {
 	const char *name = ath79_clk_name(type);
-	struct clk *clk;
+	struct clk_hw *hw;
 
-	clk = clk_register_fixed_factor(NULL, name, parent, 0, mult, div);
-	__ath79_set_clk(type, name, clk);
-	return clk;
+	hw = clk_hw_register_fixed_factor_parent_hw(NULL, name,
+						    clk_data->hws[ATH79_CLK_REF],
+						    0, mult, div);
+	__ath79_set_clk(type, name, hw);
 }
 
 static unsigned long __init ath79_get_ref_rate(void)
 {
-	if (!clks[ATH79_CLK_REF])
+	if (!clk_data->hws[ATH79_CLK_REF])
 		panic("ath79: no reference clock");
 
-	return clk_get_rate(clks[ATH79_CLK_REF]);
+	return clk_hw_get_rate(clk_data->hws[ATH79_CLK_REF]);
 }
 
 static void __init ar71xx_clocks_init(void __iomem *pll_base)
@@ -128,9 +127,9 @@ static void __init ar724x_clocks_init(void __iomem *pll_base)
 	ddr_div = FIELD_GET(AR724X_DDR_DIV, pll) + 1;
 	ahb_div = (FIELD_GET(AR724X_AHB_DIV, pll) + 1) * 2;
 
-	ath79_set_ff_clk(ATH79_CLK_CPU, "ref", mult, div);
-	ath79_set_ff_clk(ATH79_CLK_DDR, "ref", mult, div * ddr_div);
-	ath79_set_ff_clk(ATH79_CLK_AHB, "ref", mult, div * ahb_div);
+	ath79_set_ff_clk(ATH79_CLK_CPU, mult, div);
+	ath79_set_ff_clk(ATH79_CLK_DDR, mult, div * ddr_div);
+	ath79_set_ff_clk(ATH79_CLK_AHB, mult, div * ahb_div);
 }
 
 static void __init ar933x_clocks_init(void __iomem *pll_base)
@@ -175,11 +174,11 @@ static void __init ar933x_clocks_init(void __iomem *pll_base)
 		ahb_div = FIELD_GET(AR933X_PLL_CLOCK_CTRL_AHB_DIV, clock_ctrl) + 1;
 	}
 
-	ath79_set_ff_clk(ATH79_CLK_CPU, "ref", ninit_mul,
+	ath79_set_ff_clk(ATH79_CLK_CPU, ninit_mul,
 			 ref_div * out_div * cpu_div);
-	ath79_set_ff_clk(ATH79_CLK_DDR, "ref", ninit_mul,
+	ath79_set_ff_clk(ATH79_CLK_DDR, ninit_mul,
 			 ref_div * out_div * ddr_div);
-	ath79_set_ff_clk(ATH79_CLK_AHB, "ref", ninit_mul,
+	ath79_set_ff_clk(ATH79_CLK_AHB, ninit_mul,
 			 ref_div * out_div * ahb_div);
 }
 
@@ -504,6 +503,11 @@ static void __init ath79_clocks_init_dt(struct device_node *np)
 	struct clk *ref_clk;
 	void __iomem *pll_base;
 
+	clk_data = kzalloc_flex(*clk_data, hws, ATH79_CLK_END);
+	if (!clk_data)
+		panic("ath79: can't allocate the clock data");
+	clk_data->num = ATH79_CLK_END;
+
 	/*
 	 * The board's crystal. Without a rate in the device tree, the arch
 	 * code registers it from the bootstrap pins.
@@ -512,7 +516,7 @@ static void __init ath79_clocks_init_dt(struct device_node *np)
 	if (IS_ERR(ref_clk))
 		ref_clk = clk_get_sys(NULL, "ref");
 	if (!IS_ERR(ref_clk))
-		clks[ATH79_CLK_REF] = ref_clk;
+		clk_data->hws[ATH79_CLK_REF] = __clk_get_hw(ref_clk);
 
 	pll_base = of_iomap(np, 0);
 	if (!pll_base) {
@@ -536,10 +540,10 @@ static void __init ath79_clocks_init_dt(struct device_node *np)
 	else if (of_device_is_compatible(np, "qca,qca9560-pll"))
 		qca956x_clocks_init(pll_base);
 
-	if (!clks[ATH79_CLK_MDIO])
-		clks[ATH79_CLK_MDIO] = clks[ATH79_CLK_REF];
+	if (!clk_data->hws[ATH79_CLK_MDIO])
+		clk_data->hws[ATH79_CLK_MDIO] = clk_data->hws[ATH79_CLK_REF];
 
-	if (of_clk_add_provider(np, of_clk_src_onecell_get, &clk_data)) {
+	if (of_clk_add_hw_provider(np, of_clk_hw_onecell_get, clk_data)) {
 		pr_err("%pOF: could not register clk provider\n", np);
 		goto err_iounmap;
 	}
-- 
2.56.0

