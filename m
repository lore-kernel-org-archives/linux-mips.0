Received: from mailapp01.imgtec.com ([195.59.15.196]:50752 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23995126AbdHGXC4aMTdI (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 8 Aug 2017 01:02:56 +0200
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 4/7] MIPS: Prevent direct use of generic_defconfig
Date: Mon, 7 Aug 2017 16:01:15 -0700
Message-ID: <20170807230119.10629-5-paul.burton@imgtec.com>
In-Reply-To: <20170807230119.10629-1-paul.burton@imgtec.com>
References: <20170807230119.10629-1-paul.burton@imgtec.com>
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
Message-ID: <20170807230115.bj0E7K08CMYTLqRl-uKwWpK9F05Ii1_yvqAS2QrGl1c@z>

Using generic_defconfig directly is unlikely to be what a user actually
wants to do - it doesn't specify any particular ISA revision & it
doesn't enable any board or driver support, resulting in a largely
useless kernel.

Prevent users from using it directly, printing a helpful message to
point them in the right direction if they attempt to.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
---

 arch/mips/Makefile | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/mips/Makefile b/arch/mips/Makefile
index a715888179b3..b6f56e251f3b 100644
--- a/arch/mips/Makefile
+++ b/arch/mips/Makefile
@@ -501,6 +501,19 @@ $(generic_defconfigs):
 #
 $(generic_config_dir)/%.config: ;
 
+#
+# Prevent direct use of generic_defconfig, which is intended to be used as the
+# basis of the various ISA-specific targets generated above.
+#
+.PHONY: generic_defconfig
+generic_defconfig:
+	$(Q)echo "generic_defconfig is not intended for direct use, but should instead be"
+	$(Q)echo "used via an ISA-specific target from the following list:"
+	$(Q)echo
+	$(Q)for cfg in $(generic_defconfigs); do echo "  $${cfg}"; done
+	$(Q)echo
+	$(Q)false
+
 #
 # Legacy defconfig compatibility - these targets used to be real defconfigs but
 # now that the boards have been converted to use the generic kernel they are
-- 
2.14.0
