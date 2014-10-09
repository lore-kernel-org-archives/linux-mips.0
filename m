Received: from mailapp01.imgtec.com ([195.59.15.196]:35029 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27010912AbaJIJefbxd5C (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 9 Oct 2014 11:34:35 +0200
Received: from KLMAIL01.kl.imgtec.org (unknown [192.168.5.35])
        by Websense Email Security Gateway with ESMTPS id 8D866208D327C
        for <linux-mips@linux-mips.org>; Thu,  9 Oct 2014 10:34:26 +0100 (IST)
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH 0/3] Malta/SEAD3 kernel image size patches for 3.18
Date: Thu, 9 Oct 2014 10:34:18 +0100
Message-ID: <1412847261-7930-1-git-send-email-markos.chandras@imgtec.com>
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
Message-ID: <20141009093418.P1CW05JzoZb2Kbnp1BLSWj9ZtWuIckWydxS8KE64YG0@z>

Hi,

A few patches to reduce the size of the kernel image for Malta and SEAD3 by
improving the dependencies on certain source files.

A different approach for i2c and led patches has been posted before:
http://patchwork.linux-mips.org/patch/5802/

Even though none of the original requests have been addressed, I still feel
these patches do not make things any worse.

Hopefully not too late for 3.18

Markos Chandras (3):
  MIPS: Malta: Do not build the malta-amon.c file if CMP is not enabled
  MIPS: sead3: Build the I2C related devices if CONFIG_I2C is enabled
  MIPS: sead3: Only build the led driver is LEDS_CLASS is enabled

 arch/mips/mti-malta/Makefile | 3 ++-
 arch/mips/mti-sead3/Makefile | 7 +++----
 2 files changed, 5 insertions(+), 5 deletions(-)

-- 
2.1.2
