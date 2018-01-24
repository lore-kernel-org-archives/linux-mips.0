Received: from mail-qt0-x242.google.com ([IPv6:2607:f8b0:400d:c0d::242]:39801
        "EHLO mail-qt0-x242.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23992827AbeAXBkbW8ReZ (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 24 Jan 2018 02:40:31 +0100
From: Florian Fainelli <f.fainelli@gmail.com>
Subject: [PATCH 0/2] MIPS: generic dma-coherence.h inclusion
Date: Tue, 23 Jan 2018 17:40:08 -0800
Message-ID: <1516758010-7641-1-git-send-email-f.fainelli@gmail.com>
Return-Path: <f.fainelli@gmail.com>
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
Cc: jhogan@kernel.org, david.daney@cavium.com, paul.burton@mips.com, Florian Fainelli <f.fainelli@gmail.com>, Ralf Baechle <ralf@linux-mips.org>, Kevin Cernekee <cernekee@gmail.com>, Huacai Chen <chenhc@lemote.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>, Bart Van Assche <bart.vanassche@sandisk.com>, Doug Ledford <dledford@redhat.com>, open list <linux-kernel@vger.kernel.org>
Message-ID: <20180124014008.ypE6nBhnhHiWG4XrBcHEAEX2KC-ok_AgeFrGuKjgJwU@z>

Hi all,

This patch series does update mach-generic/dma-coherence.h to test whether a
machine is already defining any of the functions. This is aimed at avoiding the
need for every single platform to redefine its own functions, as well as make
us future proof in case we need to add new infrastructure, which I am about to.

Thanks

Florian Fainelli (2):
  MIPS: Allow including mach-generic/dma-coherence.h
  MIPS: Update dma-coherence.h files

 arch/mips/include/asm/mach-ath25/dma-coherence.h   | 10 +++++---
 arch/mips/include/asm/mach-bmips/dma-coherence.h   | 24 +++++--------------
 .../include/asm/mach-cavium-octeon/dma-coherence.h | 14 +++++++----
 arch/mips/include/asm/mach-generic/dma-coherence.h | 16 +++++++++++++
 arch/mips/include/asm/mach-ip27/dma-coherence.h    | 28 +++++-----------------
 arch/mips/include/asm/mach-ip32/dma-coherence.h    | 16 ++++++-------
 arch/mips/include/asm/mach-jazz/dma-coherence.h    | 24 ++++++-------------
 .../include/asm/mach-loongson64/dma-coherence.h    | 16 ++++++-------
 8 files changed, 67 insertions(+), 81 deletions(-)

-- 
2.7.4
