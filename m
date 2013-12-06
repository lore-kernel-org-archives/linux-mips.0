Received: from multi.imgtec.com ([194.200.65.239]:31728 "EHLO multi.imgtec.com"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S6827305Ab3LFLBfMqHE- (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Fri, 6 Dec 2013 12:01:35 +0100
From: Qais Yousef <qais.yousef@imgtec.com>
Subject: [PATCH 3/4] sead3: populate platform devices from device tree
Date: Fri, 6 Dec 2013 11:00:44 +0000
Message-ID: <1386327645-17571-4-git-send-email-qais.yousef@imgtec.com>
In-Reply-To: <1386327645-17571-1-git-send-email-qais.yousef@imgtec.com>
References: <1386327645-17571-1-git-send-email-qais.yousef@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Qais.Yousef@imgtec.com>
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
Cc: Qais Yousef <qais.yousef@imgtec.com>
Message-ID: <20131206110044.Ku4Jcj5mGwZ-yMS_OergXTfW6c6mdH6Sb_DmfnHGYWY@z>

Signed-off-by: Qais Yousef <qais.yousef@imgtec.com>
Reviewed-by: Paul Burton <paul.burton@imgtec.com>
Reviewed-by: James Hogan <james.hogan@imgtec.com>
---
 arch/mips/mti-sead3/sead3-setup.c |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/arch/mips/mti-sead3/sead3-setup.c b/arch/mips/mti-sead3/sead3-setup.c
index a499f99..541a907 100644
--- a/arch/mips/mti-sead3/sead3-setup.c
+++ b/arch/mips/mti-sead3/sead3-setup.c
@@ -111,3 +111,10 @@ void __init device_tree_init(void)
 
 	unflatten_device_tree();
 }
+
+static int __init customize_machine(void)
+{
+	of_platform_populate(NULL, of_default_bus_match_table, NULL, NULL);
+	return 0;
+}
+arch_initcall(customize_machine);
-- 
1.7.1
