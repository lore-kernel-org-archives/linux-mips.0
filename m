Received: from 9pmail.ess.barracuda.com ([64.235.150.224]:56976 "EHLO
        9pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23990424AbdLULRX2Bu6q (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 21 Dec 2017 12:17:23 +0100
From: Matt Redfearn <matt.redfearn@mips.com>
Subject: [PATCH 2/3] MIPS: Add barrier between dcache & icache flushes
Date: Thu, 21 Dec 2017 11:16:03 +0000
Message-ID: <1513854965-3880-2-git-send-email-matt.redfearn@mips.com>
In-Reply-To: <1513854965-3880-1-git-send-email-matt.redfearn@mips.com>
References: <1513854965-3880-1-git-send-email-matt.redfearn@mips.com>
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
Cc: linux-mips@linux-mips.org, Matt Redfearn <matt.redfearn@mips.com>, James Hogan <james.hogan@mips.com>, "stable # v4 . 9+" <stable@vger.kernel.org>, Huacai Chen <chenhc@lemote.com>, linux-kernel@vger.kernel.org, Paul Burton <paul.burton@mips.com>
Message-ID: <20171221111603.a5K2JfR_dWmy4u7AxU2UA75tzYMFx9r-bjxG2c00Dds@z>

Index-based cache operations may be arbitrarily reordered by out of
order CPUs. Thus code which writes back the dcache & then invalidates
the icache using indexed cache ops must include a barrier between
operating on the 2 caches in order to prevent the scenario in which:

  - icache invalidation occurs.
  - icache fetch occurs, due to speculation.
  - dcache writeback occurs.

If the above were allowed to happen then the icache would contain stale
data. Forcing the dcache writeback to complete before the icache
invalidation avoids this.

Similarly, the MIPS CM version 2 and above serialises D->I hit-based
cache operations to the same address, but older CMs and systems without
a MIPS CM do not and require the same barrier to ensure ordering.

To ensure these conditions, always enforce a barrier between D and I
cache operations.

Suggested-by: Leonid Yegoshin <Leonid.Yegoshin@mips.com>
Suggested-by: Paul Burton <paul.burton@mips.com>
Signed-off-by: Matt Redfearn <matt.redfearn@mips.com>
Cc: James Hogan <james.hogan@mips.com>
Cc: stable <stable@vger.kernel.org> # v4.9+
---

 arch/mips/mm/c-r4k.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/mips/mm/c-r4k.c b/arch/mips/mm/c-r4k.c
index ce7a54223504..b7186d47184b 100644
--- a/arch/mips/mm/c-r4k.c
+++ b/arch/mips/mm/c-r4k.c
@@ -741,6 +741,9 @@ static inline void __local_r4k_flush_icache_range(unsigned long start,
 			else
 				blast_dcache_range(start, end);
 		}
+
+		/* Ensure dcache operation has completed */
+		mb();
 	}
 
 	if (type == R4K_INDEX ||
-- 
2.7.4
