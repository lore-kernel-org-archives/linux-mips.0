Received: from mailapp01.imgtec.com ([195.59.15.196]:46282 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27025160AbcDVRTgni0sU (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 22 Apr 2016 19:19:36 +0200
From: James Hogan <james.hogan@imgtec.com>
Subject: [PATCH 0/4] MIPS: Guest timekeeping improvements
Date: Fri, 22 Apr 2016 18:19:13 +0100
Message-ID: <1461345557-2763-1-git-send-email-james.hogan@imgtec.com>
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
To: Ralf Baechle <ralf@linux-mips.org>
Cc: James Hogan <james.hogan@imgtec.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org
Message-ID: <20160422171913.UcZJnqj9L7Jz5xZjRmcGFyYyl2OjoQuQKOHlrMA0J3U@z>

These patches improve timekeeping of MIPS/Malta kernels running in a KVM
guest.

Patch 2 fixes malta frequency calculation under virtualisation,
especially on very slow targets (FPGA / emulators). Patch 1 is a minor
fix for something I noticed while writing patch 2.

Patch 3 drops the use of the PIT timer for Malta, which is slow to
emulate with KVM + QEMU.

Finally patch 4 calculates min_delta_ns of cevt-r4k dynamically to
handle virtualised environments with software emulated Count/Compare,
and where Count frequency may not be directly related to actual CPU
speed (and so the static value of 0x300 may be no good).

James Hogan (4):
  MIPS: malta-time: Start GIC count before syncing to RTC
  MIPS: malta-time: Take seconds into account
  MIPS: malta-time: Don't use PIT timer for cevt/csrc
  MIPS: cevt-r4k: Dynamically calculate min_delta_ns

 arch/mips/Kconfig                |  1 -
 arch/mips/kernel/cevt-r4k.c      | 82 +++++++++++++++++++++++++++++++++++++++-
 arch/mips/mti-malta/malta-time.c | 50 +++++++++++++++---------
 3 files changed, 113 insertions(+), 20 deletions(-)

Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: linux-mips@linux-mips.org
Cc: linux-kernel@vger.kernel.org
-- 
2.4.10
