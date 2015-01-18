Received: from mailapp01.imgtec.com ([195.59.15.196]:29642 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27010992AbbARW24GEae4 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Sun, 18 Jan 2015 23:28:56 +0100
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 01/36] devicetree/bindings: add Ingenic Semiconductor vendor prefix
Date: Sun, 18 Jan 2015 14:27:12 -0800
Message-ID: <1421620067-23933-2-git-send-email-paul.burton@imgtec.com>
In-Reply-To: <1421620067-23933-1-git-send-email-paul.burton@imgtec.com>
References: <1421620067-23933-1-git-send-email-paul.burton@imgtec.com>
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
Message-ID: <20150118222712.xoKiLf1JzXZsk2SJEyy2EwMn3lXeuQ8Hn2tfRQ7DpxA@z>

Simply use 'ingenic'.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
Cc: Lars-Peter Clausen <lars@metafoo.de>
Cc: devicetree@vger.kernel.org
---
 Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index b1df0ad..30f7f08 100644
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
2.2.1
