Received: from mailapp01.imgtec.com ([195.89.28.115]:59262 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S6837164AbaDPNHLMHgVx (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 16 Apr 2014 15:07:11 +0200
Received: from KLMAIL01.kl.imgtec.org (unknown [192.168.5.35])
        by Websense Email Security Gateway with ESMTPS id 6EF0BCE5B4EAA
        for <linux-mips@linux-mips.org>; Wed, 16 Apr 2014 14:07:02 +0100 (IST)
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 39/39] MIPS: Malta: CPS SMP by default
Date: Wed, 16 Apr 2014 14:06:58 +0100
Message-ID: <1397653618-5033-1-git-send-email-paul.burton@imgtec.com>
In-Reply-To: <1397652810-4336-1-git-send-email-paul.burton@imgtec.com>
References: <1397652810-4336-1-git-send-email-paul.burton@imgtec.com>
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
Message-ID: <20140416130658.dsF7d0IBOuR4dE4S8ZUuoKExP2KvHD94xDYUQFa8pp4@z>

The CONFIG_MIPS_CPS SMP implementation should be able to handle all
cases the CONFIG_MIPS_CMP implementation does, but without requiring
bootloader assistance. It is also required in order to make use of
features such as hotplug & cpuidle core power gating. Enable it by
default for Malta configs that previously enabled the now deprecated
CONFIG_MIPS_CMP, and disable the latter. The local version suffix "cmp"
is removed rather than replaced with "cps" since there are other ways to
tell that the CPS SMP implementation is in use (the "VPE topology" line
in the boot log being one).

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
---
 arch/mips/configs/maltasmvp_defconfig     | 3 +--
 arch/mips/configs/maltasmvp_eva_defconfig | 3 +--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/mips/configs/maltasmvp_defconfig b/arch/mips/configs/maltasmvp_defconfig
index 10ef3be..f8a3231 100644
--- a/arch/mips/configs/maltasmvp_defconfig
+++ b/arch/mips/configs/maltasmvp_defconfig
@@ -4,10 +4,9 @@ CONFIG_CPU_MIPS32_R2=y
 CONFIG_PAGE_SIZE_16KB=y
 CONFIG_MIPS_MT_SMP=y
 CONFIG_SCHED_SMT=y
-CONFIG_MIPS_CMP=y
+CONFIG_MIPS_CPS=y
 CONFIG_NR_CPUS=8
 CONFIG_HZ_100=y
-CONFIG_LOCALVERSION="cmp"
 CONFIG_SYSVIPC=y
 CONFIG_POSIX_MQUEUE=y
 CONFIG_AUDIT=y
diff --git a/arch/mips/configs/maltasmvp_eva_defconfig b/arch/mips/configs/maltasmvp_eva_defconfig
index 2d3002c..c83338a 100644
--- a/arch/mips/configs/maltasmvp_eva_defconfig
+++ b/arch/mips/configs/maltasmvp_eva_defconfig
@@ -5,10 +5,9 @@ CONFIG_CPU_MIPS32_3_5_FEATURES=y
 CONFIG_PAGE_SIZE_16KB=y
 CONFIG_MIPS_MT_SMP=y
 CONFIG_SCHED_SMT=y
-CONFIG_MIPS_CMP=y
+CONFIG_MIPS_CPS=y
 CONFIG_NR_CPUS=8
 CONFIG_HZ_100=y
-CONFIG_LOCALVERSION="cmp"
 CONFIG_SYSVIPC=y
 CONFIG_POSIX_MQUEUE=y
 CONFIG_AUDIT=y
-- 
1.8.5.3
