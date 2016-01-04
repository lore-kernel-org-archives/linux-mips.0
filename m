Received: from mailapp01.imgtec.com ([195.59.15.196]:18233 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27009750AbcADU32vOAsQ (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 4 Jan 2016 21:29:28 +0100
From: James Hogan <james.hogan@imgtec.com>
Subject: [PATCH backport v3.15..v4.1 0/2] MIPS: uaccess: EVA fixes
Date: Mon, 4 Jan 2016 20:29:02 +0000
Message-ID: <1451939344-21557-1-git-send-email-james.hogan@imgtec.com>
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
To: stable@vger.kernel.org
Cc: James Hogan <james.hogan@imgtec.com>, Ralf Baechle <ralf@linux-mips.org>, Markos Chandras <markos.chandras@imgtec.com>, Paul Burton <paul.burton@imgtec.com>, Leonid Yegoshin <leonid.yegoshin@imgtec.com>, linux-mips@linux-mips.org
Message-ID: <20160104202902.Itz9Wt6TzXH25IRT5CZ4uxVkPDLUcWNdUGVgRyrQwcA@z>

These two backports fix bugs in the MIPS uaccess functions for MIPS
Enhanced Virtual Addressing (EVA), which were added in v3.15.

The upstream commits don't work directly when applied to kernels older
than v4.2 where the eva_kernel_access() function was introduced, so we
instead use segment_eq() directly, along with config_enabled(CONFIG_EVA)
where necessary to avoid module symbol errors.

James Hogan (2):
  MIPS: uaccess: Take EVA into account in __copy_from_user()
  MIPS: uaccess: Take EVA into account in [__]clear_user

 arch/mips/include/asm/uaccess.h | 44 +++++++++++++++++++++++++++++------------
 arch/mips/kernel/mips_ksyms.c   |  2 ++
 arch/mips/lib/memset.S          |  2 ++
 3 files changed, 35 insertions(+), 13 deletions(-)

Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: Markos Chandras <markos.chandras@imgtec.com>
Cc: Paul Burton <paul.burton@imgtec.com>
Cc: Leonid Yegoshin <leonid.yegoshin@imgtec.com>
Cc: linux-mips@linux-mips.org
-- 
2.4.10
