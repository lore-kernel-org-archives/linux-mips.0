Received: from mailapp01.imgtec.com ([195.59.15.196]:43545 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S6822197AbaGDKJJUrefi (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 4 Jul 2014 12:09:09 +0200
Received: from KLMAIL01.kl.imgtec.org (unknown [192.168.5.35])
        by Websense Email Security Gateway with ESMTPS id 3BBD389A99EBD
        for <linux-mips@linux-mips.org>; Fri,  4 Jul 2014 11:09:00 +0100 (IST)
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH 0/2] Add perf support for P5600
Date: Fri, 4 Jul 2014 11:08:55 +0100
Message-ID: <1404468537-8808-1-git-send-email-markos.chandras@imgtec.com>
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
Message-ID: <20140704100855.gum1kpCFGLP--CtSviPLsIQAFjuxUHVZpSAFnBMpVJQ@z>

Hi,

This patchset adds support for P5600 which uses 512 events compared
to traditional MIPS cores which use only 256.

This is based on v3.16-rc2

James Hogan (2):
  MIPS: perf: Allow for more perf events
  MIPS: perf: Add hardware events for P5600

 arch/mips/kernel/perf_event_mipsxx.c | 42 +++++++++++++++++++++++++++++-------
 1 file changed, 34 insertions(+), 8 deletions(-)

-- 
2.0.0
