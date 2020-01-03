Return-Path: <SRS0=beLb=2Y=vger.kernel.org=linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FB58C2D0C2
	for <linux-mips@archiver.kernel.org>; Fri,  3 Jan 2020 16:06:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3B3A3222C3
	for <linux-mips@archiver.kernel.org>; Fri,  3 Jan 2020 16:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1578067581;
	bh=fHfbAQ8SGC8zqHEfbhXnwU8/chBxqeLTaOuQf7U49uY=;
	h=From:Date:Subject:To:Cc:Reply-to:List-ID:From;
	b=vMIjZkgMr1Q79tFgySpMrHS2ebhJNa6VvdzYcXX+kswfxj5mSXlLZOa0Vutp4eUZi
	 Cqmkk7k6b4lkGO2LU/chgb6BaUe9JIQ7I5dZUDhhgP/h1LHTxt9ZZwCoV5bYNacEk4
	 P8MLduyxJ4BP01RGHj67KgnfTRtSlg0xTcKxt7PM=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727742AbgACQGU (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Fri, 3 Jan 2020 11:06:20 -0500
Received: from www.linuxtv.org ([130.149.80.248]:56118 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727539AbgACQGU (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 3 Jan 2020 11:06:20 -0500
X-Greylist: delayed 2124 seconds by postgrey-1.27 at vger.kernel.org; Fri, 03 Jan 2020 11:06:20 EST
Received: from mchehab by www.linuxtv.org with local (Exim 4.92)
        (envelope-from <mchehab@linuxtv.org>)
        id 1inOtr-00AOvB-Dl; Fri, 03 Jan 2020 15:30:07 +0000
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Date:   Fri, 03 Jan 2020 15:28:04 +0000
Subject: [git:media_tree/master] media: MAINTAINERS: Orphan img-ir driver
To:     linuxtv-commits@linuxtv.org
Cc:     James Hartley <james.hartley@sondrel.com>,
        Sean Young <sean@mess.org>, James Hogan <jhogan@kernel.org>,
        Paul Burton <paulburton@kernel.org>, linux-mips@vger.kernel.org
Mail-followup-to: linux-media@vger.kernel.org
Forward-to: linux-media@vger.kernel.org
Reply-to: linux-media@vger.kernel.org
Message-Id: <E1inOtr-00AOvB-Dl@www.linuxtv.org>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

This is an automatic generated email to let you know that the following patch were queued:

Subject: media: MAINTAINERS: Orphan img-ir driver
Author:  James Hogan <jhogan@kernel.org>
Date:    Thu Dec 19 15:52:57 2019 +0100

I haven't been active for 18 months, and don't have the hardware set up
to test the img-ir driver, so mark it as orphaned and remove myself as
maintainer.

I used to test this driver using a Minimorph board with Meta based
TZ1090 SoC, but the Meta arch port is long gone from the kernel. The
only remaining platform in-tree using this driver is the Imagination
Pistachio SoC, and the only Pistachio based board with DTS in-tree (MIPS
Creator Ci40) doesn't bring the IR out.

However I presume the IP persists under the guardianship of Sondrel, and
its possible current & future SoCs/boards may continue to use this IP.

Signed-off-by: James Hogan <jhogan@kernel.org>
Cc: James Hartley <james.hartley@sondrel.com>
Cc: Paul Burton <paulburton@kernel.org>
Cc: linux-mips@vger.kernel.org
Signed-off-by: Sean Young <sean@mess.org>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

 MAINTAINERS | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

---

diff --git a/MAINTAINERS b/MAINTAINERS
index 87f3d89d44a2..0dd2431bf239 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8099,8 +8099,7 @@ F:	Documentation/devicetree/bindings/auxdisplay/img-ascii-lcd.txt
 F:	drivers/auxdisplay/img-ascii-lcd.c
 
 IMGTEC IR DECODER DRIVER
-M:	James Hogan <jhogan@kernel.org>
-S:	Maintained
+S:	Orphan
 F:	drivers/media/rc/img-ir/
 
 IMON SOUNDGRAPH USB IR RECEIVER
