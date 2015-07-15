Received: from mailapp01.imgtec.com ([195.59.15.196]:54556 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27011182AbbGOPRzvHGJK (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 15 Jul 2015 17:17:55 +0200
From: James Hogan <james.hogan@imgtec.com>
Subject: [PATCH 1/6] Documentation/sysrq.txt: Mention MIPS TLB dump (x)
Date: Wed, 15 Jul 2015 16:17:42 +0100
Message-ID: <1436973467-3877-2-git-send-email-james.hogan@imgtec.com>
In-Reply-To: <1436973467-3877-1-git-send-email-james.hogan@imgtec.com>
References: <1436973467-3877-1-git-send-email-james.hogan@imgtec.com>
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
To: Ralf Baechle <ralf@linux-mips.org>, "Maciej W. Rozycki" <macro@linux-mips.org>, linux-mips@linux-mips.org
Cc: James Hogan <james.hogan@imgtec.com>, Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Message-ID: <20150715151742.PgCwZ0q1SAGdKm9C1n-Pg3RYc6zVoCQLzb9oAU0DIfs@z>

Commit d1e9a4f54735 ("MIPS: Add SysRq operation to dump TLBs on all
CPUs") added the 'x' sysrq key for dumping MIPS TLB entries, but didn't
document it in Documentation/sysrq.txt.

Add mention of the MIPS use of the 'x' SysRq key.

Reported-by: Maciej W. Rozycki <macro@linux-mips.org>
Signed-off-by: James Hogan <james.hogan@imgtec.com>
Cc: Maciej W. Rozycki <macro@linux-mips.org>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: linux-mips@linux-mips.org
Cc: linux-doc@vger.kernel.org
---
 Documentation/sysrq.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/sysrq.txt b/Documentation/sysrq.txt
index 0e307c94809a..267f39386f99 100644
--- a/Documentation/sysrq.txt
+++ b/Documentation/sysrq.txt
@@ -119,6 +119,7 @@ On all -  write a character to /proc/sysrq-trigger.  e.g.:
 
 'x'	- Used by xmon interface on ppc/powerpc platforms.
           Show global PMU Registers on sparc64.
+          Dump all TLB entries on MIPS.
 
 'y'	- Show global CPU Registers [SPARC-64 specific]
 
-- 
2.3.6
