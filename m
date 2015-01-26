Received: from mailapp01.imgtec.com ([195.59.15.196]:59407 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27011068AbbAZJkpmXdnS (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 26 Jan 2015 10:40:45 +0100
Received: from KLMAIL01.kl.imgtec.org (unknown [192.168.5.35])
        by Websense Email Security Gateway with ESMTPS id 6B95E13B4ED76
        for <linux-mips@linux-mips.org>; Mon, 26 Jan 2015 09:40:38 +0000 (GMT)
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH 0/3 3.19] HTW fixes
Date: Mon, 26 Jan 2015 09:40:33 +0000
Message-ID: <1422265236-29290-1-git-send-email-markos.chandras@imgtec.com>
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
Message-ID: <20150126094033.zoeKc5YKypmYOqvo6bG3h051U4h92M0UHd-ZBh9JgiE@z>

Hi,
	
A few HTW fixes for 3.19 and stable branches.

Markos Chandras (3):
  MIPS: asm: pgtable: Add c0 hazards on HTW start/stop sequences
  MIPS: HTW: Prevent accidental HTW start due to nested htw_{start,stop}
  MIPS: asm: pgtable: Prevent HTW race when updating PTEs

 arch/mips/include/asm/cpu-info.h    |  5 +++++
 arch/mips/include/asm/mmu_context.h |  7 ++++++-
 arch/mips/include/asm/pgtable.h     | 37 ++++++++++++++++++++++---------------
 arch/mips/kernel/cpu-probe.c        |  4 +++-
 4 files changed, 36 insertions(+), 17 deletions(-)

-- 
2.2.2
