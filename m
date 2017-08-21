Received: from mailapp01.imgtec.com ([195.59.15.196]:54311 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23990644AbdHUKzIHiLgD (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 21 Aug 2017 12:55:08 +0200
From: Harvey Hunt <harvey.hunt@imgtec.com>
Subject: [V2 2/4] dt-bindings: vendors: Add VoCore as a vendor
Date: Mon, 21 Aug 2017 11:54:45 +0100
Message-ID: <1503312887-34310-2-git-send-email-harvey.hunt@imgtec.com>
In-Reply-To: <1503312887-34310-1-git-send-email-harvey.hunt@imgtec.com>
References: <1503312887-34310-1-git-send-email-harvey.hunt@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Harvey.Hunt@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: robh+dt@kernel.org, mark.rutland@arm.com, ralf@linux-mips.org, john@phrozen.org
Cc: Harvey Hunt <harvey.hunt@imgtec.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-mips@linux-mips.org
Message-ID: <20170821105445.I-uzu1XPUAoD3H-nduk0c1sCAPvY98s3E3i7-hjk6jA@z>

VoCore are a manufacturer of devices such as the VoCore2.

Signed-off-by: Harvey Hunt <harvey.hunt@imgtec.com>
Acked-by: Rob Herring <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-mips@linux-mips.org
---
Changes in V2:
- None

 Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index daf465be..f6e3716 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -353,6 +353,7 @@ variscite	Variscite Ltd.
 via	VIA Technologies, Inc.
 virtio	Virtual I/O Device Specification, developed by the OASIS consortium
 vivante	Vivante Corporation
+vocore VoCore Studio
 voipac	Voipac Technologies s.r.o.
 wd	Western Digital Corp.
 wetek	WeTek Electronics, limited.
-- 
2.7.4
