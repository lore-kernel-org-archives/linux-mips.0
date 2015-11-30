Received: from mailapp01.imgtec.com ([195.59.15.196]:7391 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27006842AbbK3QZpFzm8e (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 30 Nov 2015 17:25:45 +0100
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 14/28] i2c: eg20t: allow build on MIPS platforms
Date: Mon, 30 Nov 2015 16:21:39 +0000
Message-ID: <1448900513-20856-15-git-send-email-paul.burton@imgtec.com>
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
Cc: Paul Burton <paul.burton@imgtec.com>, linux-kernel@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org
Message-ID: <20151130162139.-UdUCVJCwS3zOrM99jwSEezUjVDgHTRA5IXGtjReI5I@z>

Allow the eg20t I2C driver to be built for MIPS platforms, in
preparation for use on the MIPS Boston board.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
---

 drivers/i2c/busses/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index 7b0aa82..69c46fe 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -516,7 +516,7 @@ config I2C_EFM32
 
 config I2C_EG20T
 	tristate "Intel EG20T PCH/LAPIS Semicon IOH(ML7213/ML7223/ML7831) I2C"
-	depends on PCI && (X86_32 || COMPILE_TEST)
+	depends on PCI && (X86_32 || MIPS || COMPILE_TEST)
 	help
 	  This driver is for PCH(Platform controller Hub) I2C of EG20T which
 	  is an IOH(Input/Output Hub) for x86 embedded processor.
-- 
2.6.2
