Received: from 9pmail.ess.barracuda.com ([64.235.150.224]:37205 "EHLO
        9pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23992176AbdLLJ7GEdjmC (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 12 Dec 2017 10:59:06 +0100
From: Matt Redfearn <matt.redfearn@mips.com>
Subject: [RFC PATCH 04/16] MIPS: Add constant accessors for CP0.Context / CP0.XContext
Date: Tue, 12 Dec 2017 09:57:50 +0000
Message-ID: <1513072682-1371-5-git-send-email-matt.redfearn@mips.com>
In-Reply-To: <1513072682-1371-1-git-send-email-matt.redfearn@mips.com>
References: <1513072682-1371-1-git-send-email-matt.redfearn@mips.com>
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
To: Ralf Baechle <ralf@linux-mips.org>, James Hogan <jhogan@kernel.org>
Cc: linux-mips@linux-mips.org
Message-ID: <20171212095750.24ja7KeZilZtWwStU5tBVbvv6jNT3sVMCQEPcMU5sD0@z>

The current accessors are asm volatile meaning that the compiler cannot
optimise multiple requests for the value of these registers. Once
smp_processor_id() is switched to using these registers, this is
suboptimal. The Processor ID component of the register is constant, so
__read_const_32bit_c0_register / __read_const_64bit_c0_register can be
used to fetch the constant value and allow the compiler to optimise
multiple fetches. Barriers enforced by preempt_enable() ensure a re-read
of the register after preemption, when the running CPU may have changed.

Signed-off-by: Matt Redfearn <matt.redfearn@mips.com>
---

 arch/mips/include/asm/mipsregs.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/mips/include/asm/mipsregs.h b/arch/mips/include/asm/mipsregs.h
index 24d3028ba76d..67682acf8284 100644
--- a/arch/mips/include/asm/mipsregs.h
+++ b/arch/mips/include/asm/mipsregs.h
@@ -1478,6 +1478,7 @@ do {									\
 #define read_c0_globalnumber()	__read_32bit_c0_register($3, 1)
 
 #define read_c0_context()	__read_ulong_c0_register($4, 0)
+#define read_const_c0_context()	__read_const_ulong_c0_register($4, 0)
 #define write_c0_context(val)	__write_ulong_c0_register($4, 0, val)
 
 #define read_c0_contextconfig()		__read_32bit_c0_register($4, 1)
@@ -1628,6 +1629,7 @@ do {									\
 #define write_c0_watchhi7(val)	__write_32bit_c0_register($19, 7, val)
 
 #define read_c0_xcontext()	__read_ulong_c0_register($20, 0)
+#define read_const_c0_xcontext()	__read_const_ulong_c0_register($20, 0)
 #define write_c0_xcontext(val)	__write_ulong_c0_register($20, 0, val)
 
 #define read_c0_intcontrol()	__read_32bit_c0_ctrl_register($20)
-- 
2.7.4
