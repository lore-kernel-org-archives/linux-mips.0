Received: from mailapp01.imgtec.com ([195.59.15.196]:52822 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27008792AbbIVTJUClyqP (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 22 Sep 2015 21:09:20 +0200
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 0/2] MAAR SMP fix
Date: Tue, 22 Sep 2015 12:08:46 -0700
Message-ID: <1442948929-15862-1-git-send-email-paul.burton@imgtec.com>
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
Cc: Paul Burton <paul.burton@imgtec.com>, Rusty Russell <rusty@rustcorp.com.au>, "Steven J. Hill" <Steven.Hill@imgtec.com>, Bjorn Helgaas <bhelgaas@google.com>, David Hildenbrand <dahi@linux.vnet.ibm.com>, Andrew Bresticker <abrestic@chromium.org>, linux-kernel@vger.kernel.org, Aaro Koskinen <aaro.koskinen@iki.fi>, James Hogan <james.hogan@imgtec.com>, Markos Chandras <markos.chandras@imgtec.com>, Ingo Molnar <mingo@kernel.org>, Ralf Baechle <ralf@linux-mips.org>, Alex Smith <alex.smith@imgtec.com>, "Peter Zijlstra (Intel)" <peterz@infradead.org>
Message-ID: <20150922190846.nu4_iOiqwmVILKNKy5ETmaybhzUpnpHxsIpPxaN3q2w@z>

This series improves support for Memory Accessibility Attribute
Registers (MAARs) by printing their configuration during boot and by
applying the configuration to secondary CPUs, which have their own
independent MAAR state.

Paul Burton (2):
  MIPS: print MAAR configuration during boot
  MIPS: initialise MAARs on secondary CPUs

 arch/mips/include/asm/maar.h |  9 +++++++
 arch/mips/kernel/smp.c       |  2 ++
 arch/mips/mm/init.c          | 57 +++++++++++++++++++++++++++++++++++++++++---
 3 files changed, 65 insertions(+), 3 deletions(-)

-- 
2.5.3
