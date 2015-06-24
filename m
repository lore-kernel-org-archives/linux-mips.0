Received: from mailapp01.imgtec.com ([195.59.15.196]:27723 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27006697AbbFXIwQGF0vx (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 24 Jun 2015 10:52:16 +0200
Received: from KLMAIL01.kl.imgtec.org (unknown [192.168.5.35])
        by Websense Email Security Gateway with ESMTPS id B9F88749E7447
        for <linux-mips@linux-mips.org>; Wed, 24 Jun 2015 09:52:08 +0100 (IST)
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH 0/2] Branch emulation fixes for MIPS R6
Date: Wed, 24 Jun 2015 09:51:59 +0100
Message-ID: <1435135921-7090-1-git-send-email-markos.chandras@imgtec.com>
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
Message-ID: <20150624085159.9WcQta5iGFGEwYgZh-dZGdfYQGZdZ8SYGsbsZ0zlgcU@z>

Hi,

A few fixes for MIPS R6 branch and jump instruction emulation.

Markos Chandras (2):
  MIPS: Fix branch emulation for BLTC and BGEC instructions
  MIPS: Fix erroneous JR emulation for MIPS R6

 arch/mips/kernel/branch.c   | 4 ++--
 arch/mips/math-emu/cp1emu.c | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

-- 
2.4.4
