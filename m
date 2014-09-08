Received: from mailapp01.imgtec.com ([195.59.15.196]:38099 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27008454AbaIHOMzOH0BA (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 8 Sep 2014 16:12:55 +0200
Message-ID: <540DB95F.6070609@imgtec.com>
Date: Mon, 8 Sep 2014 15:12:47 +0100
From: Markos Chandras <Markos.Chandras@imgtec.com>
MIME-Version: 1.0
Subject: Release of Linux MTI-3.14-LTS kernel
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
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
Cc: linux-kernel@vger.kernel.org
Message-ID: <20140908141247.bTqf7YfFchRR4ZA6apCXKE-HiUOKkiLgLgUQ6cOTDR8@z>

Imagination Technologies is pleased to announce the release of its 3.14
LTS (Long-Term Support) MIPS kernel. The changelog below is based off
the stable Linux 3.14.10 release done by Greg Kroah-Hartman in commit
bbae7add628cfe96a1facd578dd1eddcd1030de7 back on June 30th. The code
repository is hosted at the Linux/MIPS project GIT:

http://git.linux-mips.org/?p=linux-mti.git;a=shortlog;h=refs/heads/linux-mti-3.14

We look forward to any comments or feedback.

        The Imagination MIPS Kernel Team


ChangeLog:

Upstream:
- Move to Linux 3.14.10

Userland visible changes:
- MIPS 32/64 seccomp support
- Do not set any FCSR cause bits from userland

Boot setup related changes:
- SMP/CPS support
- Deprecate SMP/CMP

New drivers and features:
- m5150 support
- p5600 support
- perf support for interAptiv/proAptiv/p5600
- EVA support
- Malta power management support
- Malta powering down support
- Hardware Table Walker support
- MAAR support
- Dedicated RI/XI exception handlers
- Hotplug support
- cpuidle support

Developer visible changes:
- SMTC removal
- Enable DEVTMPFS on malta_defconfigs
- Add more microassembler instructions
- 16K by default on Malta SMP defconfigs
- Set max cpus to 8 on Malta SMP defconfigs

Fixes:
- Detect instruction cache aliases
- Fix 1074K CPU support
- GIC fixes
- KVM T&E fixes
- sead3/BE networking fix
- Misc other code fixes, build fixes and cleanups

-- 
markos
