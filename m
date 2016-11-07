Received: from mailapp01.imgtec.com ([195.59.15.196]:59763 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23992100AbcKGLSXh8bHd (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 7 Nov 2016 12:18:23 +0100
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 0/7] MIPS: Standard calling convention usercopy & memcpy
Date: Mon, 7 Nov 2016 11:17:55 +0000
Message-ID: <20161107111802.12071-1-paul.burton@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Paul.Burton@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: linux-mips@linux-mips.org
Cc: Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@imgtec.com>
Message-ID: <20161107111755.s7ZHkX8p6sr8vItpM5SH0wGjwgGyaaTgD1Q1Dhjguh4@z>

This series makes the usercopy & memcpy functions follow the standard
calling convention, allowing us to clean up calls to them from
copy_{to,from}_user & variants such that they're just standard function
calls rather than inline assembly wrappers. This frees us from needing
to worry about performing long calls in modules, declaring the right
registers clobbered by the inline asm, retrieving results from
non-standard registers etc.

This series applies atop v4.9-rc4 with my "MIPS: Cleanup EXPORT_SYMBOL
usage" series applied first.


Paul Burton (7):
  MIPS: lib: Split lib-y to a line per file
  MIPS: lib: Implement memmove in C
  MIPS: memcpy: Split __copy_user & memcpy
  MIPS: memcpy: Return uncopied bytes from __copy_user*() in v0
  MIPS: memcpy: Use ta* instead of manually defining t4-t7
  MIPS: memcpy: Use a3/$7 for source end address
  MIPS: uaccess: Use standard __user_copy* function calls

 arch/mips/cavium-octeon/octeon-memcpy.S | 225 +++++++--------
 arch/mips/include/asm/uaccess.h         | 480 ++++++++------------------------
 arch/mips/lib/Makefile                  |  14 +-
 arch/mips/lib/memcpy.S                  | 198 +++++--------
 arch/mips/lib/memmove.c                 |  39 +++
 5 files changed, 324 insertions(+), 632 deletions(-)
 create mode 100644 arch/mips/lib/memmove.c

-- 
2.10.2
