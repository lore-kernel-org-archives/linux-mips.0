Received: from mailapp01.imgtec.com ([195.59.15.196]:23410 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23992703AbcLUMNp5nCFz (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 21 Dec 2016 13:13:45 +0100
Date: Wed, 21 Dec 2016 12:13:28 +0000
From: "Maciej W. Rozycki" <macro@imgtec.com>
Subject: Re: [PATCH v3 3/5] MIPS: Only change $28 to thread_info if coming
 from user mode
In-Reply-To: <1482157260-18730-4-git-send-email-matt.redfearn@imgtec.com>
Message-ID: <alpine.DEB.2.00.1612211212140.6743@tp.orcam.me.uk>
References: <1482157260-18730-1-git-send-email-matt.redfearn@imgtec.com> <1482157260-18730-4-git-send-email-matt.redfearn@imgtec.com>
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
To: Matt Redfearn <matt.redfearn@imgtec.com>
Cc: Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org, "Jason A . Donenfeld" <Jason@zx2c4.com>, Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org, James Hogan <james.hogan@imgtec.com>, Paul Burton <paul.burton@imgtec.com>
Message-ID: <20161221121328.4I7bkLsH03bifDnzd73MBf2kshm4pgNzRmMSSvjFx3A@z>

On Mon, 19 Dec 2016, Matt Redfearn wrote:

> Changes in v3:
> Drop superfluous nop that would have been in delay slot with .set
> noreorder but is no longer required now that the code is .set reorder.

LGTM

Reviewed-by: Maciej W. Rozycki <macro@imgtec.com>

  Maciej
