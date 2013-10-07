Received: from multi.imgtec.com ([194.200.65.239]:62105 "EHLO multi.imgtec.com"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S6868732Ab3JGQpkCQR10 (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Mon, 7 Oct 2013 18:45:40 +0200
From: Deng-Cheng Zhu <dengcheng.zhu@imgtec.com>
Subject: [PATCH v2 0/2] MIPS: Cleanups for Malta PIIX4 PCI fixups
Date: Mon, 7 Oct 2013 09:45:03 -0700
Message-ID: <1381164305-28500-1-git-send-email-dengcheng.zhu@imgtec.com>
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
To: linux-mips@linux-mips.org, ralf@linux-mips.org
Cc: james.hogan@imgtec.com, paul.burton@imgtec.com, Steven.Hill@imgtec.com, Deng-Cheng Zhu <dengcheng.zhu@imgtec.com>
Message-ID: <20131007164503.bJJQ5VAxpDij1AbNj9Ze52sgOSnwOappO4mG42REfjw@z>

Use macro to replace hard-coded values for Malta PIIX4 PCI fixups. Put them
into piix4.h where redundant things are also removed in this patch series.

Changes:
----------
v2 - v1:
o Remove "#include <asm/mips-boards/piix4.h>" from malta-int.c.
----------

Deng-Cheng Zhu (2):
  MIPS: Get rid of hard-coded values for Malta PIIX4 fixups
  MIPS: Remove unused define's in piix4.h

 arch/mips/include/asm/mips-boards/piix4.h |   78 ++++++++---------------------
 arch/mips/mti-malta/malta-int.c           |    1 -
 arch/mips/pci/fixup-malta.c               |   36 +++++++++-----
 3 files changed, 45 insertions(+), 70 deletions(-)
