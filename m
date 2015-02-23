Received: from mailapp01.imgtec.com ([195.59.15.196]:15188 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27006904AbbBWIV5f0fVj (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 23 Feb 2015 09:21:57 +0100
Received: from KLMAIL01.kl.imgtec.org (unknown [192.168.5.35])
        by Websense Email Security Gateway with ESMTPS id A955A2B67CA87
        for <linux-mips@linux-mips.org>; Mon, 23 Feb 2015 08:21:50 +0000 (GMT)
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH 0/2] EVA fixes
Date: Mon, 23 Feb 2015 08:21:34 +0000
Message-ID: <1424679696-19696-1-git-send-email-markos.chandras@imgtec.com>
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
Message-ID: <20150223082134.nBDVdVDelFXovkCVxaPcXp1KBOedbeUt1mlpmhcFEGI@z>

Hi,

These two patches fix unaligned accesses when EVA is enabled. The fixes
CC stable as well, because they need to be applied all the way back to
the 3.15 kernels where EVA was originally introduced.

Markos Chandras (2):
  MIPS: asm: asm-eva: Introduce kernel load/store variants
  MIPS: unaligned: Prevent EVA instructions on kernel unaligned accesses

 arch/mips/include/asm/asm-eva.h | 137 +++++++++++++++++++++-----------
 arch/mips/kernel/unaligned.c    | 170 ++++++++++++++++++++++------------------
 2 files changed, 186 insertions(+), 121 deletions(-)

-- 
2.3.0
