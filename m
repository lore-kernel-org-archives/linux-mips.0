Received: from mailapp01.imgtec.com ([195.59.15.196]:8558 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27008013AbbK3QWsIEKIV (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 30 Nov 2015 17:22:48 +0100
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 02/28] dt-bindings: ascii-lcd: Document a binding for simple ASCII LCDs
Date: Mon, 30 Nov 2015 16:21:27 +0000
Message-ID: <1448900513-20856-3-git-send-email-paul.burton@imgtec.com>
In-Reply-To: <1448900513-20856-1-git-send-email-paul.burton@imgtec.com>
References: <1448900513-20856-1-git-send-email-paul.burton@imgtec.com>
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
Cc: Paul Burton <paul.burton@imgtec.com>, Tejun Heo <tj@kernel.org>, Joe Perches <joe@perches.com>, Jiri Slaby <jslaby@suse.com>, Mauro Carvalho Chehab <mchehab@osg.samsung.com>, linux-kernel@vger.kernel.org, Kumar Gala <galak@codeaurora.org>, "David S. Miller" <davem@davemloft.net>, Ian Campbell <ijc+devicetree@hellion.org.uk>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Pawel Moll <pawel.moll@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mark Rutland <mark.rutland@arm.com>
Message-ID: <20151130162127.Aq-gubucN2qYHdf7QB8_X3Yo0ohQSPIaI7W2Bc4srL8@z>

Add documentation for a devicetree binding for simple memory-mapped
ASCII LCD displays, such as those found on the Imagination Technologies
Boston & Malta development boards.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
---

 Documentation/devicetree/bindings/ascii-lcd.txt | 10 ++++++++++
 MAINTAINERS                                     |  5 +++++
 2 files changed, 15 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/ascii-lcd.txt

diff --git a/Documentation/devicetree/bindings/ascii-lcd.txt b/Documentation/devicetree/bindings/ascii-lcd.txt
new file mode 100644
index 0000000..40ae536
--- /dev/null
+++ b/Documentation/devicetree/bindings/ascii-lcd.txt
@@ -0,0 +1,10 @@
+Binding for simple memory-mapped ASCII LCD displays
+
+Required properties:
+- compatible : should be one of:
+    "img,boston-lcd"
+    "mti,malta-lcd"
+- reg : memory region locating the device registers
+
+The layout of the registers & properties of the display are determined
+from the compatible string, making this binding somewhat trivial.
diff --git a/MAINTAINERS b/MAINTAINERS
index cba790b..1e2b74b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1782,6 +1782,11 @@ S:	Maintained
 F:	Documentation/hwmon/asc7621
 F:	drivers/hwmon/asc7621.c
 
+ASCII LCD DRIVER
+M:	Paul Burton <paul.burton@imgtec.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/ascii-lcd.txt
+
 ASUS NOTEBOOKS AND EEEPC ACPI/WMI EXTRAS DRIVERS
 M:	Corentin Chary <corentin.chary@gmail.com>
 L:	acpi4asus-user@lists.sourceforge.net
-- 
2.6.2
