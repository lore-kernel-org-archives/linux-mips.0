Received: from mailapp01.imgtec.com ([195.59.15.196]:62806 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27008556AbbIVR1JBYMaU (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 22 Sep 2015 19:27:09 +0200
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 0/5] CM error report fixes
Date: Tue, 22 Sep 2015 10:26:36 -0700
Message-ID: <1442942801-2883-1-git-send-email-paul.burton@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Paul.Burton@imgtec.com>
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
Cc: Paul Burton <paul.burton@imgtec.com>, linux-kernel@vger.kernel.org, James Hogan <james.hogan@imgtec.com>, Markos Chandras <markos.chandras@imgtec.com>, Ralf Baechle <ralf@linux-mips.org>
Message-ID: <20150922172636.UdocjjG4thiyRBhGU2iIfQqjlNjXqe2yVpt_Qe7iujc@z>

This series fixes a few problems with support for the CM, in particular
relating to CM3 which has a 64 bit interface to the core. These issues
prevented reporting of CM errors (useful debug output when tracking the
source of a bus error) in some situations, and could cause further
exceptions.

Paul Burton (5):
  MIPS: clarify mips_cm_is64 documentation
  MIPS: don't read GCRs when a CM is not present
  MIPS: avoid buffer overrun in mips_cm_error_report
  MIPS: allow read64 GCR accessors to work on MIPS32 kernels
  MIPS: always read full 64 bit CM error GCRs for CM3

 arch/mips/include/asm/mips-cm.h | 27 ++++++++++++----
 arch/mips/kernel/mips-cm.c      | 71 ++++++++++++++++++++++-------------------
 2 files changed, 59 insertions(+), 39 deletions(-)

-- 
2.5.3
