Received: from mail-fx0-f49.google.com ([209.85.161.49]:41896 "EHLO
        mail-fx0-f49.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S1493015Ab0LAQK1 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 1 Dec 2010 17:10:27 +0100
Subject: Subject: [RFC 0/3] VSMP support for msp71xx platforms
From: Anoop P A <anoop.pa@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 01 Dec 2010 21:43:11 +0530
Message-ID: <1291219991.31413.8.camel@paanoop1-desktop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-Path: <anoop.pa@gmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org, mcdonald.shane@gmail.com, "Kevin D. Kissell" <kevink@paralogos.com>
Message-ID: <20101201161311.v2QwVxJXP0yZvt4nsD82qRMFLmUPgwi_f2E6pCXvA4Q@z>

From 5bfd3ba210e521df2b493862446b4535bcdb0cdf Mon Sep 17 00:00:00 2001
Message-Id: <cover.1291219118.git.anoop.pa@gmail.com>
From: Anoop P A <anoop.pa@gmail.com>
Date: Wed, 1 Dec 2010 21:28:38 +0530
Subject: [RFC 0/3] VSMP support for msp71xx platforms
Cc: anoop.pa@gmail.com

Following series patches add VSMP support for MSP71xx series of SoC's.


Anoop P A (3):
  VSMP support for msp71xx family of platforms.
  SMP support MSP CIC and PER cascaded interrupt subsystem.
  VSMP support for MSP71xx family.

 arch/mips/pmc-sierra/msp71xx/Makefile      |    3 +-
 arch/mips/pmc-sierra/msp71xx/msp_irq.c     |   49 +++++-
 arch/mips/pmc-sierra/msp71xx/msp_irq_cic.c |  245
+++++++++++++++++++---------
 arch/mips/pmc-sierra/msp71xx/msp_irq_per.c |  175 ++++++++++++++++++++
 arch/mips/pmc-sierra/msp71xx/msp_setup.c   |    3 +
 arch/mips/pmc-sierra/msp71xx/msp_smp.c     |   75 +++++++++
 arch/mips/pmc-sierra/msp71xx/msp_time.c    |    2 +-
 7 files changed, 463 insertions(+), 89 deletions(-)
 create mode 100644 arch/mips/pmc-sierra/msp71xx/msp_irq_per.c
 create mode 100644 arch/mips/pmc-sierra/msp71xx/msp_smp.c
