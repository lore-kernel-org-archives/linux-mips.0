Received: from localhost.localdomain ([127.0.0.1]:51359 "EHLO
	dl5rb.ham-radio-op.net") by ftp.linux-mips.org with ESMTP
	id S20021756AbXGJR03 (ORCPT <rfc822;linux-mips@linux-mips.org>);
	Tue, 10 Jul 2007 18:26:29 +0100
Date: Tue, 10 Jul 2007 18:15:50 +0100
From: Ralf Baechle <ralf@linux-mips.org>
Subject: Re: [PATCH] [MIPS] Fix resume for 64K page size
Message-ID: <20070710171550.GA10909@linux-mips.org>
References: <11840880513393-git-send-email-pwatkins@sicortex.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <11840880513393-git-send-email-pwatkins@sicortex.com>
Return-Path: <ralf@linux-mips.org>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: pwatkins@sicortex.com
Cc: linux-mips@linux-mips.org
Message-ID: <20070710171550._J3U9EoiLdwQ7UVFgMwdDSjjWPmdn9-Jc-is5NJuk3g@z>

On Tue, Jul 10, 2007 at 01:20:51PM -0400, pwatkins@sicortex.com wrote:

> This fixes a bug when running 64K page size on r4k machines. 

Thanks, applied.

  Ralf
