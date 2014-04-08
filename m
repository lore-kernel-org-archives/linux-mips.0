Received: from mailapp01.imgtec.com ([195.89.28.115]:47067 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S6821285AbaDHPI5Wx3wx (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 8 Apr 2014 17:08:57 +0200
Received: from KLMAIL01.kl.imgtec.org (unknown [192.168.5.35])
        by Websense Email Security Gateway with ESMTPS id 65A80CA4361F9
        for <linux-mips@linux-mips.org>; Tue,  8 Apr 2014 16:08:48 +0100 (IST)
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH 0/2] sead3 defconfig updates
Date: Tue, 8 Apr 2014 16:09:01 +0100
Message-ID: <1396969743-454-1-git-send-email-markos.chandras@imgtec.com>
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
Message-ID: <20140408150901.FdfX-MgLdrM1Spg51LbKrjhlShB5OnzUxFlDGptYCbM@z>

Hi,

This patchset regenerates the sead3 defconfigs and enables DEVTMPFS.

DEVTMPFS is already enabled on Malta defconfigs since
68f30ba7f8b9d666d1218eec97822ade0f23d9c3

Markos Chandras (2):
  MIPS: regenerate sead3 defconfigs
  MIPS: sead3: Enable DEVTMPFS

 arch/mips/configs/sead3_defconfig      | 2 +-
 arch/mips/configs/sead3micro_defconfig | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
1.9.1
