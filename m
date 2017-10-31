Received: from 19pmail.ess.barracuda.com ([64.235.154.231]:33300 "EHLO
        19pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23991940AbdJaVlVy01Gl (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 31 Oct 2017 22:41:21 +0100
From: James Hogan <james.hogan@mips.com>
Subject: [PATCH for-4.14] MIPS: generic: Fix NI 169445 its build
Date: Tue, 31 Oct 2017 21:41:07 +0000
Message-ID: <20171031214107.15596-1-james.hogan@mips.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <James.Hogan@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>
Cc: James Hogan <james.hogan@mips.com>, James Hogan <jhogan@kernel.org>, Nathan Sullivan <nathan.sullivan@ni.com>, linux-mips@linux-mips.org
Message-ID: <20171031214107.nLewYwv_Hf-tEngP41sZlPxATleh-IhXgLJBSVuKM6Q@z>

From: James Hogan <jhogan@kernel.org>

Since commit 04a85e087ad6 ("MIPS: generic: Move NI 169445 FIT image
source to its own file"), a generic 32r2el_defconfig kernel fails to
build with the following build error:

  ITB     arch/mips/boot/vmlinux.gz.itb
Error: arch/mips/boot/vmlinux.gz.its:111.1-2 syntax error
FATAL ERROR: Unable to parse input tree
mkimage Can't read arch/mips/boot/vmlinux.gz.itb.tmp: Invalid argument

This is because arch/mips/generic/board-ni169445.its.S doesn't include
the necessary "/" node path before the first open brace, which did
previously exist when it was in arch/mips/generic/vmlinux.its.S.

Fixes: 04a85e087ad6 ("MIPS: generic: Move NI 169445 FIT image source to its own file")
Signed-off-by: James Hogan <jhogan@kernel.org>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: Paul Burton <paul.burton@mips.com>
Cc: Nathan Sullivan <nathan.sullivan@ni.com>
Cc: linux-mips@linux-mips.org
---
 arch/mips/generic/board-ni169445.its.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/generic/board-ni169445.its.S b/arch/mips/generic/board-ni169445.its.S
index d12e12fe90be..e4cb4f95a8cc 100644
--- a/arch/mips/generic/board-ni169445.its.S
+++ b/arch/mips/generic/board-ni169445.its.S
@@ -1,4 +1,4 @@
-{
+/ {
 	images {
 		fdt@ni169445 {
 			description = "NI 169445 device tree";
-- 
2.14.1
