Received: from dns1.mips.com ([12.201.5.69]:48608 "EHLO dns1.mips.com"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S1903657Ab1KVD3H (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Tue, 22 Nov 2011 04:29:07 +0100
From: Deng-Cheng Zhu <dczhu@mips.com>
Subject: [PATCH v2 0/5] MIPS/Perf-events & perf: Event init related fixes
Date: Tue, 22 Nov 2011 11:28:44 +0800
Message-ID: <1321932528-21098-1-git-send-email-dczhu@mips.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
Return-Path: <linux-mips-bounce@linux-mips.org>
To: ralf@linux-mips.org, linux-mips@linux-mips.org
Cc: eyal@mips.com, zenon@mips.com, Deng-Cheng Zhu <dczhu@mips.com>
Message-ID: <20111122032844.Dzi5VOwBeX_DMKMsDac0JZStFczc8VupAC6FVYkT19Q@z>

As patch names suggest, this series contains various fixes for event init,
in especial, event state related fixes.

Changes:
v2 - v1:
o Patch series name changed from "MIPS/Perf-events: Functional fixes and
  cleanups".
o Instead of updating the map of unsupported events for 74K, don't do
  validation on raw events for all cores.
o Remove pmu and event state checking in validate_event(), and in fact,
  replace this funciton with counter allocation.
o Enable siblings (those marked enable-on-exec) when group leader is
  enabled on exec.

Deng-Cheng Zhu (5):
  MIPS/Perf-events: Don't do validation on raw events
  MIPS/Perf-events: Remove erroneous check on active_events
  MIPS/Perf-events: Remove pmu and event state checking in
    validate_event()
  MIPS/Perf-events: Cleanup event->destroy at event init
  perf: Enable applicable siblings when group leader is enable-on-exec

 arch/mips/kernel/perf_event_mipsxx.c |   72 +++++----------------------------
 kernel/events/core.c                 |    3 +
 2 files changed, 14 insertions(+), 61 deletions(-)
