Received: from mailapp01.imgtec.com ([195.59.15.196]:46317 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27012469AbbBDPWdjMFLq (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 4 Feb 2015 16:22:33 +0100
From: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
Subject: [PATCH_V2 01/34] dt: Add Ingenic Semiconductor vendor prefix
Date: Wed, 4 Feb 2015 15:21:30 +0000
Message-ID: <1423063323-19419-2-git-send-email-Zubair.Kakakhel@imgtec.com>
In-Reply-To: <1423063323-19419-1-git-send-email-Zubair.Kakakhel@imgtec.com>
References: <1423063323-19419-1-git-send-email-Zubair.Kakakhel@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Zubair.Kakakhel@imgtec.com>
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
Cc: devicetree@vger.kernel.org, linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org, Zubair.Kakakhel@imgtec.com, gregkh@linuxfoundation.org, mturquette@linaro.org, sboyd@codeaurora.org, ralf@linux-mips.org, jslaby@suse.cz, tglx@linutronix.de, jason@lakedaemon.net, lars@metafoo.de, paul.burton@imgtec.com
Message-ID: <20150204152130.52KUpTO_uoNtKmMgq4kZC0kDXIXz4O_Y1pnJEMmey10@z>

From: Paul Burton <paul.burton@imgtec.com>

Simply use 'ingenic'.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
Cc: Lars-Peter Clausen <lars@metafoo.de>
Cc: devicetree@vger.kernel.org
---
 Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index d443279..d0ea910 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -78,6 +78,7 @@ ibm	International Business Machines (IBM)
 idt	Integrated Device Technologies, Inc.
 iom	Iomega Corporation
 img	Imagination Technologies Ltd.
+ingenic	Ingenic Semiconductor
 innolux	Innolux Corporation
 intel	Intel Corporation
 intercontrol	Inter Control Group
-- 
1.9.1
