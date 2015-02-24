Received: from mailapp01.imgtec.com ([195.59.15.196]:59615 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27007137AbbBXPZ2GCmkw (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 24 Feb 2015 16:25:28 +0100
From: Daniel Sanders <daniel.sanders@imgtec.com>
Subject: [PATCH v2 0/4] MIPS: LLVMLinux: Patches to enable compilation of a working kernel for MIPS using Clang/LLVM
Date: Tue, 24 Feb 2015 15:25:07 +0000
Message-ID: <1424791511-11407-1-git-send-email-daniel.sanders@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Daniel.Sanders@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
Cc: Daniel Sanders <daniel.sanders@imgtec.com>, Toma Tabacu <toma.tabacu@imgtec.com>, "Steven J. Hill" <Steven.Hill@imgtec.com>, Andreas Herrmann <andreas.herrmann@caviumnetworks.com>, Andrew Morton <akpm@linux-foundation.org>, Christoph Lameter <cl@linux.com>, David Daney <david.daney@cavium.com>, David Rientjes <rientjes@google.com>, Jim Quinlan <jim2101024@gmail.com>, Joonsoo Kim <iamjoonsoo.kim@lge.com>, Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>, Manuel Lauss <manuel.lauss@gmail.com>, Markos Chandras <markos.chandras@imgtec.com>, Paul Bolle <pebolle@tiscali.nl>, Paul Burton <paul.burton@imgtec.com>, Pekka Enberg <penberg@kernel.org>, Ralf Baechle <ralf@linux-mips.org>, linux-kernel@vger.kernel.org, linux-mips@linux-mips.org, linux-mm@kvack.org
Message-ID: <20150224152507.GCJ8kecDJtNvE81rLr2m_0bI1HyFYfKOElay8tvrIRc@z>

When combined with 'MIPS: Changed current_thread_info() to an equivalent ...'
(http://www.linux-mips.org/archives/linux-mips/2015-01/msg00070.html) and the
target independent LLVMLinux patches, this patch series makes it possible to
compile a working kernel for MIPS using Clang.

The patches aren't inter-dependent so they can be merged individually or I can
split the series into individual submissions if that's preferred.

Daniel Sanders (2):
  slab: Correct size_index table before replacing the bootstrap
    kmem_cache_node.
  MIPS: LLVMLinux: Fix an 'inline asm input/output type mismatch' error.

Toma Tabacu (2):
  MIPS: LLVMLinux: Fix a 'cast to type not present in union' error.
  MIPS: LLVMLinux: Silence variable self-assignment warnings.

This series previously included a 5th patch ('MIPS: LLVMLinux: Silence unicode
warnings when preprocessing assembly.'. This patch has been dropped from this
series while we work on preventing the warnings in a different way.

 arch/mips/include/asm/checksum.h |  6 ++++--
 arch/mips/kernel/branch.c        |  6 ++++--
 arch/mips/math-emu/dp_add.c      |  5 -----
 arch/mips/math-emu/dp_sub.c      |  5 -----
 arch/mips/math-emu/sp_add.c      |  5 -----
 arch/mips/math-emu/sp_sub.c      |  5 -----
 mm/slab.c                        |  1 +
 mm/slab.h                        |  1 +
 mm/slab_common.c                 | 36 +++++++++++++++++++++---------------
 mm/slub.c                        |  1 +
 10 files changed, 32 insertions(+), 39 deletions(-)

Signed-off-by: Toma Tabacu <toma.tabacu@imgtec.com>
Signed-off-by: Daniel Sanders <daniel.sanders@imgtec.com>
Cc: "Steven J. Hill" <Steven.Hill@imgtec.com>
Cc: Andreas Herrmann <andreas.herrmann@caviumnetworks.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Christoph Lameter <cl@linux.com>
Cc: David Daney <david.daney@cavium.com>
Cc: David Rientjes <rientjes@google.com>
Cc: Jim Quinlan <jim2101024@gmail.com>
Cc: Joonsoo Kim <iamjoonsoo.kim@lge.com>
Cc: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>
Cc: Manuel Lauss <manuel.lauss@gmail.com>
Cc: Markos Chandras <markos.chandras@imgtec.com>
Cc: Paul Bolle <pebolle@tiscali.nl>
Cc: Paul Burton <paul.burton@imgtec.com>
Cc: Pekka Enberg <penberg@kernel.org>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-kernel@vger.kernel.org
Cc: linux-mips@linux-mips.org
Cc: linux-mm@kvack.org

-- 
2.1.4
