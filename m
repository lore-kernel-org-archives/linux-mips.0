Received: from mga03.intel.com ([134.134.136.65]:37915 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S23993837AbeK3VgPIm4lP (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Fri, 30 Nov 2018 22:36:15 +0100
Date: Fri, 30 Nov 2018 13:36:13 -0800
From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Subject: Re: [PATCH RFC 00/15] Zero ****s, hugload of hugs <3
Message-ID: <20181130213613.GE23772@linux.intel.com>
References: <20181130192737.15053-1-jarkko.sakkinen@linux.intel.com>
 <CAGXu5j+jBNBsD3pvUSfEh6Lc5T1YMpbM0HeG1c6BHiJe+cKVOQ@mail.gmail.com>
 <AEA525BC-406E-4C8C-BD7A-90FB65571255@fb.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AEA525BC-406E-4C8C-BD7A-90FB65571255@fb.com>
Return-Path: <jarkko.sakkinen@linux.intel.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Chris Mason <clm@fb.com>
Cc: Kees Cook <keescook@chromium.org>, LKML <linux-kernel@vger.kernel.org>, Amir Goldstein <amir73il@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Daniel Axtens <dja@axtens.net>, "David S. Miller" <davem@davemloft.net>, Dominik Brodowski <linux@dominikbrodowski.net>, Maling list - DRI developers <dri-devel@lists.freedesktop.org>, Eric Dumazet <edumazet@google.com>, "federico.vaga@vaga.pv.it" <federico.vaga@vaga.pv.it>, Geert Uytterhoeven <geert+renesas@glider.be>, Helge Deller <deller@gmx.de>, Jonathan Corbet <corbet@lwn.net>, Joshua Kinard <kumba@gentoo.org>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, "linux-ide@vger.kernel.org" <linux-ide@vger.kernel.org>, "linux-m68k@lists.linux-m68k.org" <linux-m68k@lists.linux-m68k.org>, Linux Media Mailing List <linux-media@vger.kernel.org>, Linux MIPS Mailing List <linux-mips@linux-mips.org>, Linux mtd <linux-mtd@lists.infradead.org>, linux-parisc <linux-parisc@vger.kernel.org>, Linux PM list <linux-pm@vger.kernel.org>, "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, Network Development <netdev@vger.kernel.org>, nouveau <nouveau@lists.freedesktop.org>, Paolo Abeni <pabeni@redhat.com>, Paul Burton <paul.burton@mips.com>, Petr Mladek <pmladek@suse.com>, Rob Herring <robh@kernel.org>, "sean.wang@mediatek.com" <sean.wang@mediatek.com>, Sergey Senozhatsky <sergey.senozhatsky@gmail.com>, "shannon.nelson@oracle.com" <shannon.nelson@oracle.com>, Stefano Brivio <sbrivio@redhat.com>, Steven Rostedt <rostedt@goodmis.org>, "Tobin C. Harding" <me@tobin.cc>, "makita.toshiaki@lab.ntt.co.jp" <makita.toshiaki@lab.ntt.co.jp>, Willem de Bruijn <willemb@google.com>, Yonghong Song <yhs@fb.com>, "yanjun.zhu@oracle.com" <yanjun.zhu@oracle.com>

On Fri, Nov 30, 2018 at 08:42:23PM +0000, Chris Mason wrote:
> I think the bar for changing the documentation/comments should be 
> improvement in the clarity or approachability of whatever is being 
> changed.
> 
> This patch set is kind of like Linus sitting at kernel summit with a 
> sign that says "Free Hugs".  Kind of confusing, and really unlikely to 
> make anyone involved happier about working on the kernel.
> 
> Jarkko, making things clearer and more approachable is absolutely worth 
> the time if you're interested, but I think it'll mean larger and more 
> individualized changes to these files.

Fully 110% agree.

/Jarkko
