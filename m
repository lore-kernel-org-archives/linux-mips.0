Received: from p549F7CF3.dip.t-dialin.net ([84.159.124.243]:20646 "EHLO
	p549F7CF3.dip.t-dialin.net") by ftp.linux-mips.org with ESMTP
	id S20041464AbXAPQlk (ORCPT <rfc822;linux-mips@linux-mips.org>);
	Tue, 16 Jan 2007 16:41:40 +0000
Received: from ebiederm.dsl.xmission.com ([166.70.28.69]:59098 "EHLO
	ebiederm.dsl.xmission.com") by lappi.linux-mips.net with ESMTP
	id S1099604AbXAPQlf (ORCPT <rfc822;linux-mips@linux-mips.org>);
	Tue, 16 Jan 2007 17:41:35 +0100
From: "Eric W. Biederman" <ebiederm@xmission.com>
Subject: [PATCH 24/59] sysctl: frv remove unnecessary insert_at_head flag
Date: Tue, 16 Jan 2007 09:39:29 -0700
Message-ID: <1168965642471-git-send-email-ebiederm@xmission.com>
In-Reply-To: <m1ac0jc4no.fsf@ebiederm.dsl.xmission.com>
References: <m1ac0jc4no.fsf@ebiederm.dsl.xmission.com>
Return-Path: <eric@ebiederm.dsl.xmission.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: "<Andrew Morton" <akpm@osdl.org>
Cc: linux-kernel@vger.kernel.org, containers@lists.osdl.org, netdev@vger.kernel.org, xfs-masters@oss.sgi.com, xfs@oss.sgi.com, linux-scsi@vger.kernel.org, James.Bottomley@SteelEye.com, minyard@acm.org, openipmi-developer@lists.sourceforge.net, tony.luck@intel.com, linux-mips@linux-mips.org, ralf@linux-mips.org, schwidefsky@de.ibm.com, heiko.carstens@de.ibm.com, linux390@de.ibm.com, linux-390@vm.marist.edu, paulus@samba.org, linuxppc-dev@ozlabs.org, lethal@linux-sh.org, linuxsh-shmedia-dev@lists.sourceforge.net, ak@suse.de, vojtech@suse.cz, clemens@ladisch.de, a.zummo@towertech.it, rtc-linux@googlegroups.com, linux-parport@lists.infradead.org, andrea@suse.de, tim@cyberelk.net, philb@gnu.org, aharkes@cs.cmu.edu, coda@cs.cmu.edu, codalist@TELEMANN.coda.cs.cmu.edu, aia21@cantab.net, linux-ntfs-dev@lists.sourceforge.net, mark.fasheh@oracle.com, kurt.hackel@oracle.com, "Eric W. Biederman" <ebiederm@xmission.com>
Message-ID: <20070116163929.e7Ic0bmPWN0aiUWNp2GgHF0t4Clcwq2qALMh37Sgt2w@z>

From: Eric W. Biederman <ebiederm@xmission.com> - unquoted

Since the binary sysctl numbers are unique putting the registered
sysctls at the head of the sysctl list where they can override
existing sysctls serves no useful purpose.

Signed-off-by: Eric W. Biederman <ebiederm@xmission.com>
---
 arch/frv/kernel/sysctl.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/frv/kernel/sysctl.c b/arch/frv/kernel/sysctl.c
index 2f4da32..37528eb 100644
--- a/arch/frv/kernel/sysctl.c
+++ b/arch/frv/kernel/sysctl.c
@@ -197,7 +197,7 @@ static struct ctl_table frv_dir_table[] =
  */
 static int __init frv_sysctl_init(void)
 {
-	register_sysctl_table(frv_dir_table, 1);
+	register_sysctl_table(frv_dir_table, 0);
 	return 0;
 }
 
-- 
1.4.4.1.g278f
