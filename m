Return-Path: <linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 267B6C433DB
	for <linux-mips@archiver.kernel.org>; Sun, 14 Feb 2021 05:03:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EA22B64E56
	for <linux-mips@archiver.kernel.org>; Sun, 14 Feb 2021 05:02:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229494AbhBNFCo (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Sun, 14 Feb 2021 00:02:44 -0500
Received: from mail-02.mail-europe.com ([51.89.119.103]:44962 "EHLO
        mail-02.mail-europe.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229458AbhBNFCl (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 14 Feb 2021 00:02:41 -0500
Date:   Sun, 14 Feb 2021 05:01:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1613278877;
        bh=s/e4P2IDRZNLGtyg8JnDNwu+y29GcDaZPOLJIxcQG3Y=;
        h=Date:To:From:Reply-To:Subject:From;
        b=AFjRTnuEjeRxf2qIMiD12X7vZD4K4F1RHF0dSAHAqPcmq7aDWerZFggDCjUzKynE1
         NZq9ShP7NcaVLMrKDHyMeheXf35L21+dleBJWjgVpj0c0Vy5iJWUy9wVao4ZcmReTa
         cRsKkQHvq48S3xzpt118L33vZ2ArFLn7ITnZW6Ls=
To:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
From:   Ryan Burns <rtburns@protonmail.com>
Reply-To: Ryan Burns <rtburns@protonmail.com>
Subject: [PATCH] MIPS: tools: fix build on macOS
Message-ID: <z_0h2JVlIGgyiySXEyOmFhJ5_rl_EmuXR7beRMunMZRivpcO0H7LqsGa6ePHdSTkF521jUnXMM9TZb5N9mM4fduiHAxpshUkCBd7Owo43tM=@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

macOS does not have byteswap.h, but we can use Apple's libkern/OSByteOrder.=
h instead.

This issue is encountered during cross-compilation from macOS to MIPS in ni=
xpkgs.
You can view a log of the build failure here:
https://hydra.nixos.org/build/136015790/nixlog/1
=C2=A0=C2=A0=C2=A0
Signed-off-by: Ryan Burns <rtburns@protonmail.com>
---
arch/mips/boot/tools/relocs.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 11 +++++++++-=
-
arch/mips/boot/tools/relocs_main.c |=C2=A0 1 -
arch/mips/tools/elf-entry.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 11 =
+++++++++--
3 files changed, 18 insertions(+), 5 deletions(-)

diff --git a/arch/mips/boot/tools/relocs.h b/arch/mips/boot/tools/relocs.h
index 607ff0103064..5de9bb7a7e09 100644
--- a/arch/mips/boot/tools/relocs.h
+++ b/arch/mips/boot/tools/relocs.h
@@ -11,9 +11,16 @@
#include <errno.h>
#include <unistd.h>
#include <elf.h>
-#include <byteswap.h>
#define USE_BSD
-#include <endian.h>
+#if defined(__APPLE__)
+# include <libkern/OSByteOrder.h>
+# define bswap_16 OSSwapInt16
+# define bswap_32 OSSwapInt32
+# define bswap_64 OSSwapInt64
+#else
+# include <byteswap.h>
+# include <endian.h>
+#endif
#include <regex.h>

void die(char *fmt, ...);
diff --git a/arch/mips/boot/tools/relocs_main.c b/arch/mips/boot/tools/relo=
cs_main.c
index e2453a564b11..4ef51d1e6d0d 100644
--- a/arch/mips/boot/tools/relocs_main.c
+++ b/arch/mips/boot/tools/relocs_main.c
@@ -6,7 +6,6 @@
#include <stdlib.h>
#include <string.h>
#include <errno.h>
-#include <endian.h>
#include <elf.h>

#include "relocs.h"
diff --git a/arch/mips/tools/elf-entry.c b/arch/mips/tools/elf-entry.c
index dbd14ff05b4c..5d2e2ab4b3b0 100644
--- a/arch/mips/tools/elf-entry.c
+++ b/arch/mips/tools/elf-entry.c
@@ -1,7 +1,14 @@
// SPDX-License-Identifier: GPL-2.0
-#include <byteswap.h>
+#if defined(__APPLE__)
+# include <libkern/OSByteOrder.h>
+# define bswap_16 OSSwapInt16
+# define bswap_32 OSSwapInt32
+# define bswap_64 OSSwapInt64
+#else
+# include <byteswap.h>
+# include <endian.h>
+#endif
#include <elf.h>
-#include <endian.h>
#include <inttypes.h>
#include <stdint.h>
#include <stdio.h>
