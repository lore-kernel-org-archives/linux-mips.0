Received: from mailapp01.imgtec.com ([195.59.15.196]:9931 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27013285AbbEMMSKQS9-f (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 13 May 2015 14:18:10 +0200
From: James Hogan <james.hogan@imgtec.com>
Subject: [PATCH 0/2] MIPS: malta-time: Take seconds into account
Date: Wed, 13 May 2015 13:17:51 +0100
Message-ID: <1431519473-24049-1-git-send-email-james.hogan@imgtec.com>
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
Cc: James Hogan <james.hogan@imgtec.com>, Paul Burton <paul.burton@imgtec.com>, "Steven J. Hill" <Steven.Hill@imgtec.com>
Message-ID: <20150513121751.ocUeNOP7U_Oo2DxglbPd_C0IrHV1vNSIrIX17zs964I@z>

This patchset improves the robustness of the Malta timer frequencies
calculation, particularly under virtualisation on slow targets, where
the RTC UIP flag may not get noticed the first time.

James Hogan (2):
  MIPS: malta-time: Don't switch RTC to BCD mode
  MIPS: malta-time: Take seconds into account

 arch/mips/mti-malta/malta-time.c | 25 ++++++++++++++++++++++---
 1 file changed, 22 insertions(+), 3 deletions(-)

Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: Paul Burton <paul.burton@imgtec.com>
Cc: Steven J. Hill <Steven.Hill@imgtec.com>
Cc: linux-mips@linux-mips.org
-- 
2.3.6
