Received: from youngberry.canonical.com ([91.189.89.112]:36167 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S6817128Ab3AGUjHvO1QA (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 7 Jan 2013 21:39:07 +0100
From: Herton Ronaldo Krzesinski <herton.krzesinski@canonical.com>
Subject: [ 3.5.y.z extended stable ] Patch "MIPS: Fix poweroff failure when HOTPLUG_CPU configured." has been added to staging queue
Date: Mon,  7 Jan 2013 18:38:56 -0200
Message-ID: <1357591136-22589-1-git-send-email-herton.krzesinski@canonical.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
Return-Path: <linux-mips-bounce@linux-mips.org>
To: Huacai Chen <chenhc@lemote.com>
Cc: Hongliang Tao <taohl@lemote.com>, Hua Yan <yanh@lemote.com>, Yong Zhang <yong.zhang@windriver.com>, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org, Fuxin Zhang <zhangfx@lemote.com>, Zhangjin Wu <wuzhangjin@gmail.com>, Ralf Baechle <ralf@linux-mips.org>, Herton Ronaldo Krzesinski <herton.krzesinski@canonical.com>, kernel-team@lists.ubuntu.com
Message-ID: <20130107203856.WDbluMYb_-Zm2WKneoKQRRLpOwbnTA1AdizRyINvGpE@z>

This is a note to let you know that I have just added a patch titled

    MIPS: Fix poweroff failure when HOTPLUG_CPU configured.

to the linux-3.5.y-queue branch of the 3.5.y.z extended stable tree 
which can be found at:

 http://kernel.ubuntu.com/git?p=ubuntu/linux.git;a=shortlog;h=refs/heads/linux-3.5.y-queue

If you, or anyone else, feels it should not be added to this tree, please 
reply to this email.

For more information about the 3.5.y.z tree, see
https://wiki.ubuntu.com/Kernel/Dev/ExtendedStable

Thanks.
-Herton

------

From 81d3bedcd96bc0c48c5e8dec5193719bbce7511f Mon Sep 17 00:00:00 2001
From: Huacai Chen <chenhc@lemote.com>
Date: Mon, 13 Aug 2012 20:52:24 +0800
Subject: [PATCH] MIPS: Fix poweroff failure when HOTPLUG_CPU configured.

commit 8add1ecb81f541ef2fcb0b85a5470ad9ecfb4a84 upstream.

When poweroff machine, kernel_power_off() call disable_nonboot_cpus().
And if we have HOTPLUG_CPU configured, disable_nonboot_cpus() is not an
empty function but attempt to actually disable the nonboot cpus. Since
system state is SYSTEM_POWER_OFF, play_dead() won't be called and thus
disable_nonboot_cpus() hangs. Therefore, we make this patch to avoid
poweroff failure.

Signed-off-by: Huacai Chen <chenhc@lemote.com>
Signed-off-by: Hongliang Tao <taohl@lemote.com>
Signed-off-by: Hua Yan <yanh@lemote.com>
Cc: Yong Zhang <yong.zhang@windriver.com>
Cc: linux-mips@linux-mips.org
Cc: linux-kernel@vger.kernel.org
Cc: Fuxin Zhang <zhangfx@lemote.com>
Cc: Zhangjin Wu <wuzhangjin@gmail.com>
Patchwork: https://patchwork.linux-mips.org/patch/4211/
Signed-off-by: Ralf Baechle <ralf@linux-mips.org>
Signed-off-by: Herton Ronaldo Krzesinski <herton.krzesinski@canonical.com>
---
 arch/mips/kernel/process.c |    4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/mips/kernel/process.c b/arch/mips/kernel/process.c
index e9a5fd7..69b17a9 100644
--- a/arch/mips/kernel/process.c
+++ b/arch/mips/kernel/process.c
@@ -72,9 +72,7 @@ void __noreturn cpu_idle(void)
 			}
 		}
 #ifdef CONFIG_HOTPLUG_CPU
-		if (!cpu_online(cpu) && !cpu_isset(cpu, cpu_callin_map) &&
-		    (system_state == SYSTEM_RUNNING ||
-		     system_state == SYSTEM_BOOTING))
+		if (!cpu_online(cpu) && !cpu_isset(cpu, cpu_callin_map))
 			play_dead();
 #endif
 		rcu_idle_exit();
--
1.7.9.5
