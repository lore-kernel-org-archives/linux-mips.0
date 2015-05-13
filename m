Received: from mailapp01.imgtec.com ([195.59.15.196]:3317 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27013241AbbEMPUczJxvX (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 13 May 2015 17:20:32 +0200
From: James Hogan <james.hogan@imgtec.com>
Subject: [PATCH 0/2] MIPS: cpu: Clean up MIPS_CPU_* definitions
Date: Wed, 13 May 2015 16:17:12 +0100
Message-ID: <1431530234-32460-1-git-send-email-james.hogan@imgtec.com>
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
To: Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org
Cc: James Hogan <james.hogan@imgtec.com>, Markos Chandras <markos.chandras@imgtec.com>
Message-ID: <20150513151712.T6E5ahB3Td-mIosx8vmubUmL2TBVbNvKRa8K9bNYgjw@z>

The MIPS_CPU_* definitions are a conflict hotspot, particularly error
prone, and getting increasingly ugly now there are more than 32 of them.

This patchset cleans them up to use shifts instead of hex literals.

James Hogan (2):
  MIPS: cpu: Alter MIPS_CPU_* definitions to fill gap
  MIPS: cpu: Convert MIPS_CPU_* defs to (1ull << x)

 arch/mips/include/asm/cpu.h | 70 ++++++++++++++++++++++-----------------------
 1 file changed, 35 insertions(+), 35 deletions(-)

Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: Markos Chandras <markos.chandras@imgtec.com>
Cc: linux-mips@linux-mips.org
-- 
2.3.6
