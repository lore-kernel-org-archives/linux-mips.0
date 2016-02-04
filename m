Received: from mailapp01.imgtec.com ([195.59.15.196]:34526 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27012624AbcBDNF3fUw0l (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 4 Feb 2016 14:05:29 +0100
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH v2 0/4] Support new MIPSr6 relocations
Date: Thu, 4 Feb 2016 13:05:01 +0000
Message-ID: <1454591105-11841-1-git-send-email-paul.burton@imgtec.com>
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
To: linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>
Cc: Paul Burton <paul.burton@imgtec.com>, Andrey Konovalov <adech.fo@gmail.com>, "Steven J. Hill" <Steven.Hill@imgtec.com>, Andrey Ryabinin <ryabinin.a.a@gmail.com>, Alex Smith <alex.smith@imgtec.com>, Kees Cook <keescook@chromium.org>, linux-kernel@vger.kernel.org, James Hogan <james.hogan@imgtec.com>, Markos Chandras <markos.chandras@imgtec.com>, "Maciej W. Rozycki" <macro@imgtec.com>, Andrew Morton <akpm@linux-foundation.org>
Message-ID: <20160204130501.2GEserD5gvc3Wh3RKXU4IUrJWS2tT64qbKGEtjnMr4w@z>

MIPSr6 introduced a few new relocations that may be present in loadable
kernel modules. This series introduces support for them in both their
rel & rela forms for MIPS32 & MIPS64 kernels respectively, and ensures
that any future missing relocs cause module loading to fail gracefully.

Paul Burton (3):
  MIPS: Bail on unsupported module relocs
  MIPS: Support R_MIPS_PC{21,26} rela-style relocs
  MIPS: Support R_MIPS_PC{16,21,26} rel-style relocs

Steven J. Hill (1):
  MIPS: module: Make consistent use of pr_*()

 arch/mips/include/asm/elf.h    |  5 +++
 arch/mips/kernel/module-rela.c | 75 +++++++++++++++++++++++++++++++++++-----
 arch/mips/kernel/module.c      | 77 +++++++++++++++++++++++++++++++++++++-----
 3 files changed, 140 insertions(+), 17 deletions(-)

-- 
2.7.0
