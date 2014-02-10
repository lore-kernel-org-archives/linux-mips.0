Received: from multi.imgtec.com ([194.200.65.239]:53094 "EHLO multi.imgtec.com"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S6825747AbaBJRtTZpCP0 (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Mon, 10 Feb 2014 18:49:19 +0100
From: Deng-Cheng Zhu <dengcheng.zhu@imgtec.com>
Subject: [PATCH 0/3] MIPS/Perf-events: Add support for Aptiv cores
Date: Mon, 10 Feb 2014 09:48:51 -0800
Message-ID: <1392054534-8678-1-git-send-email-dengcheng.zhu@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <DengCheng.Zhu@imgtec.com>
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
Cc: Markos.Chandras@imgtec.com, james.hogan@imgtec.com, Steven.Hill@imgtec.com, Deng-Cheng Zhu <dengcheng.zhu@imgtec.com>
Message-ID: <20140210174851.9r9k0YinjIr5mrqsFTBbMVaFHJNkV3o2htL6kS7FKjI@z>

The latest MIPS cores need to be added in perf-events.

Deng-Cheng Zhu (3):
  MIPS/Perf-events: Rename 74K event/cache maps in preparation for Aptiv
    support
  MIPS/Perf-events: Add proAptiv support
  MIPS/Perf-events: Add interAptiv support

 arch/mips/kernel/perf_event_mipsxx.c | 74 ++++++++++++++++++++++++++++++++----
 1 file changed, 66 insertions(+), 8 deletions(-)

-- 
1.8.5.3
