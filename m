Received: from dns1.mips.com ([12.201.5.69]:55724 "EHLO dns1.mips.com"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S1491062Ab1JXK40 (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Mon, 24 Oct 2011 12:56:26 +0200
From: Deng-Cheng Zhu <dczhu@mips.com>
Subject: [PATCH 0/4] MIPS/Perf-events: Functional fixes and cleanups
Date: Mon, 24 Oct 2011 18:55:58 +0800
Message-ID: <1319453762-12962-1-git-send-email-dczhu@mips.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
Return-Path: <linux-mips-bounce@linux-mips.org>
To: linux-mips@linux-mips.org, ralf@linux-mips.org
Cc: Deng-Cheng Zhu <dczhu@mips.com>
Message-ID: <20111024105558.MyVVVESR19V9PyUkpgvqmojAIFjopKRJ69pxZ8vemBk@z>

As patch names suggest, this series contains various fixes and does a
slight cleanup.

Deng-Cheng Zhu (4):
  MIPS/Perf-events: update the map of unsupported events for 74K
  MIPS/Perf-events: remove erroneous check on active_events
  MIPS/Perf-events: temporarily connect event to its pmu at event init
  MIPS/Perf-events: Cleanup event->destroy at event init

 arch/mips/kernel/perf_event.c        |   11 +---------
 arch/mips/kernel/perf_event_mipsxx.c |   35 ++++++++++++++++++++++++---------
 2 files changed, 26 insertions(+), 20 deletions(-)
