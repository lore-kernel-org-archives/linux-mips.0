Received: from mail.linuxfoundation.org ([140.211.169.12]:38235 "EHLO
        mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S27007367AbbBZXEFZ0JMK (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 27 Feb 2015 00:04:05 +0100
Date: Thu, 26 Feb 2015 15:03:57 -0800
From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH] Fix offset2lib issue for x86*, ARM*, PowerPC and MIPS
Message-ID: <20150226150357.b9343de08c96cb366d7e1d56@linux-foundation.org>
In-Reply-To: <20150226143815.09386fe280c7bd8797048bb2@linux-foundation.org>
References: <54EB735F.5030207@upv.es>
        <CAGXu5j+SBRcj+BGyxEwUzgKsB2fdzNiPY37Q=JTsf=-QbGwoGA@mail.gmail.com>
        <20150223205436.15133mg1kpyojyik@webmail.upv.es>
        <20150224073906.GA16422@gmail.com>
        <20150226143815.09386fe280c7bd8797048bb2@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-Path: <akpm@linux-foundation.org>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Ingo Molnar <mingo@kernel.org>, Hector Marco Gisbert <hecmargi@upv.es>, Kees Cook <keescook@chromium.org>, LKML <linux-kernel@vger.kernel.org>, ismael Ripoll <iripoll@upv.es>, "x86@kernel.org" <x86@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Linux MIPS Mailing List <linux-mips@linux-mips.org>, linuxppc-dev@lists.ozlabs.org
Message-ID: <20150226230357.gGF06qRqobC-wD2z4Nt9UBh5Ki8eoYrKpBpK-iup6sI@z>

On Thu, 26 Feb 2015 14:38:15 -0800 Andrew Morton <akpm@linux-foundation.org> wrote:

> Does that __weak trick even work?

Nope.

--- a/fs/binfmt_elf.c~fix-offset2lib-issue-for-x86-arm-powerpc-and-mips-fix-fix
+++ a/fs/binfmt_elf.c
@@ -2307,10 +2307,10 @@ unsigned long __weak mmap_rnd(void)
 }
 
 /*
- * Not all architectures use randomize_et_dyn(), so use __weak to let the
- * linker omit it from vmlinux
+ * Not all architectures use randomize_et_dyn(), but there doesn't seem to be
+ * a compile-time way of avoiding its generation.
  */
-unsigned long __weak randomize_et_dyn(unsigned long base)
+unsigned long randomize_et_dyn(unsigned long base)
 {
 	unsigned long ret;
 
_
