Received: from mailapp01.imgtec.com ([195.59.15.196]:11994 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27008792AbbIVS3eVI0UP (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 22 Sep 2015 20:29:34 +0200
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 0/3] MIPS GIC fixes
Date: Tue, 22 Sep 2015 11:29:08 -0700
Message-ID: <1442946551-27893-1-git-send-email-paul.burton@imgtec.com>
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
Cc: Paul Burton <paul.burton@imgtec.com>, linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, James Hogan <james.hogan@imgtec.com>, Markos Chandras <markos.chandras@imgtec.com>, Ralf Baechle <ralf@linux-mips.org>, Marc Zyngier <marc.zyngier@arm.com>
Message-ID: <20150922182908.qTO9aM_DYHksAbsFNxUhsJTxzPKURPr88AJppjxlAis@z>

This series fixes a couple of problems with the MIPS GIC support,
impacting systems with the 64 bit CM3 and those with multithreading and
non-contiguous numbering for VP(E)s across cores.

Paul Burton (3):
  MIPS: CM: provide a function to map from CPU to VP ID
  irqchip: mips-gic: convert CPU numbers to VP IDs
  irqchip: mips-gic: fix pending & mask reads for MIPS64 with 32b GIC

 arch/mips/include/asm/mips-cm.h | 39 +++++++++++++++++++++++++++++++++++++++
 drivers/irqchip/irq-mips-gic.c  | 12 ++++++++++--
 2 files changed, 49 insertions(+), 2 deletions(-)

-- 
2.5.3
