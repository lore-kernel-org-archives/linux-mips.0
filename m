Received: from 9pmail.ess.barracuda.com ([64.235.154.211]:49372 "EHLO
        9pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23993124AbeDCJZEuClDO (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 3 Apr 2018 11:25:04 +0200
From: Matt Redfearn <matt.redfearn@mips.com>
Subject: [PATCH v5 1/3] Add notrace to lib/ucmpdi2.c
Date: Tue, 3 Apr 2018 10:24:24 +0100
Message-ID: <1522747466-22081-1-git-send-email-matt.redfearn@mips.com>
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
To: Palmer Dabbelt <palmer@sifive.com>, Antony Pavlov <antonynpavlov@gmail.com>, James Hogan <jhogan@kernel.org>, Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org, Matt Redfearn <matt.redfearn@mips.com>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-kernel@vger.kernel.org
Message-ID: <20180403092424.3g57GWCWtpsR43RBD0UIPtWP5xfTFEiPlDTcb7hd7Ig@z>

From: Palmer Dabbelt <palmer@sifive.com>

As part of the MIPS conversion to use the generic GCC library routines,
Matt Redfearn discovered that I'd missed a notrace on __ucmpdi2().  This
patch rectifies the problem.

CC: Matt Redfearn <matt.redfearn@mips.com>
CC: Antony Pavlov <antonynpavlov@gmail.com>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
Reviewed-by: Matt Redfearn <matt.redfearn@mips.com>
Signed-off-by: Matt Redfearn <matt.redfearn@mips.com>
---

Changes in v5: None
Changes in v4: None
Changes in v3: None
Changes in v2:
  add notrace to lib/ucmpdi2.c

 lib/ucmpdi2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/ucmpdi2.c b/lib/ucmpdi2.c
index 25ca2d4c1e19..597998169a96 100644
--- a/lib/ucmpdi2.c
+++ b/lib/ucmpdi2.c
@@ -17,7 +17,7 @@
 #include <linux/module.h>
 #include <linux/libgcc.h>
 
-word_type __ucmpdi2(unsigned long long a, unsigned long long b)
+word_type notrace __ucmpdi2(unsigned long long a, unsigned long long b)
 {
 	const DWunion au = {.ll = a};
 	const DWunion bu = {.ll = b};
-- 
2.7.4
