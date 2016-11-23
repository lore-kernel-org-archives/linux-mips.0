Received: from mailapp01.imgtec.com ([195.59.15.196]:56619 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23990864AbcKWNoDgiMEG (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 23 Nov 2016 14:44:03 +0100
From: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
Subject: [PATCH 01/10] MIPS: do not request resources for crashkernel if one isn't defined
Date: Wed, 23 Nov 2016 14:43:43 +0100
Message-ID: <1479908632-30392-2-git-send-email-marcin.nowakowski@imgtec.com>
In-Reply-To: <1479908632-30392-1-git-send-email-marcin.nowakowski@imgtec.com>
References: <1479908632-30392-1-git-send-email-marcin.nowakowski@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Marcin.Nowakowski@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org
Message-ID: <20161123134343.BDiv0zdWDLrCLokCA--fTrmCjZxtuWvwxFFiyv_X9bs@z>

When KEXEC is enabled but crashkernel details are not passed through the
kernel commandline unnecessary resources are requested (start==end==0)

Signed-off-by: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
---
 arch/mips/kernel/setup.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
index f66e5ce..0058fea 100644
--- a/arch/mips/kernel/setup.c
+++ b/arch/mips/kernel/setup.c
@@ -672,6 +672,9 @@ static void __init request_crashkernel(struct resource *res)
 {
 	int ret;
 
+	if (crashk_res.start == crashk_res.end)
+		return;
+
 	ret = request_resource(res, &crashk_res);
 	if (!ret)
 		pr_info("Reserving %ldMB of memory at %ldMB for crashkernel\n",
-- 
2.7.4
