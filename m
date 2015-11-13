Received: from mailapp01.imgtec.com ([195.59.15.196]:18881 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27013534AbbKMAsrE9FBl (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 13 Nov 2015 01:48:47 +0100
Date: Fri, 13 Nov 2015 00:48:39 +0000
From: "Maciej W. Rozycki" <macro@imgtec.com>
Subject: [PATCH] MIPS: ELF: Restructure personality macros
In-Reply-To: <alpine.DEB.2.00.1511111418430.7097@tp.orcam.me.uk>
Message-ID: <alpine.DEB.2.00.1511130006430.7097@tp.orcam.me.uk>
References: <alpine.DEB.2.00.1511111418430.7097@tp.orcam.me.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Return-Path: <Maciej.Rozycki@imgtec.com>
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
Cc: Andrew Morton <akpm@linux-foundation.org>, Matthew Fortune <Matthew.Fortune@imgtec.com>, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org
Message-ID: <20151113004839.VXiP9zKoMlMHZes-ZFd09uo5aWyZhr7-eI9TadwXFg8@z>

Update the ELF personality macros used for individual ABIs to make 
actions in the same order across all of them and match formatting too.

Signed-off-by: Maciej W. Rozycki <macro@imgtec.com>
---
linux-mips-set-personality-shuffle.diff
Index: linux-sfr-test/arch/mips/include/asm/elf.h
===================================================================
--- linux-sfr-test.orig/arch/mips/include/asm/elf.h	2015-11-11 02:20:23.314234000 +0000
+++ linux-sfr-test/arch/mips/include/asm/elf.h	2015-11-11 02:20:27.589266000 +0000
@@ -295,17 +295,16 @@ extern struct mips_abi mips_abi_n32;
 
 #define SET_PERSONALITY2(ex, state)					\
 do {									\
-	if (personality(current->personality) != PER_LINUX)		\
-		set_personality(PER_LINUX);				\
-									\
 	clear_thread_flag(TIF_HYBRID_FPREGS);				\
 	set_thread_flag(TIF_32BIT_FPREGS);				\
 									\
-	mips_set_personality_fp(state);					\
-									\
 	current->thread.abi = &mips_abi;				\
 									\
+	mips_set_personality_fp(state);					\
 	mips_set_personality_nan(state);				\
+									\
+	if (personality(current->personality) != PER_LINUX)		\
+		set_personality(PER_LINUX);				\
 } while (0)
 
 #endif /* CONFIG_32BIT */
@@ -316,6 +315,7 @@ do {									\
 #define __SET_PERSONALITY32_N32()					\
 	do {								\
 		set_thread_flag(TIF_32BIT_ADDR);			\
+									\
 		current->thread.abi = &mips_abi_n32;			\
 	} while (0)
 #else
@@ -331,9 +331,9 @@ do {									\
 		clear_thread_flag(TIF_HYBRID_FPREGS);			\
 		set_thread_flag(TIF_32BIT_FPREGS);			\
 									\
-		mips_set_personality_fp(state);				\
-									\
 		current->thread.abi = &mips_abi_32;			\
+									\
+		mips_set_personality_fp(state);				\
 	} while (0)
 #else
 #define __SET_PERSONALITY32_O32(ex, state)				\
