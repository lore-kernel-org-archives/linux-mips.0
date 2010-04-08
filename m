Received: from mail-ww0-f49.google.com ([74.125.82.49]:57417 "EHLO
        mail-ww0-f49.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S1492185Ab0DHSwH (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 8 Apr 2010 20:52:07 +0200
MIME-Version: 1.0
Date: Thu, 8 Apr 2010 20:52:00 +0200
Message-ID: <s2y10f740e81004081152u53d1520fp812bd2defe886220@mail.gmail.com>
Subject: [PATCH] mips/txx9: Add missing MODULE_ALIAS definitions for txx9
        platform devices
From: Geert Uytterhoeven <geert@linux-m68k.org>
Content-Type: text/plain; charset=UTF-8
Return-Path: <geert.uytterhoeven@gmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Atsushi Nemoto <anemo@mba.ocn.ne.jp>, Ralf Baechle <ralf@linux-mips.org>
Cc: Linux MIPS Mailing List <linux-mips@linux-mips.org>
Message-ID: <20100408185200.-i2abfaKk9-9jwSHIR1mBoy1TtfTPWG7pBaPJrZ6EX8@z>

Hi Nemoto-san, Ralf-san,

I need the patch below to enable autoloading of the TXx9 sound driver
on my RBTX4927.
It works very nice as a low-power MPD player.
