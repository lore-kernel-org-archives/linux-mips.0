Received: from mail-lf0-x22c.google.com ([IPv6:2a00:1450:4010:c07::22c]:32929
        "EHLO mail-lf0-x22c.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23995079AbdH0T40LT3XV (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Sun, 27 Aug 2017 21:56:26 +0200
Received: by mail-lf0-x22c.google.com with SMTP id y15so15286683lfd.0
        for <linux-mips@linux-mips.org>; Sun, 27 Aug 2017 12:56:24 -0700 (PDT)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <20170827195613.904715064@cogentembedded.com>
Date: Sun, 27 Aug 2017 22:55:09 +0300
Subject: [PATCH] pata_octeon_cf: use of_property_read_{bool|u32}()
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Disposition: inline; filename=pata_octeon_cf-use-of_property_read_-bool-u32.patch
Return-Path: <sergei.shtylyov@cogentembedded.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Tejun Heo <tj@kernel.org>, "\"open list:LIBATA PATA DRIVERS\"" <linux-ide@vger.kernel.org>
Cc: linux-mips@linux-mips.org, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <20170827195509.Gd5H5NCXwgyicxlMBF4eZAAC2YhfdPZb596XkXAhFa0@z>

The Octeon CF driver basically  open-codes of_property_read_{bool|u32}()
using  of_{find|get}_property() calls in its  probe() method.  Using the
modern DT APIs saves 2 LoCs and 16 bytes of object code (MIPS gcc 3.4.3).

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
 drivers/ata/pata_octeon_cf.c |   10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

Index: libata/drivers/ata/pata_octeon_cf.c
===================================================================
--- libata.orig/drivers/ata/pata_octeon_cf.c
+++ libata/drivers/ata/pata_octeon_cf.c
@@ -840,7 +840,6 @@ static int octeon_cf_probe(struct platfo
 	struct property *reg_prop;
 	int n_addr, n_size, reg_len;
 	struct device_node *node;
-	const void *prop;
 	void __iomem *cs0;
 	void __iomem *cs1 = NULL;
 	struct ata_host *host;
@@ -850,7 +849,7 @@ static int octeon_cf_probe(struct platfo
 	void __iomem *base;
 	struct octeon_cf_port *cf_port;
 	int rv = -ENOMEM;
-
+	u32 bus_width;
 
 	node = pdev->dev.of_node;
 	if (node == NULL)
@@ -860,11 +859,10 @@ static int octeon_cf_probe(struct platfo
 	if (!cf_port)
 		return -ENOMEM;
 
-	cf_port->is_true_ide = (of_find_property(node, "cavium,true-ide", NULL) != NULL);
+	cf_port->is_true_ide = of_property_read_bool(node, "cavium,true-ide");
 
-	prop = of_get_property(node, "cavium,bus-width", NULL);
-	if (prop)
-		is_16bit = (be32_to_cpup(prop) == 16);
+	if (of_property_read_u32(node, "cavium,bus-width", &bus_width) == 0)
+		is_16bit = (bus_width == 16);
 	else
 		is_16bit = false;
 
