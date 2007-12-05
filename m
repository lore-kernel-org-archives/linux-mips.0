Received: from localhost.localdomain ([127.0.0.1]:21412 "EHLO
	dl5rb.ham-radio-op.net") by ftp.linux-mips.org with ESMTP
	id S20030716AbXLESWc (ORCPT <rfc822;linux-mips@linux-mips.org>);
	Wed, 5 Dec 2007 18:22:32 +0000
Date: Wed, 5 Dec 2007 18:21:06 +0000
From: Ralf Baechle <ralf@linux-mips.org>
Subject: Re: [PATCH 2/2] Alchemy: fix IRQ bases
Message-ID: <20071205182106.GB10697@linux-mips.org>
References: <200712051908.26703.sshtylyov@ru.mvista.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <200712051908.26703.sshtylyov@ru.mvista.com>
Return-Path: <ralf@linux-mips.org>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Sergei Shtylyov <sshtylyov@ru.mvista.com>
Cc: linux-mips@linux-mips.org

On Wed, Dec 05, 2007 at 07:08:26PM +0300, Sergei Shtylyov wrote:

> Do what the commits commits f3e8d1da389fe2e514e31f6e93c690c8e1243849 and
> 9d360ab4a7568a8d177280f651a8a772ae52b9b9 failed to achieve -- actually
> convert the Alchemy code to irq_cpu.

Applied, thanks.

  Ralf
