Received: from mailapp01.imgtec.com ([195.59.15.196]:41932 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S6861342AbaGILsoh3NrK (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 9 Jul 2014 13:48:44 +0200
Received: from KLMAIL01.kl.imgtec.org (unknown [192.168.5.35])
        by Websense Email Security Gateway with ESMTPS id 433B3734488F5
        for <linux-mips@linux-mips.org>; Wed,  9 Jul 2014 12:48:36 +0100 (IST)
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 2/5] MIPS: pm-cps: select CONFIG_MIPS_CPC
Date: Wed, 9 Jul 2014 12:48:19 +0100
Message-ID: <1404906502-10702-3-git-send-email-paul.burton@imgtec.com>
In-Reply-To: <1404906502-10702-1-git-send-email-paul.burton@imgtec.com>
References: <1404906502-10702-1-git-send-email-paul.burton@imgtec.com>
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
Cc: Paul Burton <paul.burton@imgtec.com>
Message-ID: <20140709114819.NzGkFKwtL0vh4-oGb99MydNeiIndCkX9wPGspVOWzpk@z>

The pm-cps code can run without a CPC, although will be limited to using
only the 2 wait idle states. However the code does check for CPC
presence, and in order to work optimally the CPC support is needed. So
select it.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
Reviewed-by: Markos Chandras <markos.chandras@imgtec.com>
---
 arch/mips/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 4e238e6..87001b9 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -2057,6 +2057,7 @@ config MIPS_CPS
 	  support is unavailable.
 
 config MIPS_CPS_PM
+	select MIPS_CPC
 	bool
 
 config MIPS_GIC_IPI
-- 
2.0.1
