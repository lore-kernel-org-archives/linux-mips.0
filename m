Received: from 9pmail.ess.barracuda.com ([64.235.154.211]:39487 "EHLO
        9pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23990405AbeC2MX4yeaXZ (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 29 Mar 2018 14:23:56 +0200
From: Matt Redfearn <matt.redfearn@mips.com>
Subject: [PATCH 0/2] MIPS: memset.S: Fix 2 issues with __clear_user
Date: Thu, 29 Mar 2018 10:28:22 +0100
Message-ID: <1522315704-31641-1-git-send-email-matt.redfearn@mips.com>
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
To: James Hogan <jhogan@kernel.org>, Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org, Matt Redfearn <matt.redfearn@mips.com>, linux-kernel@vger.kernel.org
Message-ID: <20180329092822.KgJoS_hMlkyJU53Hn_ECKm2tAD4doS_VoMSLPPPWDiM@z>

This series addresses 2 issues that have been present in memset.S since
the initial git import(!).
The first patch addresses an issue when memset is called with a size
less than the size of a long (4 bytes on 32bit, 8 bytes on 64bit). There
is no fixup handler provided for the byte store loop, meaning that if
the access triggers a page fault, rather than being fixup up, the kernel
OOPS'. A secondary issue is also addressed here, that when EVA support
was added by commit fd9720e96e85 ("MIPS: lib: memset: Add EVA support
for the __bzero function."), this small memset was not changed. Hence
kernel mode addressing is always used and if the userspace address being
stored to overlaps kernel, then some potentially critical kernel data is
overwritten.

The second patch addresses an issue found while debugging the first.
clear_user() is specified to return the number of bytes that could not be
cleared. After the first patch, this is now done for sizes 0-3, but
sizes 4-63 would return garbage. This was tracked down to an error in
reusing the t1 register meaning it no longer contained the expected
value in the fault handler, and the fault handler erroneously masking
off the lower bits of the result.

The following test code was used to verify the behavior.

  int j, k;
  for (j = 0; j < 512; j++) {
    if ((k = clear_user(NULL, j)) != j) {
       pr_err("clear_user (NULL %d) returned %d\n", j, k);
    }
  }

Without patch 1, an OOPS is triggered by the first iteration. Without
the second patch, j = 4..63 returns garbage.

Applies on v4.16-rc7
Tested on MIPS creator ci40 (MIPS32) and Cavium Octeon II (MIPS64).



Matt Redfearn (2):
  MIPS: memset.S: EVA & fault support for small_memset
  MIPS: memset.S: Fix return of __clear_user from Lpartial_fixup

 arch/mips/lib/memset.S | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

-- 
2.7.4
