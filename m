Received: from mail-ig0-f181.google.com ([209.85.213.181]:45228 "EHLO
        mail-ig0-f181.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S27007628AbaLAWCEfzeMH (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 1 Dec 2014 23:02:04 +0100
Received: by mail-ig0-f181.google.com with SMTP id l13so10411901iga.2
        for <linux-mips@linux-mips.org>; Mon, 01 Dec 2014 14:01:58 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAMuHMdXHAZFujShNnAHY8BRv85ncrtcRvRgPS0Br0T9gSxZ+1A@mail.gmail.com>
References: <547CD304.20407@gmail.com>
        <CAMo8BfKg=eb7wA2O+cKO+oLDDERh2CKBS7dyAvfqvCESEHWYEg@mail.gmail.com>
        <CAMuHMdXHAZFujShNnAHY8BRv85ncrtcRvRgPS0Br0T9gSxZ+1A@mail.gmail.com>
Date: Mon, 1 Dec 2014 17:01:58 -0500
Message-ID: <CAE2sS1hDXqLvF9yY5-3d4pmDPiQy8aQ1fYov3_+BKM8uQ3ZSwA@mail.gmail.com>
Subject: Re: [PATCH] arch: uapi: asm: mman.h: Support MADV_FREE for madvise()
From: "Carlos O'Donell" <carlos@systemhalted.org>
Content-Type: text/plain; charset=UTF-8
Return-Path: <carlos@systemhalted.org>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Max Filippov <jcmvbkbc@gmail.com>, Chen Gang <gang.chen.5i5j@gmail.com>, Minchan Kim <minchan@kernel.org>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "rth@twiddle.net" <rth@twiddle.net>, "ink@jurassic.park.msu.ru" <ink@jurassic.park.msu.ru>, "mattst88@gmail.com" <mattst88@gmail.com>, Ralf Baechle <ralf@linux-mips.org>, "jejb@parisc-linux.org" <jejb@parisc-linux.org>, "deller@gmx.de" <deller@gmx.de>, "chris@zankel.net" <chris@zankel.net>, "linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>, "linux-mips@linux-mips.org" <linux-mips@linux-mips.org>, "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>, "linux-xtensa@linux-xtensa.org" <linux-xtensa@linux-xtensa.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>
Message-ID: <20141201220158.XxEJeGQ7CV1pEj91wrOLf8zjlxMVDw1C50SSm7c7CAI@z>

On Mon, Dec 1, 2014 at 4:35 PM, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Mon, Dec 1, 2014 at 9:52 PM, Max Filippov <jcmvbkbc@gmail.com> wrote:
>> On Mon, Dec 1, 2014 at 11:43 PM, Chen Gang <gang.chen.5i5j@gmail.com> wrote:
>>> At present, kernel supports madvise(MADV_FREE), so can benefit to all
>>> related architectures (can grep MADV_WILLNEED or MADV_REMOVE in "arch/"
>>> to know about all related architectures).
>>
>> A similar patch has been posted a while ago:
>>
>> http://www.spinics.net/lists/linux-mm/msg81538.html
>
> Would it be possible to use the same number everywhere?

Yes please. It's ridiculous that we still need patches like this.

I proposed unifying all this two years ago, but didn't follow up.
