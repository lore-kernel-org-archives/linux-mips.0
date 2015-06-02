Received: from mailapp01.imgtec.com ([195.59.15.196]:41263 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27006786AbbFBH76pvjt4 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 2 Jun 2015 09:59:58 +0200
Subject: [PATCH 3/3] MIPS: bugfix - replace smp_mb with release barrier
 function in unlocks
From: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>
Date: Mon, 1 Jun 2015 17:09:52 -0700
Message-ID: <20150602000952.6668.82483.stgit@ubuntu-yegoshin>
In-Reply-To: <20150602000818.6668.76632.stgit@ubuntu-yegoshin>
References: <20150602000818.6668.76632.stgit@ubuntu-yegoshin>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-Path: <Leonid.Yegoshin@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: linux-mips@linux-mips.org, benh@kernel.crashing.org, will.deacon@arm.com, linux-kernel@vger.kernel.org, ralf@linux-mips.org, markos.chandras@imgtec.com, macro@linux-mips.org, Steven.Hill@imgtec.com, alexander.h.duyck@redhat.com, davem@davemloft.net
Message-ID: <20150602000952.YE3TOyb8JrwWFG1yZ25nK36sc3iTOlAucb8P_MzZ7Gc@z>

Repleace smp_mb() in arch_write_unlock() and __clear_bit_unlock() to
smp_mb__before_llsc() call which does "release" barrier functionality.

It seems like it was missed in commit f252ffd50c97dae87b45f1dbad24f71358ccfbd6
during introduction of "acquire" and "release" semantics.

Signed-off-by: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>
---
 arch/mips/include/asm/bitops.h   |    2 +-
 arch/mips/include/asm/spinlock.h |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/mips/include/asm/bitops.h b/arch/mips/include/asm/bitops.h
index 0cf29bd5dc5c..ce9666cf1499 100644
--- a/arch/mips/include/asm/bitops.h
+++ b/arch/mips/include/asm/bitops.h
@@ -469,7 +469,7 @@ static inline int test_and_change_bit(unsigned long nr,
  */
 static inline void __clear_bit_unlock(unsigned long nr, volatile unsigned long *addr)
 {
-	smp_mb();
+	smp_mb__before_llsc();
 	__clear_bit(nr, addr);
 }
 
diff --git a/arch/mips/include/asm/spinlock.h b/arch/mips/include/asm/spinlock.h
index 1fca2e0793dc..7c7f3b2bd3de 100644
--- a/arch/mips/include/asm/spinlock.h
+++ b/arch/mips/include/asm/spinlock.h
@@ -317,7 +317,7 @@ static inline void arch_write_lock(arch_rwlock_t *rw)
 
 static inline void arch_write_unlock(arch_rwlock_t *rw)
 {
-	smp_mb();
+	smp_mb__before_llsc();
 
 	__asm__ __volatile__(
 	"				# arch_write_unlock	\n"
