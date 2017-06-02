Received: from mailapp01.imgtec.com ([195.59.15.196]:35413 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23993940AbdFBVubZ7L3F (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 2 Jun 2017 23:50:31 +0200
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 4/7] MIPS: CPS: Select CONFIG_SYS_SUPPORTS_SCHED_SMT for MIPSr6
Date: Fri, 2 Jun 2017 14:48:52 -0700
Message-ID: <20170602214856.4545-5-paul.burton@imgtec.com>
In-Reply-To: <20170602214856.4545-1-paul.burton@imgtec.com>
References: <20170602214856.4545-1-paul.burton@imgtec.com>
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
Cc: Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@imgtec.com>
Message-ID: <20170602214852.gjooJ0WLJqt7l7fjSNr4E79uy2tUG-aUfc2mSy9gkss@z>

Prior to MIPSr6 multithreading is only supported if CONFIG_MIPS_MT_SMP
is enabled, so CONFIG_MIPS_MT_SMP selects CONFIG_SYS_SUPPORTS_SCHED_SMT.
With MIPSr6 the CONFIG_MIPS_CPS SMP implementation always supports
multithreading, so have it select CONFIG_SYS_SUPPORTS_SCHED_SMT in order
to allow the scheduler to make better informed decisions on
multithreaded MIPSr6 systems (for example those using I6400 or I6500
CPUs).

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
---

 arch/mips/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 2828ecde133d..a0d439cb0766 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -2369,6 +2369,7 @@ config MIPS_CPS
 	select SMP
 	select SYNC_R4K if (CEVT_R4K || CSRC_R4K)
 	select SYS_SUPPORTS_HOTPLUG_CPU
+	select SYS_SUPPORTS_SCHED_SMT if CPU_MIPSR6
 	select SYS_SUPPORTS_SMP
 	select WEAK_ORDERING
 	help
-- 
2.13.0
