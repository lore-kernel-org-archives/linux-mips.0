Received: from 19pmail.ess.barracuda.com ([64.235.154.231]:45611 "EHLO
        19pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23992998AbdKNPquqhjl0 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 14 Nov 2017 16:46:50 +0100
From: Matt Redfearn <matt.redfearn@mips.com>
Subject: [PATCH 2/2] MIPS: RB532: Avoid undefined mac_pton without GENERIC_NET_UTILS
Date: Tue, 14 Nov 2017 15:44:23 +0000
Message-ID: <1510674263-14065-2-git-send-email-matt.redfearn@mips.com>
In-Reply-To: <1510674263-14065-1-git-send-email-matt.redfearn@mips.com>
References: <1510674263-14065-1-git-send-email-matt.redfearn@mips.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Matt.Redfearn@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Ralf Baechle <ralf@linux-mips.org>, James Hogan <james.hogan@mips.com>
Cc: linux-mips@linux-mips.org, Matt Redfearn <matt.redfearn@mips.com>, linux-kernel@vger.kernel.org, Boris Brezillon <boris.brezillon@free-electrons.com>, Neil Armstrong <narmstrong@baylibre.com>, Krzysztof Kozlowski <krzk@kernel.org>, Tony Lindgren <tony@atomide.com>, Vladimir Zapolskiy <vz@mleia.com>, Shawn Guo <shawnguo@kernel.org>
Message-ID: <20171114154423.nVj5TPDJZ96TYlP6Bgyn95XtWHVcDuEq3dTynv1ZFVE@z>

Currently MIPS allnoconfig with CONFIG_MIKROTIK_RB532=y fails to link
due to missing support for mac_pton():

  LD      vmlinux
arch/mips/rb532/devices.o: In function `setup_kmac':
devices.c:(.init.text+0xc): undefined reference to `mac_pton'

Rather than adding dependencies to the platform to force inclusion of
GENERIC_NET_UTILS which is selected by CONFIG_NET, just exclude the
setup of the MAC address if CONFIG_NET is not selected in the kernel
config.

Signed-off-by: Matt Redfearn <matt.redfearn@mips.com>
---

 arch/mips/rb532/devices.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/mips/rb532/devices.c b/arch/mips/rb532/devices.c
index 32ea3e6731d6..354d258396ff 100644
--- a/arch/mips/rb532/devices.c
+++ b/arch/mips/rb532/devices.c
@@ -310,6 +310,8 @@ static int __init plat_setup_devices(void)
 	return platform_add_devices(rb532_devs, ARRAY_SIZE(rb532_devs));
 }
 
+#ifdef CONFIG_NET
+
 static int __init setup_kmac(char *s)
 {
 	printk(KERN_INFO "korina mac = %s\n", s);
@@ -322,4 +324,6 @@ static int __init setup_kmac(char *s)
 
 __setup("kmac=", setup_kmac);
 
+#endif /* CONFIG_NET */
+
 arch_initcall(plat_setup_devices);
-- 
2.7.4
