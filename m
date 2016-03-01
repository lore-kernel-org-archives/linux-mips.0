Received: from mail333.us4.mandrillapp.com ([205.201.137.77]:58633 "EHLO
        mail333.us4.mandrillapp.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S27024638AbcCAXyle5LaJ (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 2 Mar 2016 00:54:41 +0100
Received: from pmta03.dal05.mailchimp.com (127.0.0.1) by mail333.us4.mandrillapp.com id hqols2174nol for <linux-mips@linux-mips.org>; Tue, 1 Mar 2016 23:54:36 +0000 (envelope-from <bounce-md_30481620.56d62bbc.v1-35961bc74d0049c387eef7a6ded29d24@mandrillapp.com>)
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 4.4 158/342] MIPS: Fix buffer overflow in syscall_get_arguments()
Message-ID: <20160301234533.074219876@linuxfoundation.org>
In-Reply-To: <20160301234527.990448862@linuxfoundation.org>
References: <20160301234527.990448862@linuxfoundation.org>
Date: Tue, 01 Mar 2016 23:54:36 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-Path: <bounce-md_30481620.56d62bbc.v1-35961bc74d0049c387eef7a6ded29d24@mandrillapp.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org, Milko Leporis <milko.leporis@imgtec.com>, James Hogan <james.hogan@imgtec.com>, linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>
Message-ID: <20160301235436.16q7RnUHDfJc4K8_5cTDx8E_KzYbr9VXo_gjxJBEOeI@z>

4.4-stable review patch.  If anyone has any objections, please let me know.

------------------

From: James Hogan <james.hogan@imgtec.com>

commit f4dce1ffd2e30fa31756876ef502ce6d2324be35 upstream.

Since commit 4c21b8fd8f14 ("MIPS: seccomp: Handle indirect system calls
(o32)"), syscall_get_arguments() attempts to handle o32 indirect syscall
arguments by incrementing both the start argument number and the number
of arguments to fetch. However only the start argument number needs to
be incremented. The number of arguments does not change, they're just
shifted up by one, and in fact the output array is provided by the
caller and is likely only n entries long, so reading more arguments
overflows the output buffer.

In the case of seccomp, this results in it fetching 7 arguments starting
at the 2nd one, which overflows the unsigned long args[6] in
populate_seccomp_data(). This clobbers the $s0 register from
syscall_trace_enter() which __seccomp_phase1_filter() saved onto the
stack, into which syscall_trace_enter() had placed its syscall number
argument. This caused Chromium to crash.

Credit goes to Milko for tracking it down as far as $s0 being clobbered.

Fixes: 4c21b8fd8f14 ("MIPS: seccomp: Handle indirect system calls (o32)")
Reported-by: Milko Leporis <milko.leporis@imgtec.com>
Signed-off-by: James Hogan <james.hogan@imgtec.com>
Cc: linux-mips@linux-mips.org
Patchwork: https://patchwork.linux-mips.org/patch/12213/
Signed-off-by: Ralf Baechle <ralf@linux-mips.org>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

---
 arch/mips/include/asm/syscall.h |    4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

--- a/arch/mips/include/asm/syscall.h
+++ b/arch/mips/include/asm/syscall.h
@@ -101,10 +101,8 @@ static inline void syscall_get_arguments
 	/* O32 ABI syscall() - Either 64-bit with O32 or 32-bit */
 	if ((config_enabled(CONFIG_32BIT) ||
 	    test_tsk_thread_flag(task, TIF_32BIT_REGS)) &&
-	    (regs->regs[2] == __NR_syscall)) {
+	    (regs->regs[2] == __NR_syscall))
 		i++;
-		n++;
-	}
 
 	while (n--)
 		ret |= mips_get_syscall_arg(args++, task, regs, i++);
