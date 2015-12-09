Received: from mail.windriver.com ([147.11.1.11]:42687 "EHLO
        mail.windriver.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27006152AbbLIDPot9Y-u (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 9 Dec 2015 04:15:44 +0100
From: <yanjiang.jin@windriver.com>
Subject: [PATCH] MIPS: oprofile: Fix a preemption issue
Date: Wed, 9 Dec 2015 11:15:26 +0800
Message-ID: <1449630927-14355-1-git-send-email-yanjiang.jin@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Yanjiang.Jin@windriver.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: rric@kernel.org, ralf@linux-mips.org
Cc: linux-mips@linux-mips.org, oprofile-list@lists.sf.net, yanjiang.jin@windriver.com, linux-kernel@vger.kernel.org, jinyanjiang@gmail.com
Message-ID: <20151209031526.IpdGC0FN_ZZxasjUSmTD4zbHHkvsBW4CPpGCMnP28kc@z>

From: Yanjiang Jin <yanjiang.jin@windriver.com>

Reproduction steps:
1. Build a MIPS BSP with CONFIG_OPROFILE=m, I am using Cavium's CN78XX board to test;
2. Boot the board;
3. modprobe oprofile in shell.


Yanjiang Jin (1):
  MIPS: oprofile: Fix a preemption issue

 arch/mips/oprofile/common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
1.9.1
