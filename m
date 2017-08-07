Received: from mailapp01.imgtec.com ([195.59.15.196]:18889 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23994865AbdHGXDcQ92TI (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 8 Aug 2017 01:03:32 +0200
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 6/7] MIPS: generic: Don't explicitly disable CONFIG_USB_SUPPORT
Date: Mon, 7 Aug 2017 16:01:17 -0700
Message-ID: <20170807230119.10629-7-paul.burton@imgtec.com>
In-Reply-To: <20170807230119.10629-1-paul.burton@imgtec.com>
References: <20170807230119.10629-1-paul.burton@imgtec.com>
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
Cc: Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@imgtec.com>
Message-ID: <20170807230117.JGQy8l5RRmExImqsbW5IH4WjFIa4D4CsQ9wI_unrRmg@z>

Leave CONFIG_USB_SUPPORT at its default, allowing board config fragments
to make use of USB drivers without needing to override it & trigger
warnings from merge_config.sh.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
---

 arch/mips/configs/generic_defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/mips/configs/generic_defconfig b/arch/mips/configs/generic_defconfig
index 91aacf2ef26d..a638028b1425 100644
--- a/arch/mips/configs/generic_defconfig
+++ b/arch/mips/configs/generic_defconfig
@@ -61,7 +61,6 @@ CONFIG_HID_KENSINGTON=y
 CONFIG_HID_LOGITECH=y
 CONFIG_HID_MICROSOFT=y
 CONFIG_HID_MONTEREY=y
-# CONFIG_USB_SUPPORT is not set
 # CONFIG_MIPS_PLATFORM_DEVICES is not set
 # CONFIG_IOMMU_SUPPORT is not set
 CONFIG_EXT4_FS=y
-- 
2.14.0
