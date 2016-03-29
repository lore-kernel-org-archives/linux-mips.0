Received: from mailapp01.imgtec.com ([195.59.15.196]:8123 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27025249AbcC2If5eTKFk (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 29 Mar 2016 10:35:57 +0200
From: Matt Redfearn <matt.redfearn@imgtec.com>
Subject: [PATCH v2 2/6] MIPS: Support sending SIG_SYS to 32bit userspace from 64bit kernel
Date: Tue, 29 Mar 2016 09:35:30 +0100
Message-ID: <1459240534-8658-3-git-send-email-matt.redfearn@imgtec.com>
In-Reply-To: <1459240534-8658-1-git-send-email-matt.redfearn@imgtec.com>
References: <1459240534-8658-1-git-send-email-matt.redfearn@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Matt.Redfearn@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: IMG-MIPSLinuxKerneldevelopers@imgtec.com
Cc: Matt Redfearn <matt.redfearn@imgtec.com>, Paul Burton <paul.burton@imgtec.com>, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org, Amanieu d'Antras <amanieu@gmail.com>, Ralf Baechle <ralf@linux-mips.org>, Alex Smith <alex.smith@imgtec.com>, Andrew Morton <akpm@linux-foundation.org>
Message-ID: <20160329083530.kTAucMyahrUGQisLhJY059prOJ1OMoyNFOwKWaZb9Uo@z>

The seccomp_bpf self test revealed that a 64bit kernel delivered an
invalid SIG_SYS to a 32bit userspace, because it was falling into the
default of the switch statement. Add a case to handle delivering the
signal.

With this patch, the seccomp_bpf self test now passes the TRAP.handler
case with O32 and N32 userlands.

Signed-off-by: Matt Redfearn <matt.redfearn@imgtec.com>
Cc: Paul Burton <paul.burton@imgtec.com>
Cc: linux-mips@linux-mips.org
---

Changes in v2: None

 arch/mips/kernel/signal32.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/mips/kernel/signal32.c b/arch/mips/kernel/signal32.c
index 4909639aa35b..78c8349d151c 100644
--- a/arch/mips/kernel/signal32.c
+++ b/arch/mips/kernel/signal32.c
@@ -227,6 +227,12 @@ int copy_siginfo_to_user32(compat_siginfo_t __user *to, const siginfo_t *from)
 			err |= __put_user(from->si_uid, &to->si_uid);
 			err |= __put_user(from->si_int, &to->si_int);
 			break;
+		case __SI_SYS >> 16:
+			err |= __copy_to_user(&to->si_call_addr, &from->si_call_addr,
+					      sizeof(compat_uptr_t));
+			err |= __put_user(from->si_syscall, &to->si_syscall);
+			err |= __put_user(from->si_arch, &to->si_arch);
+			break;
 		}
 	}
 	return err;
-- 
2.5.0
