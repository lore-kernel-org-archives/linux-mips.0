Received: from multi.imgtec.com ([194.200.65.239]:10902 "EHLO multi.imgtec.com"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S6823012Ab3IKMSKemOft (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Wed, 11 Sep 2013 14:18:10 +0200
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH] MIPS: kernel: vpe: Make vpe_attrs an array of pointers.
Date: Wed, 11 Sep 2013 13:17:52 +0100
Message-ID: <1378901872-20683-1-git-send-email-markos.chandras@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Markos.Chandras@imgtec.com>
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
Cc: Markos Chandras <markos.chandras@imgtec.com>, Ralf Baechle <ralf@linux-mips.org>, John Crispin <blogic@openwrt.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Message-ID: <20130911121752.oJVoBDS1joRSPd3P9-Ukpr6H6nXGaGHyXqMavpPhWlU@z>

Commit 567b21e973ccf5b0d13776e408d7c67099749eb8
"mips: convert vpe_class to use dev_groups"

broke the build on MIPS since vpe_attrs should be an array
of 'struct device_attribute' pointers.

Fixes the following build problem:
arch/mips/kernel/vpe.c:1372:2: error: missing braces around initializer
[-Werror=missing-braces]
arch/mips/kernel/vpe.c:1372:2: error: (near initialization for 'vpe_attrs[0]')
[-Werror=missing-braces]

Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: John Crispin <blogic@openwrt.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 arch/mips/kernel/vpe.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/kernel/vpe.c b/arch/mips/kernel/vpe.c
index faf84c5..59b2b3c 100644
--- a/arch/mips/kernel/vpe.c
+++ b/arch/mips/kernel/vpe.c
@@ -1368,7 +1368,7 @@ out_einval:
 }
 static DEVICE_ATTR_RW(ntcs);
 
-static struct attribute vpe_attrs[] = {
+static struct attribute *vpe_attrs[] = {
 	&dev_attr_kill.attr,
 	&dev_attr_ntcs.attr,
 	NULL,
-- 
1.8.3.2
