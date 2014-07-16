Received: from mailapp01.imgtec.com ([195.59.15.196]:23545 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S6816671AbaGPNqvOZhhi (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 16 Jul 2014 15:46:51 +0200
Received: from KLMAIL01.kl.imgtec.org (unknown [192.168.5.35])
        by Websense Email Security Gateway with ESMTPS id 9F2B297B9D3B5
        for <linux-mips@linux-mips.org>; Wed, 16 Jul 2014 14:46:40 +0100 (IST)
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH] MIPS: smartmips: Disable assembler warnings
Date: Wed, 16 Jul 2014 14:46:31 +0100
Message-ID: <1405518391-9260-1-git-send-email-markos.chandras@imgtec.com>
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
Message-ID: <20140716134631.L8SoKBWee6ij1HxxEtGjjQFqPDtTwOYw9WVyIo74p5U@z>

The kernel code overrides the default ISA as passed by the compiler
in quite a few places. This has unfortunate side effects when smartmips
is enabled leading to hundreds of warnings during build such as:

{standard input}: Assembler messages:
{standard input}:411: Warning: the `smartmips' extension requires MIPS32
revision 1 or greater
{standard input}: Assembler messages:
{standard input}:43: Warning: the 64-bit MIPS architecture does not support the
`smartmips' extension
[...]

Until the kernel code is fixed properly (if possible), disable all the
assembler warning messages to make the build logs readable again.
This has no runtime side effects but it makes it easier to spot
more critical warnings and problems during build.

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 arch/mips/Makefile | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/arch/mips/Makefile b/arch/mips/Makefile
index a8521de14791..7868f993dfbc 100644
--- a/arch/mips/Makefile
+++ b/arch/mips/Makefile
@@ -113,7 +113,16 @@ predef-le += -DMIPSEL -D_MIPSEL -D__MIPSEL -D__MIPSEL__
 cflags-$(CONFIG_CPU_BIG_ENDIAN)		+= $(shell $(CC) -dumpmachine |grep -q 'mips.*el-.*' && echo -EB $(undef-all) $(predef-be))
 cflags-$(CONFIG_CPU_LITTLE_ENDIAN)	+= $(shell $(CC) -dumpmachine |grep -q 'mips.*el-.*' || echo -EL $(undef-all) $(predef-le))
 
-cflags-$(CONFIG_CPU_HAS_SMARTMIPS)	+= $(call cc-option,-msmartmips)
+# For smartmips configurations, there are hundreds of warnings due to ISA overrides
+# in assembly and header files. smartmips is only supported for MIPS32r1 onwards
+# and there is no support for 64-bit. Various '.set mips2' or '.set mips3' or
+# similar directives in the kernel will spam the build logs with the following warnings:
+# Warning: the `smartmips' extension requires MIPS32 revision 1 or greater
+# or
+# Warning: the 64-bit MIPS architecture does not support the `smartmips' extension
+# Pass -Wa,--no-warn to disable all assembler warnings until the kernel code has
+# been fixed properly.
+cflags-$(CONFIG_CPU_HAS_SMARTMIPS)	+= $(call cc-option,-msmartmips) -Wa,--no-warn
 cflags-$(CONFIG_CPU_MICROMIPS) += $(call cc-option,-mmicromips)
 
 cflags-$(CONFIG_SB1XXX_CORELIS)	+= $(call cc-option,-mno-sched-prolog) \
-- 
2.0.0
