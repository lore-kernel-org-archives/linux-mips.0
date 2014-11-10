Received: from mailapp01.imgtec.com ([195.59.15.196]:33583 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27006150AbaKJQUOt1jqx (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 10 Nov 2014 17:20:14 +0100
Received: from KLMAIL01.kl.imgtec.org (unknown [192.168.5.35])
        by Websense Email Security Gateway with ESMTPS id 6924A4C1E7A88
        for <linux-mips@linux-mips.org>; Mon, 10 Nov 2014 16:20:06 +0000 (GMT)
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH 0/3] Machine Check exception improvements
Date: Mon, 10 Nov 2014 16:20:01 +0000
Message-ID: <1415636404-11979-1-git-send-email-markos.chandras@imgtec.com>
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
Message-ID: <20141110162001.e4Ld842ZH5LE2coVpayTPvupv0tj6Fca9ihcCRQ4chM@z>

Hi,

This patchset adds some additional information to the machine check
exception handler. It prints the wired and pagegrain registers as well
as the HTW registers if the core supports it. It also replaces all
the printk statements with pr_info().

Markos Chandras (3):
  MIPS: kernel: traps: Replace printk with pr_info for MC exceptions
  MIPS: kernel: traps: Dump the HTW registers on a MC exception
  MIPS: kernel: traps: Dump the PageGrain and Wired registers on MC

 arch/mips/kernel/traps.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

-- 
2.1.3
