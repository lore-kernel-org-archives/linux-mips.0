Received: from mailapp01.imgtec.com ([195.59.15.196]:61204 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27007943AbbK3QZaY0Cne (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 30 Nov 2015 17:25:30 +0100
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 13/28] gpio: pch: allow use from device tree
Date: Mon, 30 Nov 2015 16:21:38 +0000
Message-ID: <1448900513-20856-14-git-send-email-paul.burton@imgtec.com>
In-Reply-To: <1448900513-20856-1-git-send-email-paul.burton@imgtec.com>
References: <1448900513-20856-1-git-send-email-paul.burton@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Paul.Burton@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: linux-mips@linux-mips.org
Cc: Paul Burton <paul.burton@imgtec.com>, linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-kernel@vger.kernel.org
Message-ID: <20151130162138.-HPvEz-LZgZFWLwEKDo9tijn0tBQGxXa662-FlNOVtc@z>

Allow GPIOs from the gpio-pch driver to be referenced from device tree
by simply setting the struct gpio_chip of_node pointer to that of the
struct pci_dev.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
---

 drivers/gpio/gpio-pch.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-pch.c b/drivers/gpio/gpio-pch.c
index 34ed176..56c9be4 100644
--- a/drivers/gpio/gpio-pch.c
+++ b/drivers/gpio/gpio-pch.c
@@ -394,6 +394,7 @@ static int pch_gpio_probe(struct pci_dev *pdev,
 	pci_set_drvdata(pdev, chip);
 	spin_lock_init(&chip->spinlock);
 	pch_gpio_setup(chip);
+	chip->gpio.of_node = pdev->dev.of_node;
 	ret = gpiochip_add(&chip->gpio);
 	if (ret) {
 		dev_err(&pdev->dev, "PCH gpio: Failed to register GPIO\n");
-- 
2.6.2
