Received: from mailapp01.imgtec.com ([195.59.15.196]:12604 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27036490AbcE0VZjCv07r (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 27 May 2016 23:25:39 +0200
From: James Hogan <james.hogan@imgtec.com>
Subject: [PATCH 0/2] MIPS: Fix 64-bit HTW configuration
Date: Fri, 27 May 2016 22:25:21 +0100
Message-ID: <1464384323-4520-1-git-send-email-james.hogan@imgtec.com>
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
Cc: James Hogan <james.hogan@imgtec.com>, Paul Burton <paul.burton@imgtec.com>, linux-mips@linux-mips.org
Message-ID: <20160527212521.MehP-AkdXM_xjh5UFyJpBitvrySD9MX9iG5Rd6v5Xro@z>

These patches fix the configuration of the Hardware page Table Walker
(HTW) by 64-bit kernels. This is believed to currently only affect P6600
which is only supported in mainline since the 4.7 merge window.

James Hogan (2):
  MIPS: Add 64-bit HTW fields
  MIPS: Fix 64-bit HTW configuration

 arch/mips/include/asm/mipsregs.h |  8 ++++++++
 arch/mips/mm/tlbex.c             | 22 ++++++++++++++++++----
 2 files changed, 26 insertions(+), 4 deletions(-)

Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: Paul Burton <paul.burton@imgtec.com>
Cc: linux-mips@linux-mips.org
-- 
2.4.10
