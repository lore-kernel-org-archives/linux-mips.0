Received: from 19pmail.ess.barracuda.com ([64.235.154.231]:40466 "EHLO
        19pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23990502AbdKHKV2Adz1- (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 8 Nov 2017 11:21:28 +0100
From: James Hogan <james.hogan@mips.com>
Subject: [PATCH] MIPS: ralink: Drop obsolete USB_ARCH_HAS_HCD select
Date: Wed, 8 Nov 2017 10:20:59 +0000
Message-ID: <20171108102059.21813-1-james.hogan@mips.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <James.Hogan@mips.com>
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
Cc: James Hogan <jhogan@kernel.org>, Ralf Baechle <ralf@linux-mips.org>, John Crispin <john@phrozen.org>
Message-ID: <20171108102059.77Z6JTWh6j7VTqTJ9OSnfiD9UCb3avbOxf-2jh7IfGo@z>

From: James Hogan <jhogan@kernel.org>

Building an allnoconfig kernel based on the ralink platform results in
the following warning:

warning: (SOC_RT305X) selects USB_ARCH_HAS_HCD which has unmet direct dependencies (USB_SUPPORT)

This is because SOC_RT305X unconditionally selects USB_ARCH_HAS_HCD
which depends on USB_SUPPORT.

However USB_ARCH_HAS_HCD has been effectively obsolete since commit
d9ea21a77927 ("usb: host: make USB_ARCH_HAS_?HCI obsolete") in 3.11.
USB_ARCH_HAS_HCD is now set by default whenever USB_SUPPORT is, so drop
the select to silence the warning.

Signed-off-by: James Hogan <jhogan@kernel.org>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: John Crispin <john@phrozen.org>
Cc: linux-mips@linux-mips.org
---
 arch/mips/ralink/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/mips/ralink/Kconfig b/arch/mips/ralink/Kconfig
index f26736b7080b..1f9cb0e3c79a 100644
--- a/arch/mips/ralink/Kconfig
+++ b/arch/mips/ralink/Kconfig
@@ -31,7 +31,6 @@ choice
 
 	config SOC_RT305X
 		bool "RT305x"
-		select USB_ARCH_HAS_HCD
 
 	config SOC_RT3883
 		bool "RT3883"
-- 
2.14.1
