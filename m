Return-Path: <linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DE98C38A2D
	for <linux-mips@archiver.kernel.org>; Wed, 26 Oct 2022 18:28:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233924AbiJZS2A (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Wed, 26 Oct 2022 14:28:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234335AbiJZS1v (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 26 Oct 2022 14:27:51 -0400
Received: from aposti.net (aposti.net [89.234.176.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C770DB779;
        Wed, 26 Oct 2022 11:27:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1666808828; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=D/tu4R6tTOfqPHTITxgF7oS2x2ZML7cFSBZWDH4aRtU=;
        b=31eP/QfQ5RXiiZ5pR03EGjE5b22ebUCyFn7aTCKXApwd+0OhAujy7UygmPBLqK9d3ablbj
        jJXlHwsb4J220LjB6W9AV4/UlFJERSlsNfWWzofHJUtMK2H2eXeFLrSjVv1OqPo2+EzFFK
        kIDDE3LHtl04IK0keA0u+zNwjiEMHOQ=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Bin Liu <b-liu@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-mips@vger.kernel.org, od@opendingux.net,
        Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH v2 5/7] usb: musb: jz4740: Don't disable external hubs
Date:   Wed, 26 Oct 2022 19:26:55 +0100
Message-Id: <20221026182657.146630-6-paul@crapouillou.net>
In-Reply-To: <20221026182657.146630-1-paul@crapouillou.net>
References: <20221026182657.146630-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The jz4740-musb driver does not really support OTG, so it has no reason
to disable external hubs, especially since it's a system-wide setting
and we don't want external hubs to be disabled for other USB host
controllers.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/usb/musb/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/usb/musb/Kconfig b/drivers/usb/musb/Kconfig
index 6c8f7763e75e..f9d067df82a1 100644
--- a/drivers/usb/musb/Kconfig
+++ b/drivers/usb/musb/Kconfig
@@ -113,7 +113,6 @@ config USB_MUSB_JZ4740
 	depends on OF
 	depends on MIPS || COMPILE_TEST
 	depends on USB_MUSB_GADGET
-	depends on USB=n || USB_OTG_DISABLE_EXTERNAL_HUB
 	select USB_ROLE_SWITCH
 
 config USB_MUSB_MEDIATEK
-- 
2.35.1

