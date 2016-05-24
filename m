Received: from mailapp01.imgtec.com ([195.59.15.196]:28786 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27029896AbcEXIf3voemX (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 24 May 2016 10:35:29 +0200
From: James Hogan <james.hogan@imgtec.com>
Subject: [PATCH 0/2] MIPS: VDSO / microMIPS fixes
Date: Tue, 24 May 2016 09:35:09 +0100
Message-ID: <1464078911-21468-1-git-send-email-james.hogan@imgtec.com>
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
Cc: James Hogan <james.hogan@imgtec.com>, Paul Burton <paul.burton@imgtec.com>, linux-mips@linux-mips.org, stable@vger.kernel.org
Message-ID: <20160524083509.EBz3el8jtTWIeCMpqHDarHbsPQO9nJq1hZpJuU7sQjA@z>

These patches fix breakage on microMIPS kernels caused by commit
ebb5e78cc634 ("MIPS: Initial implementation of a VDSO") in v4.4.

The first patch drops stale microMIPS handling code when setting up
sigreturn which was causing serious breakage.

The second patch causes the VDSO to be built for microMIPS on microMIPS
kernels, which should avoid breakage on microMIPS only cores.

James Hogan (2):
  MIPS: Fix sigreturn via VDSO on microMIPS kernel
  MIPS: Build microMIPS VDSO for microMIPS kernels

 arch/mips/kernel/signal.c | 8 --------
 arch/mips/vdso/Makefile   | 1 +
 2 files changed, 1 insertion(+), 8 deletions(-)

Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: Paul Burton <paul.burton@imgtec.com>
Cc: linux-mips@linux-mips.org
Cc: <stable@vger.kernel.org>
-- 
2.4.10
