Received: from frisell.zx2c4.com ([192.95.5.64]:59340 "EHLO frisell.zx2c4.com"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S23993030AbcKIV1ZO0ti1 (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Wed, 9 Nov 2016 22:27:25 +0100
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3b1bfaf8
        for <linux-mips@linux-mips.org>;
        Wed, 9 Nov 2016 21:25:16 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id f91456ea (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
        for <linux-mips@linux-mips.org>;
        Wed, 9 Nov 2016 21:25:15 +0000 (UTC)
Received: by mail-lf0-f44.google.com with SMTP id t196so175160061lff.3
        for <linux-mips@linux-mips.org>; Wed, 09 Nov 2016 13:27:16 -0800 (PST)
MIME-Version: 1.0
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 9 Nov 2016 22:27:13 +0100
Message-ID: <CAHmME9oSUcAXVMhpLt0bqa9DKHE8rd3u+3JDb_wgviZnOpP7JA@mail.gmail.com>
Subject: Proposal: HAVE_SEPARATE_IRQ_STACK?
Content-Type: text/plain; charset=UTF-8
Return-Path: <Jason@zx2c4.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: LKML <linux-kernel@vger.kernel.org>, linux-mips@linux-mips.org, linux-mm@kvack.org, Thomas Gleixner <tglx@linutronix.de>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>, k@vodka.home.kg
Message-ID: <20161109212713.zwXzUnNpbpzyXQo2m0kbckXq4zr3VNLGVB__l8aQ5ss@z>

Hi folks,

I do some ECC crypto in a kthread. A fast 32bit implementation usually
uses around 2k - 3k bytes of stack. Since kernel threads get 8k, I
figured this would be okay. And for the most part, it is. However,
everything falls apart on architectures like MIPS, which do not use a
separate irq stack.
