Received: from eu1sys200aog109.obsmtp.com ([207.126.144.127]:60139 "EHLO
        eu1sys200aog109.obsmtp.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S1491083Ab0JFQAf (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 6 Oct 2010 18:00:35 +0200
From: Arun Murthy <arun.murthy@stericsson.com>
Subject: [PATCHv3 2/7] backlight:pwm: add an element 'name' to platform data
Date: Wed, 6 Oct 2010 21:29:13 +0530
Message-ID: <1286380758-14063-3-git-send-email-arun.murthy@stericsson.com>
In-Reply-To: <1286380758-14063-1-git-send-email-arun.murthy@stericsson.com>
References: <1286380758-14063-1-git-send-email-arun.murthy@stericsson.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <arun.murthy@stericsson.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: lars@metafoo.de, akpm@linux-foundation.org, kernel@pengutronix.de, philipp.zabel@gmail.com, robert.jarzmik@free.fr, marek.vasut@gmail.com, eric.y.miao@gmail.com, rpurdie@rpsys.net, sameo@linux.intel.com, kgene.kim@samsung.com, linux-omap@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mips@linux-mips.org, STEricsson_nomadik_linux@list.st.com, arun.murthy@stericsson.com, bgat@billgatliff.com, khilman@deeprootsystems.com
Message-ID: <20101006155913.ZC1noSnPCc6cx6N_mVAJud9f4SxSGAbK4LstMv9cyHs@z>

A new element 'name' is added to pwm backlight platform data structure.
This is required to identify the pwm device.

Signed-off-by: Arun Murthy <arun.murthy@stericsson.com>
Acked-by: Linus Walleij <linus.walleij@stericsson.com>
---
 drivers/video/backlight/pwm_bl.c |    4 +++-
 include/linux/pwm_backlight.h    |    1 +
 2 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/drivers/video/backlight/pwm_bl.c b/drivers/video/backlight/pwm_bl.c
index fa512a6..332cc50 100644
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
