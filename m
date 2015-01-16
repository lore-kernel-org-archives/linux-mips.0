Received: from mailapp01.imgtec.com ([195.59.15.196]:46679 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27010072AbbAPKveVhvI5 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 16 Jan 2015 11:51:34 +0100
Received: from KLMAIL01.kl.imgtec.org (unknown [192.168.5.35])
        by Websense Email Security Gateway with ESMTPS id AD5A3F302D2A4
        for <linux-mips@linux-mips.org>; Fri, 16 Jan 2015 10:51:26 +0000 (GMT)
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH RFC v2 03/70] MIPS: Add MIPS generic QEMU probe support
Date: Fri, 16 Jan 2015 10:48:42 +0000
Message-ID: <1421405389-15512-4-git-send-email-markos.chandras@imgtec.com>
In-Reply-To: <1421405389-15512-1-git-send-email-markos.chandras@imgtec.com>
References: <1421405389-15512-1-git-send-email-markos.chandras@imgtec.com>
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
Cc: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>, Markos Chandras <markos.chandras@imgtec.com>
Message-ID: <20150116104842.PDPfHbDUaowRMEUrpfzOmTe9Q4x0TY2KumpWsXEtI2c@z>

From: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>

Add a case in cpu_probe_mips for the MIPS generic QEMU processor ID.

Signed-off-by: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>
Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 arch/mips/kernel/cpu-probe.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/mips/kernel/cpu-probe.c b/arch/mips/kernel/cpu-probe.c
index 5342674842f5..cc77fdaca0eb 100644
--- a/arch/mips/kernel/cpu-probe.c
+++ b/arch/mips/kernel/cpu-probe.c
@@ -896,6 +896,11 @@ static inline void cpu_probe_mips(struct cpuinfo_mips *c, unsigned int cpu)
 {
 	c->writecombine = _CACHE_UNCACHED_ACCELERATED;
 	switch (c->processor_id & PRID_IMP_MASK) {
+	case PRID_IMP_QEMU_GENERIC:
+		c->writecombine = _CACHE_UNCACHED;
+		c->cputype = CPU_QEMU_GENERIC;
+		__cpu_name[cpu] = "MIPS GENERIC QEMU";
+		break;
 	case PRID_IMP_4KC:
 		c->cputype = CPU_4KC;
 		c->writecombine = _CACHE_UNCACHED;
-- 
2.2.1
