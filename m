Received: from mailapp01.imgtec.com ([195.59.15.196]:41376 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23993973AbdFBTcvu94in (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 2 Jun 2017 21:32:51 +0200
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 8/9] MIPS: SEAD-3: Remove GIC timer from DT
Date: Fri, 2 Jun 2017 12:29:58 -0700
Message-ID: <20170602192959.25435-9-paul.burton@imgtec.com>
In-Reply-To: <20170602192959.25435-1-paul.burton@imgtec.com>
References: <20170602192959.25435-1-paul.burton@imgtec.com>
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
Message-ID: <20170602192958.Isku2ddf_mlFdB1OP-9TkRjpkKn4UnkzxglR9Rr3ZVs@z>

The SEAD-3 board doesn't & never has configured the GIC frequency.
Remove the timer node from the DT in order to avoid attempting to probe
the GIC clocksource/clockevent driver which will produce error messages
such as these during boot:

[    0.000000] GIC frequency not specified.
[    0.000000] Failed to initialize '/interrupt-controller@1b1c0000/timer': -22
[    0.000000] clocksource_probe: no matching clocksources found

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
---

 arch/mips/boot/dts/mti/sead3.dts | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/arch/mips/boot/dts/mti/sead3.dts b/arch/mips/boot/dts/mti/sead3.dts
index 193b1f352336..cabe256f9a68 100644
--- a/arch/mips/boot/dts/mti/sead3.dts
+++ b/arch/mips/boot/dts/mti/sead3.dts
@@ -53,11 +53,6 @@
 		 * controller & should be probed first.
 		 */
 		interrupt-parent = <&cpu_intc>;
-
-		timer {
-			compatible = "mti,gic-timer";
-			interrupts = <GIC_LOCAL 1 IRQ_TYPE_NONE>;
-		};
 	};
 
 	ehci@1b200000 {
-- 
2.13.0
