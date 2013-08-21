Received: from multi.imgtec.com ([194.200.65.239]:1996 "EHLO multi.imgtec.com"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S6825655Ab3HUOgcFv1M- (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Wed, 21 Aug 2013 16:36:32 +0200
From: James Hogan <james.hogan@imgtec.com>
Subject: [PATCH] MIPS: add <dt-bindings/> symlink
Date: Wed, 21 Aug 2013 15:36:02 +0100
Message-ID: <1377095762-18926-1-git-send-email-james.hogan@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <James.Hogan@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Ralf Baechle <ralf@linux-mips.org>
Cc: James Hogan <james.hogan@imgtec.com>, Stephen Warren <swarren@nvidia.com>, Michal Marek <mmarek@suse.cz>, Shawn Guo <shawn.guo@linaro.org>, Ian Campbell <ian.campbell@citrix.com>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <rob.herring@calxeda.com>, linux-mips@linux-mips.org, devicetree@vger.kernel.org, linux-kbuild@vger.kernel.org
Message-ID: <20130821143602.iWnZFGJ2hwIWH0fMXAAJRDU7RLzmg1-3gVxYiytgxpU@z>

Add symlink to include/dt-bindings from arch/mips/boot/dts/include/ to
match the ones in ARM and Meta architectures so that preprocessed device
tree files can include various useful constant definitions.

See commit c58299a (kbuild: create an "include chroot" for DT bindings)
merged in v3.10-rc1 for details.

MIPS structures it's dts files a little differently to other
architectures, having a separate dts directory for each SoC/platform,
but most of the definitions in the dt-bindings/ directory are common so
for now lets just have a single "include chroot" for all MIPS platforms.

Signed-off-by: James Hogan <james.hogan@imgtec.com>
Reviewed-by: Steven. J. Hill <steven.hill@imgtec.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: Stephen Warren <swarren@nvidia.com>
Cc: Michal Marek <mmarek@suse.cz>
Cc: Shawn Guo <shawn.guo@linaro.org>
Cc: Ian Campbell <ian.campbell@citrix.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Pawel Moll <pawel.moll@arm.com>
Cc: Rob Herring <rob.herring@calxeda.com>
Cc: linux-mips@linux-mips.org
Cc: devicetree@vger.kernel.org
Cc: linux-kbuild@vger.kernel.org
---
 arch/mips/boot/dts/include/dt-bindings | 1 +
 1 file changed, 1 insertion(+)
 create mode 120000 arch/mips/boot/dts/include/dt-bindings

diff --git a/arch/mips/boot/dts/include/dt-bindings b/arch/mips/boot/dts/include/dt-bindings
new file mode 120000
index 0000000..08c00e4
--- /dev/null
+++ b/arch/mips/boot/dts/include/dt-bindings
@@ -0,0 +1 @@
+../../../../../include/dt-bindings
\ No newline at end of file
-- 
1.8.1.2
