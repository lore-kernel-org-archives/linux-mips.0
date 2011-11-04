Received: from smtp4-g21.free.fr ([212.27.42.4]:52239 "EHLO smtp4-g21.free.fr"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S1904138Ab1KDSMJ (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Fri, 4 Nov 2011 19:12:09 +0100
From: Maxime Bizon <mbizon@freebox.fr>
Subject: [PATCH v2 03/11] MIPS: BCM63XX: call board_register_device from device_initcall()
Date: Fri,  4 Nov 2011 19:09:27 +0100
Message-ID: <1320430175-13725-4-git-send-email-mbizon@freebox.fr>
In-Reply-To: <1320430175-13725-1-git-send-email-mbizon@freebox.fr>
References: <1320430175-13725-1-git-send-email-mbizon@freebox.fr>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
Return-Path: <linux-mips-bounce@linux-mips.org>
To: ralf@linux-mips.orgralf@linux-mips.org
Cc: Maxime Bizon <mbizon@freebox.fr>, linux-mips@linux-mips.org
Message-ID: <20111104180927.jsY5OroxsGjpi6QPOe03gBHm0VFr6kutJvhkP71Q5CA@z>

Some device registration (eg leds), expect subsystem initcall to be
run first, so move board device registration to device_initcall().

Signed-off-by: Maxime Bizon <mbizon@freebox.fr>
---
 arch/mips/bcm63xx/setup.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/mips/bcm63xx/setup.c b/arch/mips/bcm63xx/setup.c
index d005659..04a3499 100644
--- a/arch/mips/bcm63xx/setup.c
+++ b/arch/mips/bcm63xx/setup.c
@@ -124,4 +124,4 @@ int __init bcm63xx_register_devices(void)
 	return board_register_devices();
 }
 
-arch_initcall(bcm63xx_register_devices);
+device_initcall(bcm63xx_register_devices);
-- 
1.7.1.1
