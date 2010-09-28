Received: from eu1sys200aog118.obsmtp.com ([207.126.144.145]:53337 "EHLO
        eu1sys200aog118.obsmtp.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S1491949Ab0I1KgH (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 28 Sep 2010 12:36:07 +0200
From: Arun Murthy <arun.murthy@stericsson.com>
Subject: [PATCH 2/7] backlight:pwm: add an element 'name' to platform data
Date: Tue, 28 Sep 2010 16:05:29 +0530
Message-ID: <1285670134-18063-3-git-send-email-arun.murthy@stericsson.com>
In-Reply-To: <1285670134-18063-1-git-send-email-arun.murthy@stericsson.com>
References: <1285670134-18063-1-git-send-email-arun.murthy@stericsson.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
Return-Path: <linux-mips-bounce@linux-mips.org>
To: lars@metafoo.de, akpm@linux-foundation.org, kernel@pengutronix.de, philipp.zabel@gmail.com, robert.jarzmik@free.fr, marek.vasut@gmail.com, eric.y.miao@gmail.com, rpurdie@rpsys.net, sameo@linux.intel.com, kgene.kim@samsung.com, linux-omap@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mips@linux-mips.org, arun.murthy@stericsson.com, STEricsson_nomadik_linux@list.st.com
Message-ID: <20100928103529.y2Vyhue5x8A2DGaTqe__hW3yugAG2yOZO8Wzmi6HcpI@z>

A new element 'name' is added to pwm backlight platform data structure.
This is required to identify the pwm device.

Signed-off-by: Arun Murthy <arun.murthy@stericsson.com>
Acked-by: Linus Walleij <linus.walleij@stericsson.com>
---
 drivers/video/backlight/pwm_bl.c |    4 +++-
 include/linux/pwm_backlight.h    |    1 +
 2 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/drivers/video/backlight/pwm_bl.c b/drivers/video/backlight/pwm_bl.c
index 5504435..b0978a8 100644
--- a/drivers/video/backlight/pwm_bl.c
+++ b/drivers/video/backlight/pwm_bl.c
@@ -94,7 +94,9 @@ static int pwm_backlight_probe(struct platform_device *pdev)
 	pb->notify = data->notify;
 	pb->dev = &pdev->dev;
 
-	pb->pwm = pwm_request(data->pwm_id, "backlight");
+	if (!data->name)
+		data->name = "backlight";
+	pb->pwm = pwm_request(data->pwm_id, data->name);
 	if (IS_ERR(pb->pwm)) {
 		dev_err(&pdev->dev, "unable to request PWM for backlight\n");
 		ret = PTR_ERR(pb->pwm);
diff --git a/include/linux/pwm_backlight.h b/include/linux/pwm_backlight.h
index 01b3d75..c2ce8f8 100644
--- a/include/linux/pwm_backlight.h
+++ b/include/linux/pwm_backlight.h
@@ -6,6 +6,7 @@
 
 struct platform_pwm_backlight_data {
 	int pwm_id;
+	char *name;
 	unsigned int max_brightness;
 	unsigned int dft_brightness;
 	unsigned int pwm_period_ns;
-- 
1.7.2.dirty
