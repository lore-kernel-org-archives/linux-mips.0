Received: from localhost.localdomain ([127.0.0.1]:19932 "EHLO
	dl5rb.ham-radio-op.net") by ftp.linux-mips.org with ESMTP
	id S20031765AbXLGLh6 (ORCPT <rfc822;linux-mips@linux-mips.org>);
	Fri, 7 Dec 2007 11:37:58 +0000
Date: Fri, 7 Dec 2007 01:55:20 +0000
From: Ralf Baechle <ralf@linux-mips.org>
Subject: Re: [PATCH] Alchemy: Fix Au1x SD controller IRQ
Message-ID: <20071207015519.GA1231@linux-mips.org>
References: <20071206071156.GA20211@roarinelk.homelinux.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20071206071156.GA20211@roarinelk.homelinux.net>
Return-Path: <ralf@linux-mips.org>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Manuel Lauss <mano@roarinelk.homelinux.net>
Cc: linux-mips@linux-mips.org

On Thu, Dec 06, 2007 at 08:11:56AM +0100, Manuel Lauss wrote:

> With the introduction of MIPS_CPU_IRQ_BASE, the hardcoded IRQ number
> of the au1100/au1200 SD controller(s) is no longer valid.
> 
> Signed-off-by: Manuel Lauss <mano@roarinelk.homelinux.net>

Thanks, applied.

  Ralf
