Received: from mailapp01.imgtec.com ([195.59.15.196]:35714 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27012029AbbDUOsAxpEZ5 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 21 Apr 2015 16:48:00 +0200
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH v3 01/37] devicetree/bindings: add Ingenic Semiconductor vendor prefix
Date: Tue, 21 Apr 2015 15:46:28 +0100
Message-ID: <1429627624-30525-2-git-send-email-paul.burton@imgtec.com>
In-Reply-To: <1429627624-30525-1-git-send-email-paul.burton@imgtec.com>
References: <1429627624-30525-1-git-send-email-paul.burton@imgtec.com>
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
Cc: Paul Burton <paul.burton@imgtec.com>, Lars-Peter Clausen <lars@metafoo.de>, devicetree@vger.kernel.org
Message-ID: <20150421144628.WltsV199ReMnBAVY_UZNkjld_TAHHk5LX5rKaXyY-PU@z>

Define a vendor prefix for Ingenic Semiconductor, a vendor of MIPS-based
SoCs. Simply use 'ingenic'.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
Cc: Lars-Peter Clausen <lars@metafoo.de>
Cc: devicetree@vger.kernel.org
---
Changes in v3:
  - Rebase.

Changes in v2:
  - None.
---
 Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index c0e55db..721b14e 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -100,6 +100,7 @@ ibm	International Business Machines (IBM)
 idt	Integrated Device Technologies, Inc.
 iom	Iomega Corporation
 img	Imagination Technologies Ltd.
+ingenic	Ingenic Semiconductor
 innolux	Innolux Corporation
 intel	Intel Corporation
 intercontrol	Inter Control Group
-- 
2.3.5
