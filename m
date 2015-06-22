Received: from mailapp01.imgtec.com ([195.59.15.196]:21666 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27006587AbbFVLV06qRg3 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 22 Jun 2015 13:21:26 +0200
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH v3 0/3] MSA unaligned memory access support
Date: Mon, 22 Jun 2015 12:20:57 +0100
Message-ID: <1434972060-8865-1-git-send-email-paul.burton@imgtec.com>
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
Cc: Paul Burton <paul.burton@imgtec.com>, "Steven J. Hill" <Steven.Hill@imgtec.com>, Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>, "Maciej W. Rozycki" <macro@linux-mips.org>, linux-kernel@vger.kernel.org, Jie Chen <chenj@lemote.com>, Huacai Chen <chenhc@lemote.com>, James Hogan <james.hogan@imgtec.com>, Markos Chandras <markos.chandras@imgtec.com>, Ralf Baechle <ralf@linux-mips.org>, Manuel Lauss <manuel.lauss@gmail.com>
Message-ID: <20150622112057.MsdmsONxOnbxRHw9Mu6LZ5Bp8obC6dUITvV4SgdHOxQ@z>

This series supercedes the patch "MIPS: MSA: misaligned support"
previously submitted by Leonid, and pretty much rewrites the support for
emulating non-16byte-aligned MSA vector memory accesses introduced there.

The series applies atop v4.1.

Thanks,
    Paul

Leonid Yegoshin (2):
  MIPS: declare MSA MI10 instruction formats
  MIPS: MSA unaligned memory access support

Paul Burton (1):
  MIPS: introduce accessors for MSA vector registers

 arch/mips/include/asm/asmmacro.h  | 114 ++++++++++++++++++++++++++++++++++++++
 arch/mips/include/asm/msa.h       |  80 ++++++++++++++++++++++++++
 arch/mips/include/uapi/asm/inst.h |  31 ++++++++++-
 arch/mips/kernel/r4k_fpu.S        |  67 ++++++++++++++++++++++
 arch/mips/kernel/unaligned.c      |  72 ++++++++++++++++++++++++
 5 files changed, 363 insertions(+), 1 deletion(-)

-- 
2.4.2
