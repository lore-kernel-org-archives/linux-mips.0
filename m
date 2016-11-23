Received: from mailapp01.imgtec.com ([195.59.15.196]:23856 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23993058AbcKWNoKGrBjG (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 23 Nov 2016 14:44:10 +0100
From: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
Subject: [PATCH 08/10] MIPS: kexec: do not reserve invalid crashkernel memory on boot
Date: Wed, 23 Nov 2016 14:43:50 +0100
Message-ID: <1479908632-30392-9-git-send-email-marcin.nowakowski@imgtec.com>
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
Message-ID: <20161123134350.rLALyW0f8nrcngNet4E00a-B5khfofY5F8lUD5PJXIo@z>

Do not reserve memory for the crashkernel if the commandline argument
points to a wrong location. This can happen if the location is specified
wrong or if the same commandline is reused when starting the crashkernel
- in the latter case the reserved memory would point to the location
from which the crashkernel is executing.

Signed-off-by: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
---
 arch/mips/kernel/setup.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
index ae88866..01d1dbd 100644
--- a/arch/mips/kernel/setup.c
+++ b/arch/mips/kernel/setup.c
@@ -741,6 +741,11 @@ static void __init mips_parse_crashkernel(void)
 	if (ret != 0 || crash_size <= 0)
 		return;
 
+	if (!memory_region_available(crash_base, crash_size)) {
+		pr_warn("Invalid memory region reserved for crash kernel\n");
+		return;
+	}
+
 	crashk_res.start = crash_base;
 	crashk_res.end	 = crash_base + crash_size - 1;
 }
-- 
2.7.4
