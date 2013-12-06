Received: from multi.imgtec.com ([194.200.65.239]:31728 "EHLO multi.imgtec.com"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S6816022Ab3LFLBeLhh5H (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Fri, 6 Dec 2013 12:01:34 +0100
From: Qais Yousef <qais.yousef@imgtec.com>
Subject: [PATCH 0/4] sead3 DT improvements
Date: Fri, 6 Dec 2013 11:00:41 +0000
Message-ID: <1386327645-17571-1-git-send-email-qais.yousef@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Qais.Yousef@imgtec.com>
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
Cc: Qais Yousef <qais.yousef@imgtec.com>
Message-ID: <20131206110041.0WY28nEcE9dmFSxx4qBYIbpkMhO2fjy-2_C7H2kwum0@z>

This series adds some improvements to sead3 DT handling.
patch 1 uses libfdt to change the built-in DT memory size if the bootloader
        passes memsize parameter or sets it in its environment.
patch 2 removes the chosen node from DT to let the bootloader parameter define
        the bootargs as it pleases.
patch 3 adds the init function to populate platform device from device tree
patch 4 uses unflatten_and_copy_device_tree() to move the DT to non init memory

Qais Yousef (4):
  sead3-setup: allow cmdline/env to change memory size using memsize
    param
  sead3: remove chosen node
  sead3: populate platform devices from device tree
  sead3: use unflatten_and_copy_device_tree()

 arch/mips/Kconfig                 |    1 +
 arch/mips/mti-sead3/Makefile      |    2 +
 arch/mips/mti-sead3/sead3-setup.c |   84 +++++++++++++++++++++++++++++++++----
 arch/mips/mti-sead3/sead3.dts     |    4 --
 4 files changed, 78 insertions(+), 13 deletions(-)
