Received: from mx0b-00082601.pphosted.com ([67.231.153.30]:37822 "EHLO
        mx0a-00082601.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by eddie.linux-mips.org with ESMTP id S23994220AbeK3UmzNbZzk convert rfc822-to-8bit
        (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Fri, 30 Nov 2018 21:42:55 +0100
From: Chris Mason <clm@fb.com>
Subject: Re: [PATCH RFC 00/15] Zero ****s, hugload of hugs <3
Date: Fri, 30 Nov 2018 20:42:23 +0000
Message-ID: <AEA525BC-406E-4C8C-BD7A-90FB65571255@fb.com>
References: <20181130192737.15053-1-jarkko.sakkinen@linux.intel.com>
 <CAGXu5j+jBNBsD3pvUSfEh6Lc5T1YMpbM0HeG1c6BHiJe+cKVOQ@mail.gmail.com>
In-Reply-To: <CAGXu5j+jBNBsD3pvUSfEh6Lc5T1YMpbM0HeG1c6BHiJe+cKVOQ@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
Return-Path: <prvs=58725a35c8=clm@fb.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Kees Cook <keescook@chromium.org>
Cc: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>, LKML <linux-kernel@vger.kernel.org>, Amir Goldstein <amir73il@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Daniel Axtens <dja@axtens.net>, "David S. Miller" <davem@davemloft.net>, Dominik Brodowski <linux@dominikbrodowski.net>, Maling list - DRI developers <dri-devel@lists.freedesktop.org>, Eric Dumazet <edumazet@google.com>, "federico.vaga@vaga.pv.it" <federico.vaga@vaga.pv.it>, Geert Uytterhoeven <geert+renesas@glider.be>, Helge Deller <deller@gmx.de>, Jonathan Corbet <corbet@lwn.net>, Joshua Kinard <kumba@gentoo.org>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, "linux-ide@vger.kernel.org" <linux-ide@vger.kernel.org>, "linux-m68k@lists.linux-m68k.org" <linux-m68k@lists.linux-m68k.org>, Linux Media Mailing List <linux-media@vger.kernel.org>, Linux MIPS Mailing List <linux-mips@linux-mips.org>, Linux mtd <linux-mtd@lists.infradead.org>, linux-parisc <linux-parisc@vger.kernel.org>, Linux PM list <linux-pm@vger.kernel.org>, "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, Network Development <netdev@vger.kernel.org>, nouveau <nouveau@lists.freedesktop.org>, Paolo Abeni <pabeni@redhat.com>, Paul Burton <paul.burton@mips.com>, Petr Mladek <pmladek@suse.com>, Rob Herring <robh@kernel.org>, "sean.wang@mediatek.com" <sean.wang@mediatek.com>, Sergey Senozhatsky <sergey.senozhatsky@gmail.com>, "shannon.nelson@oracle.com" <shannon.nelson@oracle.com>, Stefano Brivio <sbrivio@redhat.com>, Steven Rostedt <rostedt@goodmis.org>, "Tobin C. Harding" <me@tobin.cc>, "makita.toshiaki@lab.ntt.co.jp" <makita.toshiaki@lab.ntt.co.jp>, Willem de Bruijn <willemb@google.com>, Yonghong Song <yhs@fb.com>, "yanjun.zhu@oracle.com" <yanjun.zhu@oracle.com>

On 30 Nov 2018, at 14:40, Kees Cook wrote:

> On Fri, Nov 30, 2018 at 11:27 AM Jarkko Sakkinen
> <jarkko.sakkinen@linux.intel.com> wrote:
>>
>> In order to comply with the CoC, replace **** with a hug.
>
> Heh. I support the replacement of the stronger language, but I find
> "hug", "hugged", and "hugging" to be very weird replacements. Can we
> bikeshed this to "heck", "hecked", and "hecking" (or "heckin" to
> follow true Doggo meme style).
>
> "This API is hugged" doesn't make any sense to me. "This API is
> hecked" is better, or at least funnier (to me). "Hug this interface"
> similarly makes no sense, but "Heck this interface" seems better.
> "Don't touch my hecking code", "What the heck were they thinking?"
> etc... "hug" is odd.
>
> Better yet, since it's only 17 files, how about doing context-specific
> changes? "This API is terrible", "Hateful interface", "Don't touch my
> freakin' code", "What in the world were they thinking?" etc?

I think the bar for changing the documentation/comments should be 
improvement in the clarity or approachability of whatever is being 
changed.

This patch set is kind of like Linus sitting at kernel summit with a 
sign that says "Free Hugs".  Kind of confusing, and really unlikely to 
make anyone involved happier about working on the kernel.

Jarkko, making things clearer and more approachable is absolutely worth 
the time if you're interested, but I think it'll mean larger and more 
individualized changes to these files.

-chris
