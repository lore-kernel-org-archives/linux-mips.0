Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F686352F86;
	Tue, 15 Sep 2026 05:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789451186; cv=none; b=nfSdHyuPjiuceHkvUc7aM602YJK2zad19VWt2jS8r3toFKddLw4OosSU0m7juNqMAuGh0gSAZ9mKG4KZuCJSj7xfI9kkBeER1Z1dHU+79uW1HH/x9W1oJ1E9fTrwHm2HtvqeZ6KKxl0/WZHwVR47zfwLTOfJpNOPMkoMIF4FcPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789451186; c=relaxed/simple;
	bh=/bcZf+K0knvclkuvHQw86JM91mB2J3WS6OpY+fCig9A=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=YOlFvxixaGwCXJqgRs/9v/IsqBTu6DL1QE8J7dOOo+ydGRv2TJQFMgOjzPVhJ44oXwJ4PrkPvgvGlTdTjpEj5USHON+m4mCa9XbcTfT9BUt041WdfY5/TuRS0WGUzzlHNBuA/kYUizax6BschBi/CuNRyBQkherycgC8DSDi9X4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from dfae2b116770.home.arpa (unknown [36.110.52.2])
	by APP-01 (Coremail) with SMTP id qwCowAA3Cu6t26hquRIKCA--.51777S2;
	Tue, 15 Sep 2026 13:46:21 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: cjd@cjdns.fr
Cc: daniel.lezcano@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	tglx@kernel.org,
	Wentao Liang <vulab@iscas.ac.cn>
Subject: [PATCH] clocksource/drivers/timer-econet-en751221: Fix clock reference leak
Date: Tue, 15 Sep 2026 05:45:52 +0000
Message-Id: <20260915054552.1729612-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qwCowAA3Cu6t26hquRIKCA--.51777S2
X-Coremail-Antispam: 1UD129KBjvdXoWruF45Gr47Ar43Jw18Gr1DAwb_yoWkKFc_Wa
	nIgr97Jr1Fk390kw4qvw13Z39IkFn7Zry8KrWIqa4fJa48CFyjkF1rurnIkr15uanrKF98
	CFW7C3yrAr13WjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb4AFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_
	Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r126r1DMcIj6I8E87Iv67AKxVW8Jr0_Cr1UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7CjxVAaw2AFwI0_
	JF0_Jw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67
	AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIY
	rxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14
	v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWx
	JwCI42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvfC2KfnxnUUI43ZEXa7VUbYFAJ
	UUUUU==
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiBgkLA2qowR1bvwABs8

timer_init() obtains the timer clock with of_clk_get() and only reads
its frequency with clk_get_rate(); the clock is never prepared nor
enabled. All four return paths after the acquisition (of_iomap()
failure, clocksource_mmio_init() failure, cevt_init() failure and
success) return without clk_put(), leaking the consumer reference.

Drop the reference with clk_put() right after the frequency has been
read. The clock enable state is untouched.

Fixes: 3b4c33ac87d0 ("clocksource/drivers: Add EcoNet Timer HPT driver")
Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
 drivers/clocksource/timer-econet-en751221.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clocksource/timer-econet-en751221.c b/drivers/clocksource/timer-econet-en751221.c
index 4008076b1a21..1859335345b5 100644
--- a/drivers/clocksource/timer-econet-en751221.c
+++ b/drivers/clocksource/timer-econet-en751221.c
@@ -181,6 +181,7 @@ static int __init timer_init(struct device_node *np)
 	}
 
 	econet_timer.freq_hz = clk_get_rate(clk);
+	clk_put(clk);
 
 	for (int i = 0; i < num_blocks; i++) {
 		econet_timer.membase[i] = of_iomap(np, i);
-- 
2.34.1

