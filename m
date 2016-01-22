Received: from mailapp01.imgtec.com ([195.59.15.196]:62167 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27009517AbcAVK6nzOyqh (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 22 Jan 2016 11:58:43 +0100
From: James Hogan <james.hogan@imgtec.com>
Subject: [PATCH 0/2] MIPS: I6400: Avoid dcache flushes
Date: Fri, 22 Jan 2016 10:58:24 +0000
Message-ID: <1453460306-8505-1-git-send-email-james.hogan@imgtec.com>
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
To: Ralf Baechle <ralf@linux-mips.org>
Cc: Manuel Lauss <manuel.lauss@gmail.com>, James Hogan <james.hogan@imgtec.com>, Leonid Yegoshin <leonid.yegoshin@imgtec.com>, linux-mips@linux-mips.org
Message-ID: <20160122105824.Zqr3qe-eyK6cL1Fur0KO5UC2QsbIrUes75Yvmm9Agcg@z>

These patches allow I6400 core to avoid dcache flushes when making
recently modified data available to icache.

I6400 effectively can fill icache from dirty dcache contents, which
means cpu_has_ic_fills_f_dc can evaluate to true (see patch 2).

However there are a couple of bugs in the cache handling when
cpu_has_ic_fills_f_dc, which need fixing first (see patch 1). That the
CPU fills icache from dcache does not imply that the icache is coherent
with dcache. Stale lines still need flushing from the icache, even if
lines in the dcache don't need writing back first.

James Hogan (2):
  MIPS: c-r4k: Sync icache when it fills from dcache
  MIPS: I6400: Icache fills from dcache

 arch/mips/mm/c-r4k.c | 12 ++++++++++--
 arch/mips/mm/init.c  |  2 +-
 2 files changed, 11 insertions(+), 3 deletions(-)

Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: Leonid Yegoshin <leonid.yegoshin@imgtec.com>
Cc: Manuel Lauss <manuel.lauss@gmail.com>
Cc: linux-mips@linux-mips.org
-- 
2.4.10
