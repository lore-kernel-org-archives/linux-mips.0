Received: from mailapp01.imgtec.com ([195.59.15.196]:29088 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27043666AbcFXWmxAtxlY (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Sat, 25 Jun 2016 00:42:53 +0200
From: James Hogan <james.hogan@imgtec.com>
Subject: [PATCH v4 0/2] kbuild: Remove stale asm-generic wrappers
Date: Fri, 24 Jun 2016 23:42:22 +0100
Message-ID: <1466808144-23209-1-git-send-email-james.hogan@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
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
To: Thomas Gleixner <tglx@linutronix.de>
Cc: linux-kernel@vger.kernel.org, James Hogan <james.hogan@imgtec.com>, Michal Marek <mmarek@suse.com>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, Jonathan Corbet <corbet@lwn.net>, Arnd Bergmann <arnd@arndb.de>, Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@imgtec.com>, Florian Fainelli <f.fainelli@gmail.com>, Heinrich Schuchardt <xypron.glpk@gmx.de>, linux-kbuild@vger.kernel.org, x86@kernel.org, linux-doc@vger.kernel.org, linux-arch@vger.kernel.org, linux-mips@linux-mips.org
Message-ID: <20160624224222.Gzl0r38_CLdiKF7m5EZTKGyxQ1Ofrv1rT4FW0NXyOR4@z>

This patchset attempts to fix kbuild to automatically remove stale
asm-generic wrappers, i.e. when files are removed from generic-y and
added directly into arch/*/include/uapi/asm/, but where the existing
wrapper in arch/*/include/generated/asm/ continues to be used.

MIPS was recently burned by this in v4.3 (see patch 2), with continuing
reports of build failures when people upgrade their trees, which go away
after arch/mips/include/generated is removed (or reportedly make
mrproper/distclean). It is particularly irritating during bisection.

Since v2 I've seen other cases of this breaking MIPS build, and testing
on x86_64, starting a build first on v4.0 and then on mainline with this
patchset shows one stale generated header:
  REMOVE  arch/x86/include/generated/asm/scatterlist.h

Changes in v4:
- None (resend on Thomas Gleixner's request).

Changes in v3:
- Ensure FORCE actually gets marked .PHONY.

Changes in v2:
- New patch 1 to add tracking of generated headers that aren't generic-y
  wrappers, via generated-y, particularly for x86 (thanks to kbuild test
  robot).
- Rewrite a bit, drawing inspiration from Makefile.headersinst.
- Exclude genhdr-y and generated-y (thanks to kbuild test robot).

James Hogan (2):
  kbuild, x86: Track generated headers with generated-y
  kbuild: Remove stale asm-generic wrappers

 Documentation/kbuild/makefiles.txt | 14 ++++++++++++++
 arch/x86/include/asm/Kbuild        |  6 ++++++
 scripts/Makefile.asm-generic       | 17 ++++++++++++++++-
 3 files changed, 36 insertions(+), 1 deletion(-)

Cc: Michal Marek <mmarek@suse.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: Paul Burton <paul.burton@imgtec.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>
Cc: Heinrich Schuchardt <xypron.glpk@gmx.de>
Cc: linux-kbuild@vger.kernel.org
Cc: x86@kernel.org
Cc: linux-doc@vger.kernel.org
Cc: linux-arch@vger.kernel.org
Cc: linux-mips@linux-mips.org
-- 
2.4.10
