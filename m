Received: from ms.lwn.net ([45.79.88.28]:53924 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S23992919AbeK3VEdL3pFk (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Fri, 30 Nov 2018 22:04:33 +0100
Date: Fri, 30 Nov 2018 14:04:27 -0700
From: Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH RFC 00/15] Zero ****s, hugload of hugs <3
Message-ID: <20181130140427.1d4fd1c1@lwn.net>
In-Reply-To: <20181130205521.GA21006@linux.intel.com>
References: <20181130192737.15053-1-jarkko.sakkinen@linux.intel.com>
        <CAGXu5j+jBNBsD3pvUSfEh6Lc5T1YMpbM0HeG1c6BHiJe+cKVOQ@mail.gmail.com>
        <20181130195652.7syqys76646kpaph@linux-r8p5>
        <20181130205521.GA21006@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Return-Path: <corbet@lwn.net>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Cc: Davidlohr Bueso <dave@stgolabs.net>, Kees Cook <keescook@chromium.org>, LKML <linux-kernel@vger.kernel.org>, Amir Goldstein <amir73il@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Daniel Axtens <dja@axtens.net>, "David S. Miller" <davem@davemloft.net>, Dominik Brodowski <linux@dominikbrodowski.net>, Maling list - DRI developers <dri-devel@lists.freedesktop.org>, Eric Dumazet <edumazet@google.com>, federico.vaga@vaga.pv.it, Geert Uytterhoeven <geert+renesas@glider.be>, Helge Deller <deller@gmx.de>, Joshua Kinard <kumba@gentoo.org>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, linux-ide@vger.kernel.org, linux-m68k@lists.linux-m68k.org, Linux Media Mailing List <linux-media@vger.kernel.org>, Linux MIPS Mailing List <linux-mips@linux-mips.org>, Linux mtd <linux-mtd@lists.infradead.org>, linux-parisc <linux-parisc@vger.kernel.org>, Linux PM list <linux-pm@vger.kernel.org>, linux-scsi@vger.kernel.org, matthias.bgg@gmail.com, Network Development <netdev@vger.kernel.org>, nouveau <nouveau@lists.freedesktop.org>, Paolo Abeni <pabeni@redhat.com>, Paul Burton <paul.burton@mips.com>, Petr Mladek <pmladek@suse.com>, Rob Herring <robh@kernel.org>, sean.wang@mediatek.com, Sergey Senozhatsky <sergey.senozhatsky@gmail.com>, shannon.nelson@oracle.com, Stefano Brivio <sbrivio@redhat.com>, Steven Rostedt <rostedt@goodmis.org>, "Tobin C. Harding" <me@tobin.cc>, makita.toshiaki@lab.ntt.co.jp, Willem de Bruijn <willemb@google.com>, Yonghong Song <yhs@fb.com>, yanjun.zhu@oracle.com

On Fri, 30 Nov 2018 12:55:21 -0800
Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com> wrote:

> This a direct quote from the CoC:
> 
> "Harassment includes the use of abusive, offensive or degrading
> language, intimidation, stalking, harassing photography or recording,
> inappropriate physical contact, sexual imagery and unwelcome sexual
> advances or requests for sexual favors."

...and this is from the interpretation document:

> Contributions submitted for the kernel should use appropriate language.
> Content that already exists predating the Code of Conduct will not be
> addressed now as a violation.

So existing code is explicitly not a CoC violation and need not be
treated as such.  That said, improvements to the comments are always
welcome, as long as they are actually improvements.

Thanks,

jon
