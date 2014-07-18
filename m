Received: from mailapp01.imgtec.com ([195.59.15.196]:16320 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S6861344AbaGRJvpt-Wmr (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 18 Jul 2014 11:51:45 +0200
Received: from KLMAIL01.kl.imgtec.org (unknown [192.168.5.35])
        by Websense Email Security Gateway with ESMTPS id 7D31C9C2AC2CA
        for <linux-mips@linux-mips.org>; Fri, 18 Jul 2014 10:51:36 +0100 (IST)
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH 0/4] Add pgprot_writecombine function for MIPS
Date: Fri, 18 Jul 2014 10:51:29 +0100
Message-ID: <1405677093-22591-1-git-send-email-markos.chandras@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Markos.Chandras@imgtec.com>
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
Cc: Markos Chandras <markos.chandras@imgtec.com>
Message-ID: <20140718095129.Xep4wotcMxM7_tvPVA__kIbyRV0R-jNeajb35kEgUKw@z>

Hi,

This patchset implements the pgprot_writecombine function for MIPS

Markos Chandras (4):
  MIPS: pgtable-bits: Move the CCA bits out of the core's ifdef blocks
  MIPS: pgtable-bits: Define the CCA bit for WC writes on Ingenic cores
  MIPS: cpu-probe: Set the write-combine CCA value on per core basis
  MIPS: pgtable.h: Implement the pgprot_writecombine function for MIPS

 arch/mips/include/asm/cpu-info.h     |  5 ++++
 arch/mips/include/asm/pgtable-bits.h | 44 ++++++++++++++++++++++++------------
 arch/mips/include/asm/pgtable.h      | 10 ++++++++
 arch/mips/kernel/cpu-probe.c         | 21 +++++++++++++++++
 4 files changed, 65 insertions(+), 15 deletions(-)

-- 
2.0.0
